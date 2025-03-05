import '/flutter_flow/flutter_flow_util.dart';
import 'exercise_score_list_widget.dart' show ExerciseScoreListWidget;
import 'package:flutter/material.dart';

class ExerciseScoreListModel extends FlutterFlowModel<ExerciseScoreListWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Column widget.
  ScrollController? columnController1;
  // State field(s) for Column widget.
  ScrollController? columnController2;
  // State field(s) for Column widget.
  ScrollController? columnController3;
  // State field(s) for ListView widget.
  ScrollController? listViewController;

  @override
  void initState(BuildContext context) {
    columnController1 = ScrollController();
    columnController2 = ScrollController();
    columnController3 = ScrollController();
    listViewController = ScrollController();
  }

  @override
  void dispose() {
    columnController1?.dispose();
    columnController2?.dispose();
    columnController3?.dispose();
    listViewController?.dispose();
  }
}
