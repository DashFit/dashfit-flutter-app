import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'verify_copy_widget.dart' show VerifyCopyWidget;
import 'package:flutter/material.dart';

class VerifyCopyModel extends FlutterFlowModel<VerifyCopyWidget> {
  ///  Local state fields for this page.

  bool showResendBtn = false;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for otpTextbox widget.
  TextEditingController? otpTextbox;
  String? Function(BuildContext, String?)? otpTextboxValidator;
  String? _otpTextboxValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Otp is required';
    }
    if (val.length < 6) {
      return 'Requires 6 characters.';
    }
    return null;
  }

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
  List<MusclesRecord>? newMusclesQueryResponse;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  UsersDataRecord? userDataResponse;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  UsersDataRecord? oldUserDataResponse;

  @override
  void initState(BuildContext context) {
    otpTextbox = TextEditingController();
    otpTextboxValidator = _otpTextboxValidator;
  }

  @override
  void dispose() {
    otpTextbox?.dispose();
    resendTimerController.dispose();
  }
}
