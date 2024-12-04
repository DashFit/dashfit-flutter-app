import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'plank_exercise_widget.dart' show PlankExerciseWidget;
import 'package:flutter/material.dart';

class PlankExerciseModel extends FlutterFlowModel<PlankExerciseWidget> {
  ///  Local state fields for this page.

  String weightUnit = 'kg';

  DateTime? selectedExerciseDate;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  DateTime? datePicked;
  // State field(s) for weightUnitBtn widget.
  FormFieldController<String>? weightUnitBtnValueController;
  // State field(s) for additionalWeighTxtVal widget.
  FocusNode? additionalWeighTxtValFocusNode;
  TextEditingController? additionalWeighTxtValTextController;
  String? Function(BuildContext, String?)?
      additionalWeighTxtValTextControllerValidator;
  // State field(s) for timeDuration widget.
  FocusNode? timeDurationFocusNode;
  TextEditingController? timeDurationTextController;
  String? Function(BuildContext, String?)? timeDurationTextControllerValidator;
  // State field(s) for setTxtVal widget.
  FocusNode? setTxtValFocusNode;
  TextEditingController? setTxtValTextController;
  String? Function(BuildContext, String?)? setTxtValTextControllerValidator;
  // Stores action output result for [Backend Call - Read Document] action in UpdateButton widget.
  UsersDataRecord? updateUserDataResponse;
  // Stores action output result for [Custom Action - actionCalculatePlankScore] action in UpdateButton widget.
  ResponseExerciseScoresStruct? updateActionCalculatePlankResponse;
  // Stores action output result for [Backend Call - Read Document] action in UpdateButton widget.
  ExerciseScoresDataRecord? oldExerciseScoreResponse;
  // Stores action output result for [Firestore Query - Query a collection] action in UpdateButton widget.
  DayScoresDataRecord? updateDayScoreResponse;
  // Stores action output result for [Custom Action - modifyMusclesScore] action in UpdateButton widget.
  ResponseModifyMusclesScoreStruct? newMusclesScoresResponse;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  UsersDataRecord? userDataResponse;
  // Stores action output result for [Custom Action - actionCalculatePlankScore] action in Button widget.
  ResponseExerciseScoresStruct? actionCalculatePlankResponse;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  DayScoresDataRecord? getDayScoreResponse;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  DayScoresDataRecord? newDayScoreResponse;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ExerciseScoresDataRecord? newExerciseScoreResponse;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    additionalWeighTxtValFocusNode?.dispose();
    additionalWeighTxtValTextController?.dispose();

    timeDurationFocusNode?.dispose();
    timeDurationTextController?.dispose();

    setTxtValFocusNode?.dispose();
    setTxtValTextController?.dispose();
  }

  /// Additional helper methods.
  String? get weightUnitBtnValue => weightUnitBtnValueController?.value;
}
