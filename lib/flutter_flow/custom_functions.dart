import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

String getGreetingMessage() {
  // Displaying Appropriate Greetings (Good Morning/Afternoon/Evening) Based on User's Time
  DateTime now = DateTime.now();
  int hour = now.hour;
  if (hour >= 5 && hour < 12) {
    return 'Good Morning';
  } else if (hour >= 12 && hour < 17) {
    return 'Good Afternoon';
  } else {
    return 'Good Evening';
  }
}

String convertToTitleCase(String? initial) {
  if (initial != null && initial.isNotEmpty) {
    // Split the input string by space
    List<String> words = initial.trim().split(' ');
    // Get the first letter of each word and concatenate them
    String initials = '';
    for (String word in words) {
      if (word.isNotEmpty) {
        initials += word[0].toUpperCase();
      }
    }
    return initials;
  } else {
    // Return default value when initial is null or empty
    return ''; // or any other default value
  }
}

ChartDataStruct convertExerciseScoreToChartDataMonth(
    List<DayScoresDataRecord> dayScoreData) {
  final now = DateTime.now();
  final daysInMonth = DateTime(now.year, now.month + 1, 0)
      .day; // Get the total number of days in the current month

  List<int> xAxis = [];
  List<double> yAxis = [];

  for (var i = 1; i <= daysInMonth; i++) {
    xAxis.add(i);

    // Find the DayScoresDataRecord for the current day
    DayScoresDataRecord? dayScore;
    try {
      dayScore = dayScoreData.firstWhere((element) => element.date?.day == i);
      // Add the total score to the yAxis
      yAxis.add(dayScore.totalScore);
    } catch (_) {
      // If no record found for the current day, create a default object

      // Add the total score to the yAxis
      yAxis.add(0);
    }
  }

  return ChartDataStruct(xAxis: xAxis, yAxis: yAxis);
}

String? datesDisplay() {
  // Display the dates in order by time only for the last 7 days starting from today with the MMMEd format
  final now = DateTime.now();
  final lastWeek = now.subtract(Duration(days: 7));
  final dates =
      List.generate(7, (index) => lastWeek.add(Duration(days: index + 1)));
  final formatter = DateFormat.MMMEd();
  final sortedDates = dates..sort((a, b) => b.toLocal().compareTo(a.toLocal()));
  return sortedDates.map((date) => formatter.format(date) + '\n').join();
}

double? convertFeetInchToCM(
  String? feet,
  String? inch,
) {
  double feetValue = double.tryParse(feet!) ?? 0.0;
  double inchValue = double.tryParse(inch!) ?? 0.0;
  // Calculate total inches and convert to centimeters
  double totalInches = (feetValue * 12 + inchValue);
  double cm = totalInches * 2.54;
  return double.parse((cm).toStringAsFixed(2));
}

String wrapText(String text) {
  if (text.length <= 15) {
    return text;
  }

  List<String> words = text.split(' ');
  List<String> lines = [];
  String currentLine = '';

  for (String word in words) {
    if ((currentLine.length + word.length) <= 15) {
      currentLine += (currentLine.isEmpty ? '' : ' ') + word;
    } else {
      lines.add(currentLine);
      currentLine = word;
    }
  }

  // Add the last line
  if (currentLine.isNotEmpty) {
    lines.add(currentLine);
  }

  return lines.join('\n');
}

List<MusclesPercentageStruct>? getFunctionalExerciseScore(
  double? bodyweight,
  double? additionalWeightLifted,
  int? repetitions,
  int? rpe,
  double? weightage,
  double? difficultyMultiplier,
  List<MusclesPercentageStruct>? musclesPercentages,
) {
  //(Bodyweight + Additional Weight Lifted)*Reps*RPE*Exercise Type Weightage*0.01*Difficulty Multiplier
  double rawScore = (bodyweight! + additionalWeightLifted!) *
      repetitions! *
      rpe! *
      weightage! *
      0.01 *
      difficultyMultiplier!;

  return musclesPercentages;
}

bool verifyOtp(int otp) {
  return otp == 999999;
}

double feetToCm(String? height) {
  // Check if the height is provided
  if (height == null || height.isEmpty) {
    return 0.0; // You can return an appropriate error code or message here
  }

  // Check if the height is in feetinch format
  if (height.contains(".")) {
    final parts = height.split(".");

    // Check if the feet and inches are provided
    if (parts.length == 2) {
      final feet = double.tryParse(parts[0]) ?? 0.0;
      final inches = double.tryParse(parts[1]) ?? 0.0;

      if (feet >= 2 && feet <= 7 && inches >= 0 && inches <= 11) {
        // Perform the conversion
        final totalInches = feet * 12 + inches;
        final cm = totalInches * 2.54;
        return cm;
      } else {
        return 0.0; // Return an error code or message for invalid feet and inches
      }
    } else {
      return 0.0; // Return an error code or message for invalid format
    }
  } else {
    // Assume the input is in feet
    final feet = double.tryParse(height) ?? 0.0;

    if (feet >= 2 && feet <= 7) {
      // Single-digit feet input, assuming 0 inches
      final totalInches = feet * 12;
      final cm = totalInches * 2.54;
      return cm;
    } else {
      return 0.0; // Return an error code or message for invalid feet input
    }
  }
}

