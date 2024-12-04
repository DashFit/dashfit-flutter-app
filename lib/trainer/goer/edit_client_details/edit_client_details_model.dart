import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'edit_client_details_widget.dart' show EditClientDetailsWidget;
import 'package:flutter/material.dart';

class EditClientDetailsModel extends FlutterFlowModel<EditClientDetailsWidget> {
  ///  Local state fields for this page.

  UsersRecord? clientDetails;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for clientName widget.
  FocusNode? clientNameFocusNode;
  TextEditingController? clientNameTextController;
  String? Function(BuildContext, String?)? clientNameTextControllerValidator;
  String? _clientNameTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Name is required';
    }

    return null;
  }

  // State field(s) for clientEmail widget.
  FocusNode? clientEmailFocusNode;
  TextEditingController? clientEmailTextController;
  String? Function(BuildContext, String?)? clientEmailTextControllerValidator;
  // State field(s) for clientWeight widget.
  FocusNode? clientWeightFocusNode;
  TextEditingController? clientWeightTextController;
  String? Function(BuildContext, String?)? clientWeightTextControllerValidator;
  String? _clientWeightTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Weight is required';
    }

    if (val.length < 2) {
      return 'enter valid weight';
    }
    if (val.length > 4) {
      return 'enter valid weight';
    }
    if (!RegExp(
            '^(25(\\.\\d)?|[3-9]\\d(\\.\\d)?|1\\d{2}(\\.\\d)?|2[0-4]\\d(\\.\\d)?|250(\\.[0-9])?)\$')
        .hasMatch(val)) {
      return 'Weight range : 25 - 250';
    }
    return null;
  }

  // State field(s) for age widget.
  String? ageValue;
  FormFieldController<String>? ageValueController;
  // State field(s) for Height widget.
  FormFieldController<String>? heightValueController;
  // State field(s) for HeightInputCm widget.
  FocusNode? heightInputCmFocusNode;
  TextEditingController? heightInputCmTextController;
  String? Function(BuildContext, String?)? heightInputCmTextControllerValidator;
  // State field(s) for clientFeet widget.
  String? clientFeetValue;
  FormFieldController<String>? clientFeetValueController;
  // State field(s) for clientInch widget.
  String? clientInchValue;
  FormFieldController<String>? clientInchValueController;
  // State field(s) for clientGender widget.
  FormFieldController<String>? clientGenderValueController;
  // State field(s) for clientState widget.
  String? clientStateValue;
  FormFieldController<String>? clientStateValueController;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  GoersDataRecord? clientDetailsData;

  @override
  void initState(BuildContext context) {
    clientNameTextControllerValidator = _clientNameTextControllerValidator;
    clientWeightTextControllerValidator = _clientWeightTextControllerValidator;
  }

  @override
  void dispose() {
    clientNameFocusNode?.dispose();
    clientNameTextController?.dispose();

    clientEmailFocusNode?.dispose();
    clientEmailTextController?.dispose();

    clientWeightFocusNode?.dispose();
    clientWeightTextController?.dispose();

    heightInputCmFocusNode?.dispose();
    heightInputCmTextController?.dispose();
  }

  /// Additional helper methods.
  String? get heightValue => heightValueController?.value;
  String? get clientGenderValue => clientGenderValueController?.value;
}
