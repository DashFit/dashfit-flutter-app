import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'abdoment_score_breakdown_widget.dart' show AbdomentScoreBreakdownWidget;
import 'package:flutter/material.dart';

class AbdomentScoreBreakdownModel
    extends FlutterFlowModel<AbdomentScoreBreakdownWidget> {
  ///  Local state fields for this page.

  MusclesStruct? selectedMuscle;
  void updateSelectedMuscleStruct(Function(MusclesStruct) updateFn) {
    updateFn(selectedMuscle ??= MusclesStruct());
  }

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