double weightValidation(double weight) {
  // validation in input field where it should allow number from 25 - 250 else return error
  if (weight >= 25 && weight <= 250) {
    return weight;
  } else {
    throw Exception('Weight should be between 25 and 250');
  }
}

List<MusclesAppStateStruct>? convertMuscleDocToJson(
    List<MusclesRecord>? musclesDoc) {
  return musclesDoc
      ?.map((muscle) => MusclesAppStateStruct(
          name: muscle.name,
          code: muscle.code,
          calibration: muscle.calibration,
          imageUrl: muscle.imageUrl))
      .toList();
}

DateTimeRange? getStartEndDateRange(DateTime? inputDate) {
  if (inputDate == null) {
    return null;
  }
  final start = DateTime(inputDate.year, inputDate.month, inputDate.day);
  final end = start.add(Duration(days: 1)).subtract(Duration(milliseconds: 1));
  return DateTimeRange(start: start, end: end);
}

DateTime getYesterdaysDate(int? substractor) {
  if (substractor == null) substractor = 1;

  DateTime today = DateTime.now();

  // Calculate yesterday's date
  DateTime yesterday = today.subtract(Duration(days: substractor));

  yesterday = DateTime(yesterday.year, yesterday.month, yesterday.day);

  return yesterday;
}

double convertPountToKg(double poundInput) {
  return double.parse((poundInput * 0.45359237).toStringAsFixed(4));
}

List<MusclesStruct> sumMusclesSocre(
  List<MusclesStruct> oldScore,
  List<MusclesStruct> newScore,
) {
  for (var i = 0; i < newScore.length; i++) {
    final newScoreValue = newScore[i];

    dynamic scoredata = oldScore.firstWhere(
        (element) => element.code == newScoreValue.code,
        orElse: () => MusclesStruct(name: "", code: "", value: 0));

    if (scoredata.name == "") {
      oldScore.add(newScoreValue);
    } else {
      oldScore[oldScore
                  .indexWhere((element) => element.code == newScoreValue.code)]
              .value =
          double.parse(
              (newScoreValue.value + scoredata.value).toStringAsFixed(2));
    }
  }

  return oldScore;
}

String? getMuscleImageByCode(
  List<MusclesAppStateStruct> muscles,
  String? code,
) {
  final muscleDoc = muscles.firstWhere(((element) => element.code == code),
      orElse: () => MusclesAppStateStruct(
          calibration: 0, code: "", imageUrl: "", name: ""));

  print("code");
  print(code);

  print("muscleDoc.imageUrl");
  print(muscleDoc.imageUrl);

  if (muscleDoc.code == "")
    return "";
  else
    return muscleDoc.imageUrl;
}

DateTime getTodaysDate() {
  DateTime today = DateTime.now();
  today = DateTime(today.year, today.month, today.day);

  return today;
}

String? getWeekScoreTitle(DateTime today) {
  // Calculate yesterday's date
  DateTime lastSevenDay = today.subtract(Duration(days: 6));

  String month1 = DateFormat("MMMM").format(DateTime(0, today.month));
  String month2 = DateFormat("MMMM").format(DateTime(0, lastSevenDay.month));

  if (today.month == lastSevenDay.month) {
    return '$month1 ${lastSevenDay.day} - ${today.day}';
  } else {
    return '$month2 ${lastSevenDay.day} - $month1 ${today.day}';
  }
}

String? getMonthTitle() {
  DateTime today = DateTime.now();
  String monthName = DateFormat("MMMM yyyy").format(today);
  return monthName;
}

String? getCurrentMonth() {
  DateTime today = DateTime.now();

  // Format the month name for the current month
  String monthName = DateFormat("MMMM").format(today);

  return monthName;
}

String? totalScoreAsZero() {
  // set totalScore value as 0
  int totalScore = 0;
  return 'Total Score: $totalScore';
}

DateTime convertDateTimeToDate(DateTime dateTimeVal) {
  // get date time and return only date remove time
  return DateTime(dateTimeVal.year, dateTimeVal.month, dateTimeVal.day);
}

