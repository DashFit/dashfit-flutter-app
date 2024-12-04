import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'client_edit_profile_widget.dart' show ClientEditProfileWidget;
import 'package:flutter/material.dart';

class ClientEditProfileModel extends FlutterFlowModel<ClientEditProfileWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  String? _nameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Name is required';
    }

    return null;
  }

  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  // State field(s) for weight widget.
  FocusNode? weightFocusNode;
  TextEditingController? weightTextController;
  String? Function(BuildContext, String?)? weightTextControllerValidator;
  String? _weightTextControllerValidator(BuildContext context, String? val) {
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
      return 'enter valid weight';
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
  // State field(s) for feet widget.
  String? feetValue;
  FormFieldController<String>? feetValueController;
  // State field(s) for inch widget.
  String? inchValue;
  FormFieldController<String>? inchValueController;
  // State field(s) for gender widget.
  FormFieldController<String>? genderValueController;
  // State field(s) for state widget.
  String? stateValue;
  FormFieldController<String>? stateValueController;

  @override
  void initState(BuildContext context) {
    nameTextControllerValidator = _nameTextControllerValidator;
    weightTextControllerValidator = _weightTextControllerValidator;
  }

  @override
  void dispose() {
    nameFocusNode?.dispose();
    nameTextController?.dispose();

    emailFocusNode?.dispose();
    emailTextController?.dispose();

    weightFocusNode?.dispose();
    weightTextController?.dispose();

    heightInputCmFocusNode?.dispose();
    heightInputCmTextController?.dispose();
  }

  /// Additional helper methods.
  String? get heightValue => heightValueController?.value;
  String? get genderValue => genderValueController?.value;
}
