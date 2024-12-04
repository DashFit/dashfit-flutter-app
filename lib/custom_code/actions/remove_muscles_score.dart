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

import 'package:collection/collection.dart';

Future<ResponseModifyMusclesScoreStruct> removeMusclesScore(
  List<MusclesStruct> allDayScores,
  List<MusclesStruct> exerciseScores,
) async {
  // Add your function code here!

  double totalScores = 0;
  List<MusclesStruct> newAllDayScores = [];

  for (MusclesStruct allDayScore in allDayScores) {
    dynamic exerciseScore = exerciseScores.firstWhereOrNull(
        ((MusclesStruct element) => element.code == allDayScore.code));

    if (exerciseScore != null) {
      double newScore = double.parse(
          (allDayScore.value - exerciseScore.value).toStringAsFixed(2));

      if (newScore > 0) {
        newAllDayScores.add(MusclesStruct(
            name: exerciseScore.name,
            code: exerciseScore.code,
            value: newScore));

        totalScores = double.parse((totalScores + newScore).toStringAsFixed(2));
      }
    } else {
      newAllDayScores.add(allDayScore);
      totalScores =
          double.parse((totalScores + allDayScore.value).toStringAsFixed(2));
    }
  }
  ; // end for loop

  return ResponseModifyMusclesScoreStruct(
      totalScore: double.parse(totalScores.toStringAsFixed(2)),
      muscles: newAllDayScores);
}
