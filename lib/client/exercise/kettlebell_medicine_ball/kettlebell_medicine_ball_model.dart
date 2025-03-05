import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'kettlebell_medicine_ball_widget.dart' show KettlebellMedicineBallWidget;
import 'package:flutter/material.dart';

class KettlebellMedicineBallModel
    extends FlutterFlowModel<KettlebellMedicineBallWidget> {
  ///  Local state fields for this page.

  String weightUnit = 'kg';

  DateTime? selectedExerciseDate;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  DateTime? datePicked;
  // State field(s) for weightUnitBtn widget.
  FormFieldController<String>? weightUnitBtnValueController;
  // State field(s) for weightLiftedTxt widget.
  FocusNode? weightLiftedTxtFocusNode;
  TextEditingController? weightLiftedTxtTextController;
  String? Function(BuildContext, String?)?
      weightLiftedTxtTextControllerValidator;
  String? _weightLiftedTxtTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.isEmpty) {
      return 'Enter valid weight lifted';
    }
    if (val.length > 5) {
      return 'Enter valid weight lifted';
    }
    if (!RegExp('^(?:[1-9]|[1-4]\\d|50|\\d+(?:\\.\\d{1,2})?)\$')
        .hasMatch(val)) {
      return 'Enter Weight Lifted';
    }
    return null;
  }

  // State field(s) for reptitionsTxtVal widget.
  FocusNode? reptitionsTxtValFocusNode;
  TextEditingController? reptitionsTxtValTextController;
  String? Function(BuildContext, String?)?
      reptitionsTxtValTextControllerValidator;
  // State field(s) for setTxtVal widget.
  FocusNode? setTxtValFocusNode;
  TextEditingController? setTxtValTextController;
  String? Function(BuildContext, String?)? setTxtValTextControllerValidator;
  // Stores action output result for [Backend Call - Read Document] action in UpdateButton widget.
  UsersDataRecord? updateUserDataResponse;
  // Stores action output result for [Custom Action - actionKettlebellFunctionalScore] action in UpdateButton widget.
  ResponseExerciseScoresStruct? updateActionKettlebellScoreResponse;
  // Stores action output result for [Backend Call - Read Document] action in UpdateButton widget.
  ExerciseScoresDataRecord? oldExerciseScoreResponse;
  // Stores action output result for [Firestore Query - Query a collection] action in UpdateButton widget.
  DayScoresDataRecord? updateDayScoreResponse;
  // Stores action output result for [Custom Action - modifyMusclesScore] action in UpdateButton widget.
  ResponseModifyMusclesScoreStruct? newMusclesScoresResponse;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  UsersDataRecord? userDataResponse;
  // Stores action output result for [Custom Action - actionKettlebellFunctionalScore] action in Button widget.
  ResponseExerciseScoresStruct? actionKettlebellScoreResponse;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  DayScoresDataRecord? getDayScoreResponse;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  DayScoresDataRecord? newDayScoreResponse;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ExerciseScoresDataRecord? newExerciseScoreResponse;

  @override
  void initState(BuildContext context) {
    weightLiftedTxtTextControllerValidator =
        _weightLiftedTxtTextControllerValidator;
  }

  @override
  void dispose() {
    weightLiftedTxtFocusNode?.dispose();
    weightLiftedTxtTextController?.dispose();

    reptitionsTxtValFocusNode?.dispose();
    reptitionsTxtValTextController?.dispose();

    setTxtValFocusNode?.dispose();
    setTxtValTextController?.dispose();
  }

  /// Additional helper methods.
  String? get weightUnitBtnValue => weightUnitBtnValueController?.value;
}
