import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'client_otp_copy_widget.dart' show ClientOtpCopyWidget;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';

class ClientOtpCopyModel extends FlutterFlowModel<ClientOtpCopyWidget> {
  ///  Local state fields for this page.

  bool showResendBtn = false;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for clientOtpTextBox widget.
  TextEditingController? clientOtpTextBox;
  String? Function(BuildContext, String?)? clientOtpTextBoxValidator;
  String? _clientOtpTextBoxValidator(BuildContext context, String? val) {
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

  @override
  void initState(BuildContext context) {
    clientOtpTextBox = TextEditingController();
    clientOtpTextBoxValidator = _clientOtpTextBoxValidator;
  }

  @override
  void dispose() {
    clientOtpTextBox?.dispose();
    resendTimerController.dispose();
  }
}
