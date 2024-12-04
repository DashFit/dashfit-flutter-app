import '/auth/firebase_auth/auth_util.dart';
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
import 'verify_copy_model.dart';
export 'verify_copy_model.dart';

class VerifyCopyWidget extends StatefulWidget {
  const VerifyCopyWidget({
    super.key,
    required this.mobileNumber,
  });

  final String? mobileNumber;

  @override
  State<VerifyCopyWidget> createState() => _VerifyCopyWidgetState();
}

class _VerifyCopyWidgetState extends State<VerifyCopyWidget>
    with TickerProviderStateMixin {
  late VerifyCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VerifyCopyModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'VerifyCopy'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('VERIFY_COPY_VerifyCopy_ON_INIT_STATE');
      logFirebaseEvent('VerifyCopy_timer');
      _model.resendTimerController.onStartTimer();
    });

    authManager.handlePhoneAuthStateChanges(context);
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
                Align(
                  alignment: const AlignmentDirectional(-1.0, -1.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent('VERIFY_COPY_PAGE_Icon_i4ourttj_ON_TAP');
                      logFirebaseEvent('Icon_navigate_back');
                      context.safePop();
                    },
                    child: const Icon(
                      Icons.keyboard_backspace,
                      color: Color(0xFF40B1BF),
                      size: 24.0,
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      'assets/images/Frame_1261155101.png',
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(-1.0, -1.0),
                  child: Text(
                    'Verify',
                    textAlign: TextAlign.start,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Manrope',
                          fontSize: 20.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(-1.0, 0.0),
                  child: Text(
                    'Enter the OTP sent on your mobile ${widget.mobileNumber}',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Manrope',
                          color: const Color(0xFF5A5A5A),
                          fontSize: 16.0,
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
                Form(
                  key: _model.formKey,
                  autovalidateMode: AutovalidateMode.always,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
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
                              enablePinAutofill: true,
                              errorTextSpace: 16.0,
                              showCursor: false,
                              cursorColor: const Color(0xFF40B1BF),
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
                              controller: _model.otpTextbox,
                              onChanged: (_) async {
                                logFirebaseEvent(
                                    'VERIFY_COPY_otpTextbox_ON_TEXTFIELD_CHAN');
                                logFirebaseEvent('otpTextbox_custom_action');
                                await actions.otpInputValidation();
                              },
                              autovalidateMode: AutovalidateMode.always,
                              validator: _model.otpTextboxValidator
                                  .asValidator(context),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 10.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 4.0, 0.0),
                                  child: Icon(
                                    Icons.access_time_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
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
                                  updateStateInterval:
                                      const Duration(milliseconds: 1000),
                                  onChanged:
                                      (value, displayTime, shouldUpdate) {
                                    _model.resendTimerMilliseconds = value;
                                    _model.resendTimerValue = displayTime;
                                    if (shouldUpdate) safeSetState(() {});
                                  },
                                  onEnded: () async {
                                    logFirebaseEvent(
                                        'VERIFY_COPY_resendTimer_ON_TIMER_END');
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
                        ],
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
                                      'VERIFY_COPY_PAGE_SUBMIT_BTN_ON_TAP');
                                  logFirebaseEvent('Button_validate_form');
                                  if (_model.formKey.currentState == null ||
                                      !_model.formKey.currentState!
                                          .validate()) {
                                    return;
                                  }
                                  // Verify the sms
                                  logFirebaseEvent('Button_Verifythesms');
                                  GoRouter.of(context).prepareAuthEvent();
                                  final smsCodeVal = _model.otpTextbox!.text;
                                  if (smsCodeVal.isEmpty) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                            'Enter SMS verification code.'),
                                      ),
                                    );
                                    return;
                                  }
                                  final phoneVerifiedUser =
                                      await authManager.verifySmsCode(
                                    context: context,
                                    smsCode: smsCodeVal,
                                  );
                                  if (phoneVerifiedUser == null) {
                                    return;
                                  }

                                  // Get Muscles Data
                                  logFirebaseEvent('Button_GetMusclesData');
                                  _model.newMusclesQueryResponse =
                                      await queryMusclesRecordOnce();
                                  // Update muscles data in app state
                                  logFirebaseEvent(
                                      'Button_Updatemusclesdatainappstate');
                                  FFAppState().musclesData = functions
                                      .convertMuscleDocToJson(_model
                                          .newMusclesQueryResponse
                                          ?.toList())!
                                      .toList()
                                      .cast<MusclesAppStateStruct>();
                                  FFAppState().update(() {});
                                  // Read the user data doc
                                  logFirebaseEvent('Button_Readtheuserdatadoc');
                                  _model.userDataResponse =
                                      await queryUsersDataRecordOnce(
                                    queryBuilder: (usersDataRecord) =>
                                        usersDataRecord.where(
                                      'userReference',
                                      isEqualTo: currentUserReference,
                                    ),
                                    singleRecord: true,
                                  ).then((s) => s.firstOrNull);
                                  if (_model.userDataResponse != null) {
                                    if (_model.userDataResponse?.type ==
                                        'trainer') {
                                      // update user type
                                      logFirebaseEvent('Button_updateusertype');
                                      FFAppState().userType =
                                          valueOrDefault<String>(
                                        _model.userDataResponse?.type,
                                        'trainer',
                                      );
                                      safeSetState(() {});
                                      // Update User data ref in app state
                                      logFirebaseEvent(
                                          'Button_UpdateUserdatarefinappstate');
                                      FFAppState().userDataReference =
                                          _model.userDataResponse?.reference;
                                      safeSetState(() {});
                                      logFirebaseEvent('Button_navigate_to');

                                      context.pushNamedAuth(
                                          'TrainerDashboard', context.mounted);
                                    } else {
                                      // update user type
                                      logFirebaseEvent('Button_updateusertype');
                                      FFAppState().userType =
                                          valueOrDefault<String>(
                                        _model.userDataResponse?.type,
                                        'goer',
                                      );
                                      safeSetState(() {});
                                      // Update User data ref in app state
                                      logFirebaseEvent(
                                          'Button_UpdateUserdatarefinappstate');
                                      FFAppState().userDataReference =
                                          _model.userDataResponse?.reference;
                                      safeSetState(() {});
                                      logFirebaseEvent('Button_navigate_to');

                                      context.pushNamedAuth(
                                          'Dashboard', context.mounted);
                                    }
                                  } else {
                                    // Get Mobile User Data
                                    logFirebaseEvent(
                                        'Button_GetMobileUserData');
                                    _model.oldUserDataResponse =
                                        await queryUsersDataRecordOnce(
                                      queryBuilder: (usersDataRecord) =>
                                          usersDataRecord.where(
                                        'phone_number',
                                        isEqualTo: widget.mobileNumber,
                                      ),
                                      singleRecord: true,
                                    ).then((s) => s.firstOrNull);
                                    if (_model.oldUserDataResponse != null) {
                                      // Update User ref value for mobile
                                      logFirebaseEvent(
                                          'Button_UpdateUserrefvalueformobile');

                                      await _model
                                          .oldUserDataResponse!.reference
                                          .update(createUsersDataRecordData(
                                        userReference: currentUserReference,
                                      ));
                                      if (_model.oldUserDataResponse?.type ==
                                          'trainer') {
                                        // update user type
                                        logFirebaseEvent(
                                            'Button_updateusertype');
                                        FFAppState().userType =
                                            valueOrDefault<String>(
                                          _model.oldUserDataResponse?.type,
                                          'trainer',
                                        );
                                        safeSetState(() {});
                                        // Update User data ref in app state
                                        logFirebaseEvent(
                                            'Button_UpdateUserdatarefinappstate');
                                        FFAppState().userDataReference = _model
                                            .oldUserDataResponse?.reference;
                                        safeSetState(() {});
                                        logFirebaseEvent('Button_navigate_to');

                                        context.pushNamedAuth(
                                            'TrainerDashboard',
                                            context.mounted);
                                      } else {
                                        // update user type
                                        logFirebaseEvent(
                                            'Button_updateusertype');
                                        FFAppState().userType =
                                            valueOrDefault<String>(
                                          _model.oldUserDataResponse?.type,
                                          'goer',
                                        );
                                        safeSetState(() {});
                                        // Update User data ref in app state
                                        logFirebaseEvent(
                                            'Button_UpdateUserdatarefinappstate');
                                        FFAppState().userDataReference = _model
                                            .oldUserDataResponse?.reference;
                                        safeSetState(() {});
                                        logFirebaseEvent('Button_navigate_to');

                                        context.pushNamedAuth(
                                            'Dashboard', context.mounted);
                                      }
                                    } else {
                                      logFirebaseEvent('Button_navigate_to');

                                      context.goNamedAuth(
                                          'RegisterAs', context.mounted);
                                    }
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
                          if (valueOrDefault<bool>(
                            _model.showResendBtn,
                            false,
                          ))
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
                                        'VERIFY_COPY_PAGE_Text_dxf621tr_ON_TAP');
                                    logFirebaseEvent('Text_timer');
                                    _model.resendTimerController.onResetTimer();

                                    logFirebaseEvent('Text_timer');
                                    _model.resendTimerController.onStartTimer();
                                    logFirebaseEvent('Text_update_page_state');
                                    _model.showResendBtn = false;
                                    safeSetState(() {});
                                    logFirebaseEvent('Text_auth');
                                    final phoneNumberVal = widget.mobileNumber;
                                    if (phoneNumberVal == null ||
                                        phoneNumberVal.isEmpty ||
                                        !phoneNumberVal.startsWith('+')) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                              'Phone Number is required and has to start with +.'),
                                        ),
                                      );
                                      return;
                                    }
                                    await authManager.beginPhoneAuth(
                                      context: context,
                                      phoneNumber: phoneNumberVal,
                                      onCodeSent: (context) async {
                                        context.goNamedAuth(
                                          'VerifyCopy',
                                          context.mounted,
                                          queryParameters: {
                                            'mobileNumber': serializeParam(
                                              widget.mobileNumber,
                                              ParamType.String,
                                            ),
                                          }.withoutNulls,
                                          ignoreRedirect: true,
                                        );
                                      },
                                    );
                                  },
                                  child: Text(
                                    'Resend',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Manrope',
                                          color: FlutterFlowTheme.of(context)
                                              .secondary,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
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
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
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
                ),
              ].divide(const SizedBox(height: 20.0)),
            ),
          ),
        ),
      ),
    );
  }
}
