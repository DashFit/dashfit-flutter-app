import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/custom_cloud_functions/custom_cloud_function_response_manager.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'verify_widget.dart' show VerifyWidget;
import 'package:flutter/material.dart';

class VerifyModel extends FlutterFlowModel<VerifyWidget> {
  ///  Local state fields for this page.

  bool showResendBtn = false;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for mobileOtpTextfield widget.
  TextEditingController? mobileOtpTextfield;
  String? Function(BuildContext, String?)? mobileOtpTextfieldValidator;
  // State field(s) for resendTimer widget.
  final resendTimerInitialTimeMs = 30000;
  int resendTimerMilliseconds = 30000;
  String resendTimerValue = StopWatchTimer.getDisplayTime(
    30000,
    hours: false,
    minute: false,
    milliSecond: false,
  );
  FlutterFlowTimerController resendTimerController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countDown));

  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  MobileOtpRecord? mobileOtpResponse;
  // Stores action output result for [Cloud Function - createCustomToken] action in Button widget.
  CreateCustomTokenCloudFunctionCallResponse? jWTtoken;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<MusclesRecord>? newMusclesQueryResponse;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  UsersDataRecord? userDataResponse;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  UsersRecord? userDocumentReference;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  UsersDataRecord? oldUserDataResponse;
  // Stores action output result for [Custom Action - generateOtp] action in Text widget.
  int? otpValue;
  // Stores action output result for [Backend Call - API (Send otp SMS)] action in Text widget.
  ApiCallResponse? apiResendSendSms;
  // Stores action output result for [Firestore Query - Query a collection] action in Text widget.
  MobileOtpRecord? mobileNumberOtpExists;
  // Stores action output result for [Backend Call - Create Document] action in Text widget.
  MobileOtpRecord? otp;

  @override
  void initState(BuildContext context) {
    mobileOtpTextfield = TextEditingController();
  }

  @override
  void dispose() {
    mobileOtpTextfield?.dispose();
    resendTimerController.dispose();
  }
}
