import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'abdoment_score_breakdown_copy_widget.dart'
    show AbdomentScoreBreakdownCopyWidget;
import 'package:flutter/material.dart';

class AbdomentScoreBreakdownCopyModel
    extends FlutterFlowModel<AbdomentScoreBreakdownCopyWidget> {
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
