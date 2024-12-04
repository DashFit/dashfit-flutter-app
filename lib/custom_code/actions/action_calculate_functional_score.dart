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

Future<ResponseExerciseScoresStruct?> actionCalculateFunctionalScore(
  double bodyWeight,
  double additionalWeightLifted,
  int repetitions,
  int rpe,
  double difficultyMultiplier,
  ExercisesRecord exerciseDoc,
  List<MusclesAppStateStruct> muscles,
  int setCount,
  String weightUnit,
  double heightMultiplier,
) async {
  double totalScore = 0;
  List<MusclesStruct> musclesScores = [];
  dynamic musclePercentages = exerciseDoc.musclePercentage;
  dynamic workoutType = exerciseDoc.workoutType;
  num additionalWeightLiftedInKg = weightUnit == 'kg'
      ? additionalWeightLifted
      : double.parse((additionalWeightLifted * 0.45359237).toStringAsFixed(4));
  double rawScore = (bodyWeight + additionalWeightLiftedInKg) *
      repetitions *
      rpe *
      workoutType.weightage *
      0.01 *
      difficultyMultiplier *
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
          additionalWeight: additionalWeightLifted,
          repetitions: repetitions,
          setCount: setCount,
          weightUnit: weightUnit));
}
