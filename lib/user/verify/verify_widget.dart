import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/custom_cloud_functions/custom_cloud_function_response_manager.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'verify_model.dart';
export 'verify_model.dart';

class VerifyWidget extends StatefulWidget {
  const VerifyWidget({
    super.key,
    required this.mobileNumber,
  });

  final String? mobileNumber;

  @override
  State<VerifyWidget> createState() => _VerifyWidgetState();
}

class _VerifyWidgetState extends State<VerifyWidget>
    with TickerProviderStateMixin {
  late VerifyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VerifyModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Verify'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('VERIFY_PAGE_Verify_ON_INIT_STATE');
      logFirebaseEvent('Verify_timer');
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
                      logFirebaseEvent('VERIFY_PAGE_Icon_l3rt311r_ON_TAP');
                      // Go Back
                      logFirebaseEvent('Icon_GoBack');
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
                          PinCodeTextField(
                            autoDisposeControllers: false,
                            appContext: context,
                            length: 6,
                            textStyle:
                                FlutterFlowTheme.of(context).bodyLarge.override(
                                      fontFamily: 'Manrope',
                                      letterSpacing: 0.0,
                                    ),
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            enableActiveFill: false,
                            autoFocus: true,
                            enablePinAutofill: true,
                            errorTextSpace: 16.0,
                            showCursor: true,
                            cursorColor: FlutterFlowTheme.of(context).primary,
                            obscureText: false,
                            keyboardType: TextInputType.number,
                            pinTheme: PinTheme(
                              fieldHeight: 44.0,
                              fieldWidth: 44.0,
                              borderWidth: 2.0,
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(12.0),
                                bottomRight: Radius.circular(12.0),
                                topLeft: Radius.circular(12.0),
                                topRight: Radius.circular(12.0),
                              ),
                              shape: PinCodeFieldShape.box,
                              activeColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              inactiveColor:
                                  FlutterFlowTheme.of(context).alternate,
                              selectedColor:
                                  FlutterFlowTheme.of(context).primary,
                            ),
                            controller: _model.mobileOtpTextfield,
                            onChanged: (_) {},
                            autovalidateMode: AutovalidateMode.always,
                            validator: _model.mobileOtpTextfieldValidator
                                .asValidator(context),
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
                                        'VERIFY_PAGE_resendTimer_ON_TIMER_END');
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
                                      'VERIFY_PAGE_SUBMIT_BTN_ON_TAP');
                                  logFirebaseEvent('Button_validate_form');
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
                                      _model.mobileOtpTextfield!.text) {
                                    // JWT token
                                    logFirebaseEvent('Button_JWTtoken');
                                    try {
                                      final result =
                                          await FirebaseFunctions.instanceFor(
                                                  region: 'us-central1')
                                              .httpsCallable(
                                                  'createCustomToken')
                                              .call({
                                        "phoneNumber":
                                            '+91${widget.mobileNumber}',
                                      });
                                      _model.jWTtoken =
                                          CreateCustomTokenCloudFunctionCallResponse(
                                        data: result.data,
                                        succeeded: true,
                                        resultAsString: result.data.toString(),
                                        jsonBody: result.data,
                                      );
                                    } on FirebaseFunctionsException catch (error) {
                                      _model.jWTtoken =
                                          CreateCustomTokenCloudFunctionCallResponse(
                                        errorCode: error.code,
                                        succeeded: false,
                                      );
                                    }

                                    logFirebaseEvent('Button_auth');
                                    GoRouter.of(context).prepareAuthEvent();
                                    final user =
                                        await authManager.signInWithJwtToken(
                                      context,
                                      getJsonField(
                                        _model.jWTtoken!.jsonBody,
                                        r'''$.token''',
                                      ).toString(),
                                    );
                                    if (user == null) {
                                      return;
                                    }

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
                                    logFirebaseEvent('Button_update_app_state');
                                    FFAppState().imageUrl = ImageAppStateStruct(
                                      baseUrl:
                                          'https://firebasestorage.googleapis.com/v0/b/dashfit-uat.appspot.com/o/',
                                      path: 'icons%2Fexercises%2F',
                                      suffix: '.png?alt=media',
                                    );
                                    safeSetState(() {});
                                    // Read the user data doc
                                    logFirebaseEvent(
                                        'Button_Readtheuserdatadoc');
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
                                      logFirebaseEvent(
                                          'Button_firestore_query');
                                      _model.userDocumentReference =
                                          await queryUsersRecordOnce(
                                        queryBuilder: (usersRecord) =>
                                            usersRecord.where(
                                          'phone_number',
                                          isEqualTo:
                                              '+91${widget.mobileNumber}',
                                        ),
                                        singleRecord: true,
                                      ).then((s) => s.firstOrNull);
                                      if (_model.userDocumentReference
                                                  ?.displayName ==
                                              null ||
                                          _model.userDocumentReference
                                                  ?.displayName ==
                                              '') {
                                        logFirebaseEvent('Button_backend_call');

                                        await currentUserReference!
                                            .update(createUsersRecordData(
                                          displayName: _model
                                              .userDataResponse?.displayName,
                                          photoUrl:
                                              _model.userDataResponse?.photoUrl,
                                          type: _model.userDataResponse?.type,
                                          userDataReference: _model
                                              .userDataResponse?.reference,
                                          email: _model.userDataResponse?.email,
                                          status: 'Active',
                                          companyName: 'Dashfit',
                                        ));
                                      }
                                      if (_model.userDataResponse?.type ==
                                          'trainer') {
                                        // update user type
                                        logFirebaseEvent(
                                            'Button_updateusertype');
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

                                        context.goNamedAuth('TrainerDashboard',
                                            context.mounted);
                                      } else {
                                        // update user type
                                        logFirebaseEvent(
                                            'Button_updateusertype');
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

                                        context.goNamedAuth(
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
                                          isEqualTo:
                                              '+91${widget.mobileNumber}',
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
                                          FFAppState().userDataReference =
                                              _model.oldUserDataResponse
                                                  ?.reference;
                                          safeSetState(() {});
                                          logFirebaseEvent(
                                              'Button_navigate_to');

                                          context.goNamedAuth(
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
                                          FFAppState().userDataReference =
                                              _model.oldUserDataResponse
                                                  ?.reference;
                                          safeSetState(() {});
                                          logFirebaseEvent(
                                              'Button_navigate_to');

                                          context.goNamedAuth(
                                              'Dashboard', context.mounted);
                                        }
                                      } else {
                                        logFirebaseEvent('Button_navigate_to');

                                        context.goNamedAuth(
                                            'RegisterAs', context.mounted);
                                      }
                                    }
                                  } else {
                                    logFirebaseEvent('Button_show_snack_bar');
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Invalid Otp',
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                        ),
                                        duration: const Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondary,
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
                                        'VERIFY_PAGE_Text_ysjhn9th_ON_TAP');
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
                                            'Error during send otp message.',
                                            style: TextStyle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                          ),
                                          duration:
                                              const Duration(milliseconds: 4000),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondary,
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