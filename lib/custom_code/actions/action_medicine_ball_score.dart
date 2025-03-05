// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<ResponseExerciseScoresStruct?> actionMedicineBallScore(
  double weightLifted,
  String weightUnit,
  int repetitions,
  int setCount,
  int rpe,
  ExercisesRecord exerciseDoc,
  double heightMultiplier,
  List<MusclesAppStateStruct> muscles,
) async {
  double totalScore = 0;

  List<MusclesStruct> musclesScores = [];

  dynamic musclePercentages = exerciseDoc.musclePercentage;
  dynamic workoutType = exerciseDoc.workoutType;
  num weightLiftedInKg = weightUnit == 'kg'
      ? weightLifted
      : double.parse((weightLifted * 0.45359237).toStringAsFixed(4));

  // calculate one RM value
  double oneRmValue = (repetitions * 0.0333) + 1;

  double rawScore =
      (weightLiftedInKg * repetitions * rpe * 0.0333 / oneRmValue) *
          workoutType.weightage *
          2 *
          setCount *
          heightMultiplier;

  for (int i = 0; i < musclePercentages.length; i++) {
    MusclesPercentageStruct musclePercentage = musclePercentages[i];

    // Find the calibration value
    dynamic muscleCalibration = muscles.firstWhere(
        ((MusclesAppStateStruct element) =>
            element.code == musclePercentage.code), orElse: () {
      // Return a default MusclesStruct object with null values
      return MusclesAppStateStruct(name: null, calibration: 0);
    });

    double muscleFinalScore = 0;
    if (muscleCalibration != null) {
      muscleFinalScore =
          rawScore * musclePercentage.value * muscleCalibration.calibration;
      muscleFinalScore = double.parse(muscleFinalScore.toStringAsFixed(2));
    }

    totalScore += muscleFinalScore;

    musclesScores.add(MusclesStruct(
        name: musclePercentage.name,
        code: musclePercentage.code,
        value: muscleFinalScore));
  } // for loop

  return ResponseExerciseScoresStruct(
      totalScore: double.parse(totalScore.toStringAsFixed(2)),
      muscles: musclesScores,
      name: exerciseDoc.name,
      code: exerciseDoc.code,
      formData: ExerciseFormDataStruct(
          weightLifted: weightLifted,
          repetitions: repetitions,
          setCount: setCount,
          weightUnit: weightUnit));
}
