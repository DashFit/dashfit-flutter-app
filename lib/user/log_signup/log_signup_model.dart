import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'log_signup_widget.dart' show LogSignupWidget;
import 'package:flutter/material.dart';

class LogSignupModel extends FlutterFlowModel<LogSignupWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for phoneNumber widget.
  FocusNode? phoneNumberFocusNode;
  TextEditingController? phoneNumberTextController;
  String? Function(BuildContext, String?)? phoneNumberTextControllerValidator;
  String? _phoneNumberTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Mobile number is required';
    }

    if (val.length < 10) {
      return 'enter valid mobile number';
    }
    if (val.length > 10) {
      return 'enter valid mobile number';
    }

    return null;
  }

  // Stores action output result for [Custom Action - generateOtp] action in SendOtpButton widget.
  int? otpValue;
  // Stores action output result for [Backend Call - API (Send otp SMS)] action in SendOtpButton widget.
  ApiCallResponse? apiSendSms;
  // Stores action output result for [Firestore Query - Query a collection] action in SendOtpButton widget.
  MobileOtpRecord? mobileNumberOtpExists;
  // Stores action output result for [Backend Call - Create Document] action in SendOtpButton widget.
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
