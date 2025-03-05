import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'search_exercise_copy_widget.dart' show SearchExerciseCopyWidget;
import 'package:flutter/material.dart';

class SearchExerciseCopyModel
    extends FlutterFlowModel<SearchExerciseCopyWidget> {
  ///  Local state fields for this page.

  bool searchActive = false;

  String exerciseFilter = 'All';

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
