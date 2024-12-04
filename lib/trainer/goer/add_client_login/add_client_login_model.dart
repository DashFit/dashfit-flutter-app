import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'add_client_login_widget.dart' show AddClientLoginWidget;
import 'package:flutter/material.dart';

class AddClientLoginModel extends FlutterFlowModel<AddClientLoginWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for phoneNumber widget.
  FocusNode? phoneNumberFocusNode;
  TextEditingController? phoneNumberTextController;
  String? Function(BuildContext, String?)? phoneNumberTextControllerValidator;
  String? _phoneNumberTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'mobile Number is required';
    }

    if (val.length < 10) {
      return 'Enter a Valid Mobile Number';
    }
    if (val.length > 10) {
      return 'Enter a Valid Mobile Number';
    }

    return null;
  }

  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  GoersDataRecord? existingGoerData;
  // Stores action output result for [Custom Action - generateOtp] action in Button widget.
  int? otpValue;
  // Stores action output result for [Backend Call - API (Send otp SMS)] action in Button widget.
  ApiCallResponse? apiSendSms;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  MobileOtpRecord? mobileNumberOtpExists;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  MobileOtpRecord? otp;

  @override
  void initState(BuildContext context) {
    phoneNumberTextControllerValidator = _phoneNumberTextControllerValidator;
  }

  @override
  void dispose() {
    phoneNumberFocusNode?.dispose();
    phoneNumberTextController?.dispose();
  }
}