DateTimeRange getMonthStartEndDate() {
  // function will return current month start and end date
  final now = DateTime.now();
  final start = DateTime(now.year, now.month, 1);
  final end = DateTime(now.year, now.month + 1, 0);

  final startOfMonthDate = DateTime(start.year, start.month, start.day);
  final endOfMonthDate = DateTime(end.year, end.month, end.day);

  return DateTimeRange(start: startOfMonthDate, end: endOfMonthDate);
}

DateTime getPastDate(
  DateTime dateVal,
  int days,
) {
  // function will take date and minus days from date and return
  return dateVal.subtract(Duration(days: days));
}

DateTime getFutureDate(
  DateTime dateVal,
  int days,
) {
  // functionnwill add the days in date param and return date
  return dateVal.add(Duration(days: days));
}

double? getHeightBasedMultiplierValue(double? height) {
  // Return the appropriate multiplier based on height
  if (height == null) {
    return null; // Return null if height is not provided
  } else if (height <= 155) {
    return 0.85;
  } else if (height >= 156 && height <= 170) {
    return 0.95;
  } else if (height >= 171 && height <= 180) {
    return 1.0;
  } else {
    return 1.05;
  }
}

DateTimeRange? getCurrentWeekStartEndDate() {
  // function will return current week start and end date
  final now = DateTime.now();
  int dayValues = now.weekday - 1;
  final startOfWeek = now.subtract(Duration(days: (dayValues)));
  final endOfWeek = startOfWeek.add(Duration(days: 6));
  final startOfWeekDate =
      DateTime(startOfWeek.year, startOfWeek.month, startOfWeek.day);
  final endOfWeekDate =
      DateTime(endOfWeek.year, endOfWeek.month, endOfWeek.day);

  return DateTimeRange(start: startOfWeekDate, end: endOfWeekDate);
}

double getTotalWeekScore(List<DayScoresDataRecord> exerciseScoreResponse) {
  // Check if the exerciseScoreResponse is not null and has data
  if (exerciseScoreResponse.isEmpty) {
    return 0;
  }

  // Initialize the total score
  double totalScore = 0;

  // Iterate over each day's data and sum up the totalScore values
  for (DayScoresDataRecord dayData in exerciseScoreResponse) {
    // Access the 'totalScore' field from each day's data and add it to the total score
    totalScore += (dayData.totalScore);
  }

  // Return the total score for the current week
  return totalScore;
}

DateTimeRange? getPreviousWeekStartEndDate() {
  // Get the current week start and end dates
  final currentWeekRange = getCurrentWeekStartEndDate();

  // Check if the current week range is not null
  if (currentWeekRange != null) {
    // Subtract 7 days from the current week start and end dates
    final previousWeekStart =
        currentWeekRange.start.subtract(Duration(days: 7));
    final previousWeekEnd = currentWeekRange.end.subtract(Duration(days: 6));

    // Return the previous week's start and end dates
    return DateTimeRange(start: previousWeekStart, end: previousWeekEnd);
  } else {
    return null; // Return null if the current week range is null
  }
}

double getAverageWeekScore(List<DayScoresDataRecord> averageScoreResponse) {
  // Check if the exerciseScoreResponse is not null and has data
  if (averageScoreResponse.isEmpty) {
    return 0.0; // Return 0 if no data is available
  }

  // Initialize the total score
  double totalScore = 0;

  // Iterate over each day's data and sum up the totalScore values
  for (DayScoresDataRecord dayData in averageScoreResponse) {
    // Access the 'totalScore' field from each day's data and add it to the total score
    totalScore += (dayData.totalScore);
  }

  // Calculate the average score
  double averageScore = totalScore / averageScoreResponse.length;

  // Return the average score for the current week
  return averageScore;
}

String? getDayName() {
  // function to set title properties for X axis as alphabet of the week letter as per date
  final now = DateTime.now();
  final daysOfWeek = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
  final weekDay = daysOfWeek[now.weekday - 1];
  return weekDay;
}

List<String> weekProperties(List<DayScoresDataRecord> weekName) {
  List<String> result = [];

  // Define the list of day abbreviations
  List<String> weekDays = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];

  // Get the current date
  DateTime now = DateTime.now();

  // Iterate over each day of the week
  for (int i = 0; i < 7; i++) {
    // Calculate the date for the current day
    DateTime day = now.subtract(Duration(days: now.weekday - 1 - i));

    // Check if the week query data exists for the current day
    bool isDataExists = weekName.any((record) =>
        record.date?.year == day.year &&
        record.date?.month == day.month &&
        record.date?.day == day.day);

    // If data exists, add the day abbreviation to the result
    // Otherwise, add 0 to indicate missing data
    if (isDataExists) {
      result.add(weekDays[i]);
    } else {
      result.add('0');
    }
  }

  // Return the result
  return result;
}

