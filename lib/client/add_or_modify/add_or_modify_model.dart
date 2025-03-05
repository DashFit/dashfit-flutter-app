import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'add_or_modify_widget.dart' show AddOrModifyWidget;
import 'package:flutter/material.dart';

class AddOrModifyModel extends FlutterFlowModel<AddOrModifyWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  DayScoresDataRecord? dayScoreDataResponse;
  // Stores action output result for [Custom Action - removeMusclesScore] action in Button widget.
  ResponseModifyMusclesScoreStruct? removeMusclesScoreResponse;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
