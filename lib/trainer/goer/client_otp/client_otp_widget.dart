import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'client_otp_model.dart';
export 'client_otp_model.dart';

class ClientOtpWidget extends StatefulWidget {
  const ClientOtpWidget({
    super.key,
    required this.mobileNumber,
  });

  final String? mobileNumber;

  @override
  State<ClientOtpWidget> createState() => _ClientOtpWidgetState();
}

class _ClientOtpWidgetState extends State<ClientOtpWidget>
    with TickerProviderStateMixin {
  late ClientOtpModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ClientOtpModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'ClientOtp'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('CLIENT_OTP_PAGE_ClientOtp_ON_INIT_STATE');
      logFirebaseEvent('ClientOtp_timer');
      _model.resendTimerController.onStartTimer();
    });

    animationsMap.addAll({
      'rowOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'textOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'CLIENT_OTP_PAGE_Icon_xdwkju4g_ON_TAP');
                          logFirebaseEvent('Icon_navigate_back');
                          context.safePop();
                        },
                        child: const Icon(
                          Icons.arrow_back_sharp,
                          color: Color(0xFF40B1BF),
                          size: 24.0,
                        ),
                      ),
                      Text(
                        'Add Client',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Manrope',
                              fontSize: 20.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ].divide(const SizedBox(width: 10.0)),
                  ),
                ),
                Form(
                  key: _model.formKey,
                  autovalidateMode: AutovalidateMode.disabled,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(-1.0, -1.0),
                            child: Text(
                              'Verify Phone Number',
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Manrope',
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(-1.0, 0.0),
                            child: Text(
                              'Enter the OTP sent on your clients mobile (${widget.mobileNumber})',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Manrope',
                                    color: const Color(0xFF5A5A5A),
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: PinCodeTextField(
                              autoDisposeControllers: false,
                              appContext: context,
                              length: 6,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .override(
                                    fontFamily: 'Manrope',
                                    letterSpacing: 0.0,
                                  ),
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              enableActiveFill: false,
                              autoFocus: true,
                              enablePinAutofill: false,
                              errorTextSpace: 16.0,
                              showCursor: false,
                              cursorColor: FlutterFlowTheme.of(context).primary,
                              obscureText: false,
                              keyboardType: TextInputType.number,
                              pinTheme: PinTheme(
                                fieldHeight: 44.0,
                                fieldWidth: 48.0,
                                borderWidth: 1.0,
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(12.0),
                                  bottomRight: Radius.circular(12.0),
                                  topLeft: Radius.circular(12.0),
                                  topRight: Radius.circular(12.0),
                                ),
                                shape: PinCodeFieldShape.box,
                                activeColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                inactiveColor: const Color(0xFFCDD0D3),
                                selectedColor: const Color(0xFF40B1BF),
                              ),
                              controller: _model.clientOtpTextBox,
                              onChanged: (_) {},
                              autovalidateMode: AutovalidateMode.disabled,
                              validator: _model.clientOtpTextBoxValidator
                                  .asValidator(context),
                            ),
                          ),
                        ].divide(const SizedBox(height: 20.0)),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 4.0, 0.0),
                              child: Icon(
                                Icons.access_time_rounded,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 16.0,
                              ),
                            ),
                            FlutterFlowTimer(
                              initialTime: _model.resendTimerInitialTimeMs,
                              getDisplayTime: (value) =>
                                  StopWatchTimer.getDisplayTime(
                                value,
                                hours: false,
                                minute: false,
                                milliSecond: false,
                              ),
                              controller: _model.resendTimerController,
                              updateStateInterval: const Duration(milliseconds: 1000),
                              onChanged: (value, displayTime, shouldUpdate) {
                                _model.resendTimerMilliseconds = value;
                                _model.resendTimerValue = displayTime;
                                if (shouldUpdate) safeSetState(() {});
                              },
                              onEnded: () async {
                                logFirebaseEvent(
                                    'CLIENT_OTP_PAGE_resendTimer_ON_TIMER_END');
                                logFirebaseEvent(
                                    'resendTimer_update_page_state');
                                _model.showResendBtn = true;
                                safeSetState(() {});
                              },
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context)
                                  .headlineSmall
                                  .override(
                                    fontFamily: 'Manrope',
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            Text(
                              'Sec',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Manrope',
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                          ].divide(const SizedBox(width: 2.0)),
                        ).animateOnPageLoad(
                            animationsMap['rowOnPageLoadAnimation']!),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 20.0, 0.0, 0.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'CLIENT_OTP_PAGE_SUBMIT_BTN_ON_TAP');
                                  // Validate Form
                                  logFirebaseEvent('Button_ValidateForm');
                                  if (_model.formKey.currentState == null ||
                                      !_model.formKey.currentState!
                                          .validate()) {
                                    return;
                                  }
                                  // Get Mobile Otp
                                  logFirebaseEvent('Button_GetMobileOtp');
                                  _model.mobileOtpResponse =
                                      await queryMobileOtpRecordOnce(
                                    queryBuilder: (mobileOtpRecord) =>
                                        mobileOtpRecord
                                            .where(
                                              'mobileNumber',
                                              isEqualTo:
                                                  '+91${widget.mobileNumber}',
                                            )
                                            .orderBy('expiryDate',
                                                descending: true),
                                    singleRecord: true,
                                  ).then((s) => s.firstOrNull);
                                  if (_model.mobileOtpResponse?.otp
                                          .toString() ==
                                      _model.clientOtpTextBox!.text) {
                                    // Update Mobile No
                                    logFirebaseEvent('Button_UpdateMobileNo');

                                    await currentUserReference!
                                        .update(createUsersRecordData(
                                      phoneNumber: '+91${widget.mobileNumber}',
                                    ));
                                    logFirebaseEvent('Button_backend_call');

                                    await _model.mobileOtpResponse!.reference
                                        .update(createMobileOtpRecordData(
                                      otp: _model.mobileOtpResponse?.otp,
                                    ));
                                    // Check Mobile no exists or not
                                    logFirebaseEvent(
                                        'Button_CheckMobilenoexistsornot');
                                    _model.oldClientResponse =
                                        await queryUsersDataRecordOnce(
                                      queryBuilder: (usersDataRecord) =>
                                          usersDataRecord.where(
                                        'phone_number',
                                        isEqualTo: '+91${widget.mobileNumber}',
                                      ),
                                      singleRecord: true,
                                    ).then((s) => s.firstOrNull);
                                    if (_model.oldClientResponse != null) {
                                      logFirebaseEvent('Button_navigate_to');

                                      context.goNamed(
                                        'EditClientDetails',
                                        queryParameters: {
                                          'clientUserData': serializeParam(
                                            _model.oldClientResponse,
                                            ParamType.Document,
                                          ),
                                          'phoneNumber': serializeParam(
                                            '+91${widget.mobileNumber}',
                                            ParamType.String,
                                          ),
                                        }.withoutNulls,
                                        extra: <String, dynamic>{
                                          'clientUserData':
                                              _model.oldClientResponse,
                                        },
                                      );
                                    } else {
                                      logFirebaseEvent('Button_navigate_to');

                                      context.pushNamed(
                                        'AddClientDetails',
                                        queryParameters: {
                                          'phoneNumber': serializeParam(
                                            '+91${widget.mobileNumber}',
                                            ParamType.String,
                                          ),
                                        }.withoutNulls,
                                      );
                                    }
                                  } else {
                                    logFirebaseEvent('Button_show_snack_bar');
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Invalid OTP.',
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                        ),
                                        duration: const Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context).error,
                                      ),
                                    );
                                  }

                                  safeSetState(() {});
                                },
                                text: 'Submit',
                                options: FFButtonOptions(
                                  height: 40.0,
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: const Color(0xFF4CB256),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Manrope',
                                        color: Colors.white,
                                        letterSpacing: 0.0,
                                      ),
                                  elevation: 3.0,
                                  borderSide: const BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                          ),
                          if (_model.showResendBtn)
                            Align(
                              alignment: const AlignmentDirectional(1.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 10.0, 40.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'CLIENT_OTP_PAGE_Text_eh6uljbl_ON_TAP');
                                    logFirebaseEvent('Text_timer');
                                    _model.resendTimerController.onResetTimer();

                                    logFirebaseEvent('Text_timer');
                                    _model.resendTimerController.onStartTimer();
                                    logFirebaseEvent('Text_update_page_state');
                                    _model.showResendBtn = false;
                                    safeSetState(() {});
                                    // generate OTP
                                    logFirebaseEvent('Text_generateOTP');
                                    _model.otpValue = await actions.generateOtp(
                                      widget.mobileNumber!,
                                    );
                                    // Send SMS
                                    logFirebaseEvent('Text_SendSMS');
                                    _model.apiResendSendSms =
                                        await SendOtpSMSCall.call(
                                      sendTo: widget.mobileNumber,
                                      msg:
                                          '${_model.otpValue?.toString()} is your OTP to log in to Dashfit Workout Challenge app. Valid for 10 minutes. Please do not share this OTP. Regards, Dash Fitness',
                                      userid: '2000240931',
                                    );

                                    if ((_model.apiResendSendSms?.succeeded ??
                                        true)) {
                                      logFirebaseEvent('Text_firestore_query');
                                      _model.mobileNumberOtpExists =
                                          await queryMobileOtpRecordOnce(
                                        queryBuilder: (mobileOtpRecord) =>
                                            mobileOtpRecord.where(
                                          'mobileNumber',
                                          isEqualTo:
                                              '+91${widget.mobileNumber}',
                                        ),
                                        singleRecord: true,
                                      ).then((s) => s.firstOrNull);
                                      if (_model.mobileNumberOtpExists !=
                                          null) {
                                        logFirebaseEvent('Text_backend_call');

                                        await _model
                                            .mobileNumberOtpExists!.reference
                                            .update(createMobileOtpRecordData(
                                          otp: _model.otpValue,
                                          expiryDate:
                                              functions.getExpiryTime(5),
                                        ));
                                      } else {
                                        // SaveMobile Otp
                                        logFirebaseEvent('Text_SaveMobileOtp');

                                        var mobileOtpRecordReference =
                                            MobileOtpRecord.collection.doc();
                                        await mobileOtpRecordReference
                                            .set(createMobileOtpRecordData(
                                          mobileNumber:
                                              '+91${widget.mobileNumber}',
                                          otp: _model.otpValue,
                                          expiryDate:
                                              functions.getExpiryTime(5),
                                        ));
                                        _model.otp =
                                            MobileOtpRecord.getDocumentFromData(
                                                createMobileOtpRecordData(
                                                  mobileNumber:
                                                      '+91${widget.mobileNumber}',
                                                  otp: _model.otpValue,
                                                  expiryDate: functions
                                                      .getExpiryTime(5),
                                                ),
                                                mobileOtpRecordReference);
                                      }
                                    } else {
                                      logFirebaseEvent('Text_show_snack_bar');
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Failed to send OTP. Please try again later.',
                                            style: TextStyle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                            ),
                                          ),
                                          duration:
                                              const Duration(milliseconds: 4000),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .error,
                                        ),
                                      );
                                    }

                                    safeSetState(() {});
                                  },
                                  child: Text(
                                    'Resend',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Manrope',
                                          color: const Color(0xFF40B1BF),
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ).animateOnPageLoad(
                                    animationsMap['textOnPageLoadAnimation']!),
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child: Align(
                    alignment: const AlignmentDirectional(0.0, 1.0),
                    child: Text(
                      '© Dash fitness | All rights reserved',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Manrope',
                            fontSize: 12.0,
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                ),
              ].divide(const SizedBox(height: 20.0)),
            ),
          ),
        ),
      ),
    );
  }
}