ChartDataStruct convertExerciseScoreToChartData(
    List<DayScoresDataRecord> dayScoreData) {
  List<int> xAxis = [];
  List<double> yAxis = [];

  for (var i = 1; i <= 7; i++) {
    xAxis.add(i);
    // Find the DayScoresDataRecord for the current day
    DayScoresDataRecord? dayScore;
    try {
      dayScore =
          dayScoreData.firstWhere((element) => element.date?.weekday == i);

      // Add the total score to the yAxis
      yAxis.add(dayScore.totalScore);
    } catch (_) {
      // If no record found for the current day, create a default object

      // Add the total score to the yAxis
      yAxis.add(0);
    }
  }

  return ChartDataStruct(xAxis: xAxis, yAxis: yAxis);
}

String? getCurrentWeekScoreTitle(DateTime? today) {
// / Calculate the start date of the current week (Monday)
  DateTime monday =
      today!.subtract(Duration(days: today.weekday - DateTime.monday));

  // Calculate the end date of the current week (Sunday)
  DateTime sunday = monday.add(Duration(days: 6));

  // Format the dates to include month and day
  String startMonth = DateFormat("MMMM").format(monday);
  String endMonth = DateFormat("MMMM").format(sunday);
  String title;

  // Check if both start and end dates fall in the same month
  if (startMonth == endMonth) {
    title = '$startMonth ${monday.day} - ${sunday.day}';
  } else {
    title = '$startMonth ${monday.day} - $endMonth ${sunday.day}';
  }

  return title;
}

String feetInchToString(
  String? feet,
  String? inch,
) {
  int feetValue = int.tryParse(feet!) ?? 0;
  int inchValue = int.tryParse(inch!) ?? 0;

  String totalLength = '$feetValue.$inchValue';

  return totalLength;
}

List<DayScoresDataRecord>? sevenDayScores(
    List<DayScoresDataRecord>? dailyWeekScores) {
  // List<int> scoresForLastSixDays = List.filled(6, 0);
  // // Get yesterday's date
  // DateTime yesterday = DateTime.now().subtract(Duration(days: 1));
  // // Iterate over the last six days
  // for (int i = 0; i < 6; i++) {
  //   // Calculate the date for the current day in the loop
  //   DateTime currentDay = yesterday.subtract(Duration(days: i));
  //   // Check if there is data for the current day
  //   DocumentReference<Object?>? dayData = dailyWeekScores?.firstWhere(
  //     (element) =>
  //         element.date.toDate().year == currentDay.year &&
  //         element.date.toDate().month == currentDay.month &&
  //         element.date.toDate().day == currentDay.day,
  //     orElse: () => null,
  //   );
  //   // If data exists, store the score, otherwise store 0
  //   if (dayData != null) {
  //     scoresForLastSixDays[5 - i] = dayData.totalScore as int;
  //   } else {
  //     scoresForLastSixDays[5 - i] = 0;
  //   }
  // }
  // return scoresForLastSixDays;
}

String? getOtpExpiryTime(int minValue) {
  // add the minvalue in current date time and return new date time
  final now = DateTime.now();
  final expiryTime = now.add(Duration(minutes: minValue));
  return expiryTime.toString();
}

DateTime getExpiryTime(int minValue) {
  // add the minvalue in current date time and return new date time
  DateTime now = DateTime.now();
  DateTime expiryTime = now.add(Duration(minutes: minValue));
  return expiryTime;
}

List<String> generateDaysFromLastWeek() {
  List<String> daysOfWeek = [
    'Sunday',
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday'
  ];
  DateTime now = DateTime.now();
  List<String> lastWeekDays = [];

  // Start from yesterday
  DateTime date = now.subtract(Duration(days: 1));

  // Add yesterday as the first day
  lastWeekDays.add('Yesterday');

  // Iterate over the past 6 days (excluding today)
  for (int i = 0; i < 5; i++) {
    lastWeekDays.add(daysOfWeek[
        date.weekday - 1]); // Subtract 1 to adjust to zero-based indexing
    date = date.subtract(Duration(days: 1)); // Move to the previous day
  }

  return lastWeekDays;
}

int getRemainingValue(int value) {
  return 6 - value;
}

String getImageUrl(
  String exerciseCode,
  String baseUrl,
  String path,
  String suffix,
) {
  String imageUrl = '$baseUrl$path$exerciseCode$suffix';
  return imageUrl;
}

String generateCodeFromName(String name) {
  // Convert the name to lowercase
  String lowercasedName = name.toLowerCase();

  // Replace spaces with hyphens
  String code = lowercasedName.replaceAll(' ', '-');

  // Return the formatted code
  return code;
}

double? convertStringToDouble(String? input) {
// Check if input is null or empty
  if (input == null || input.isEmpty) {
    return null;
  }

  // Try to parse the string to a double
  return double.tryParse(input);
}
