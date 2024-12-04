import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'search_exercise_widget.dart' show SearchExerciseWidget;
import 'package:flutter/material.dart';

class SearchExerciseModel extends FlutterFlowModel<SearchExerciseWidget> {
  ///  Local state fields for this page.

  bool searchActive = false;

  String exerciseFilter = 'all';

  ///  State fields for stateful widgets in this page.

  // State field(s) for searchTextBox widget.
  FocusNode? searchTextBoxFocusNode;
  TextEditingController? searchTextBoxTextController;
  String? Function(BuildContext, String?)? searchTextBoxTextControllerValidator;
  List<ExercisesRecord> simpleSearchResults = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    searchTextBoxFocusNode?.dispose();
    searchTextBoxTextController?.dispose();
  }
}
