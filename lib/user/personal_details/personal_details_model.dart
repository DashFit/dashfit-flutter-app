import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'personal_details_widget.dart' show PersonalDetailsWidget;
import 'package:flutter/material.dart';

class PersonalDetailsModel extends FlutterFlowModel<PersonalDetailsWidget> {
  ///  Local state fields for this page.

  double? height;

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

  // State field(s) for phoneNumber widget.
  FocusNode? phoneNumberFocusNode;
  TextEditingController? phoneNumberTextController;
  String? Function(BuildContext, String?)? phoneNumberTextControllerValidator;
  String? _phoneNumberTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Phone Number is required';
    }

    if (val.length < 10) {
      return 'Invalid mobile number';
    }

    return null;
  }

  // State field(s) for Email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
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
  // State field(s) for weight widget.
  FocusNode? weightFocusNode;
  TextEditingController? weightTextController;
  String? Function(BuildContext, String?)? weightTextControllerValidator;
  String? _weightTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Weight is required';
    }

    if (val.length < 2) {
      return 'Enter valid weight';
    }
    if (val.length > 5) {
      return 'Enter valid weight';
    }
    if (!RegExp(
            '^(25(\\.\\d)?|[3-9]\\d(\\.\\d)?|1\\d{2}(\\.\\d)?|2[0-4]\\d(\\.\\d)?|250(\\.[0-9])?)\$')
        .hasMatch(val)) {
      return 'Weight range: 25 - 250';
    }
    return null;
  }

  // State field(s) for age widget.
  String? ageValue;
  FormFieldController<String>? ageValueController;
  // State field(s) for gender widget.
  FormFieldController<String>? genderValueController;
  // State field(s) for state widget.
  String? stateValue;
  FormFieldController<String>? stateValueController;
  // State field(s) for TnC widget.
  bool? tnCValue;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  UsersDataRecord? userDataResponse;

  @override
  void initState(BuildContext context) {
    nameTextControllerValidator = _nameTextControllerValidator;
    phoneNumberTextControllerValidator = _phoneNumberTextControllerValidator;
    weightTextControllerValidator = _weightTextControllerValidator;
  }

  @override
  void dispose() {
    nameFocusNode?.dispose();
    nameTextController?.dispose();

    phoneNumberFocusNode?.dispose();
    phoneNumberTextController?.dispose();

    emailFocusNode?.dispose();
    emailTextController?.dispose();

    heightInputCmFocusNode?.dispose();
    heightInputCmTextController?.dispose();

    weightFocusNode?.dispose();
    weightTextController?.dispose();
  }

  /// Additional helper methods.
  String? get heightValue => heightValueController?.value;
  String? get genderValue => genderValueController?.value;
}
