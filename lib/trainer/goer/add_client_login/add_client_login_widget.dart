import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'add_client_login_model.dart';
export 'add_client_login_model.dart';

class AddClientLoginWidget extends StatefulWidget {
  const AddClientLoginWidget({super.key});

  @override
  State<AddClientLoginWidget> createState() => _AddClientLoginWidgetState();
}

class _AddClientLoginWidgetState extends State<AddClientLoginWidget> {
  late AddClientLoginModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddClientLoginModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'AddClientLogin'});
    _model.phoneNumberTextController ??= TextEditingController();
    _model.phoneNumberFocusNode ??= FocusNode();
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
          child: Align(
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(25.0, 25.0, 25.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'ADD_CLIENT_LOGIN_Icon_2ix7t58w_ON_TAP');
                          logFirebaseEvent('Icon_navigate_back');
                          context.safePop();
                        },
                        child: const Icon(
                          Icons.keyboard_backspace,
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
                  Form(
                    key: _model.formKey,
                    autovalidateMode: AutovalidateMode.disabled,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(-1.0, -1.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 20.0, 0.0, 0.0),
                            child: Text(
                              'Client\'s Mobile Number',
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).alternate,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                10.0, 5.0, 10.0, 5.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  '+91 ',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Manrope',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                const SizedBox(
                                  height: 40.0,
                                  child: VerticalDivider(
                                    thickness: 1.0,
                                    color: Color(0xFFA4AAB1),
                                  ),
                                ),
                                Expanded(
                                  child: TextFormField(
                                    controller:
                                        _model.phoneNumberTextController,
                                    focusNode: _model.phoneNumberFocusNode,
                                    onChanged: (_) => EasyDebounce.debounce(
                                      '_model.phoneNumberTextController',
                                      const Duration(milliseconds: 100),
                                      () => safeSetState(() {}),
                                    ),
                                    autofocus: true,
                                    textCapitalization: TextCapitalization.none,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Manrope',
                                            letterSpacing: 0.0,
                                          ),
                                      hintText: 'Your mobile number',
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Manrope',
                                            letterSpacing: 0.0,
                                          ),
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      focusedErrorBorder: InputBorder.none,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Manrope',
                                          letterSpacing: 0.0,
                                        ),
                                    maxLength: 10,
                                    maxLengthEnforcement:
                                        MaxLengthEnforcement.enforced,
                                    buildCounter: (context,
                                            {required currentLength,
                                            required isFocused,
                                            maxLength}) =>
                                        null,
                                    keyboardType: TextInputType.phone,
                                    validator: _model
                                        .phoneNumberTextControllerValidator
                                        .asValidator(context),
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                          RegExp('[0-9]'))
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(-1.0, 0.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent(
                                  'ADD_CLIENT_LOGIN_SEND_O_T_P_BTN_ON_TAP');
                              logFirebaseEvent('Button_validate_form');
                              if (_model.formKey.currentState == null ||
                                  !_model.formKey.currentState!.validate()) {
                                return;
                              }
                              logFirebaseEvent('Button_firestore_query');
                              _model.existingGoerData =
                                  await queryGoersDataRecordOnce(
                                queryBuilder: (goersDataRecord) =>
                                    goersDataRecord.where(
                                  'phoneNumber',
                                  isEqualTo:
                                      '+91${_model.phoneNumberTextController.text}',
                                ),
                                singleRecord: true,
                              ).then((s) => s.firstOrNull);
                              if (_model.existingGoerData != null) {
                                logFirebaseEvent('Button_show_snack_bar');
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Goer already registered with the Trainer',
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                    ),
                                    duration: const Duration(milliseconds: 4000),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).secondary,
                                  ),
                                );
                              } else {
                                // generate OTP
                                logFirebaseEvent('Button_generateOTP');
                                _model.otpValue = await actions.generateOtp(
                                  _model.phoneNumberTextController.text,
                                );
                                // Send SMS
                                logFirebaseEvent('Button_SendSMS');
                                _model.apiSendSms = await SendOtpSMSCall.call(
                                  sendTo: _model.phoneNumberTextController.text,
                                  msg:
                                      '${_model.otpValue?.toString()} is your OTP to log in to Dashfit Workout Challenge app. Valid for 10 minutes. Please do not share this OTP. Regards, Dash Fitness',
                                  userid: '2000240931',
                                );

                                if ((_model.apiSendSms?.succeeded ?? true)) {
                                  logFirebaseEvent('Button_firestore_query');
                                  _model.mobileNumberOtpExists =
                                      await queryMobileOtpRecordOnce(
                                    queryBuilder: (mobileOtpRecord) =>
                                        mobileOtpRecord.where(
                                      'mobileNumber',
                                      isEqualTo:
                                          '+91${_model.phoneNumberTextController.text}',
                                    ),
                                    singleRecord: true,
                                  ).then((s) => s.firstOrNull);
                                  if (_model.mobileNumberOtpExists != null) {
                                    logFirebaseEvent('Button_backend_call');

                                    await _model
                                        .mobileNumberOtpExists!.reference
                                        .update(createMobileOtpRecordData(
                                      otp: _model.otpValue,
                                      expiryDate: functions.getExpiryTime(5),
                                    ));
                                  } else {
                                    // SaveMobile Otp
                                    logFirebaseEvent('Button_SaveMobileOtp');

                                    var mobileOtpRecordReference =
                                        MobileOtpRecord.collection.doc();
                                    await mobileOtpRecordReference
                                        .set(createMobileOtpRecordData(
                                      mobileNumber:
                                          '+91${_model.phoneNumberTextController.text}',
                                      otp: _model.otpValue,
                                      expiryDate: functions.getExpiryTime(5),
                                    ));
                                    _model.otp =
                                        MobileOtpRecord.getDocumentFromData(
                                            createMobileOtpRecordData(
                                              mobileNumber:
                                                  '+91${_model.phoneNumberTextController.text}',
                                              otp: _model.otpValue,
                                              expiryDate:
                                                  functions.getExpiryTime(5),
                                            ),
                                            mobileOtpRecordReference);
                                  }

                                  logFirebaseEvent('Button_navigate_to');

                                  context.pushNamed(
                                    'ClientOtp',
                                    queryParameters: {
                                      'mobileNumber': serializeParam(
                                        _model.phoneNumberTextController.text,
                                        ParamType.String,
                                      ),
                                    }.withoutNulls,
                                  );
                                } else {
                                  logFirebaseEvent('Button_show_snack_bar');
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Failed to send OTP. Please try again later.',
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                        ),
                                      ),
                                      duration: const Duration(milliseconds: 4000),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context).error,
                                    ),
                                  );
                                }
                              }

                              safeSetState(() {});
                            },
                            text: 'Send OTP',
                            options: FFButtonOptions(
                              height: 40.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: const EdgeInsets.all(0.0),
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
                      ].divide(const SizedBox(height: 20.0)),
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
      ),
    );
  }
}
