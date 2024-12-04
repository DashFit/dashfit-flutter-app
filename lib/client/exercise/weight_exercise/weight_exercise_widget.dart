import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'weight_exercise_model.dart';
export 'weight_exercise_model.dart';

class WeightExerciseWidget extends StatefulWidget {
  const WeightExerciseWidget({
    super.key,
    required this.exerciseDate,
    required this.exercise,
    this.weightLifted,
    int? repetitions,
    int? sets,
    this.oldExerciseScore,
    String? weightUnit,
  })  : repetitions = repetitions ?? 1,
        sets = sets ?? 1,
        weightUnit = weightUnit ?? 'kg';

  final DateTime? exerciseDate;
  final DocumentReference? exercise;
  final double? weightLifted;
  final int repetitions;
  final int sets;
  final DocumentReference? oldExerciseScore;
  final String weightUnit;

  @override
  State<WeightExerciseWidget> createState() => _WeightExerciseWidgetState();
}

class _WeightExerciseWidgetState extends State<WeightExerciseWidget> {
  late WeightExerciseModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WeightExerciseModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'WeightExercise'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('WEIGHT_EXERCISE_WeightExercise_ON_INIT_S');
      logFirebaseEvent('WeightExercise_update_page_state');
      _model.selectedExerciseDate = widget.exerciseDate;
      _model.weightUnit = widget.weightUnit;
      safeSetState(() {});
    });

    _model.weightLiftedTxtTextController ??= TextEditingController(
        text: valueOrDefault<String>(
      widget.weightLifted?.toString(),
      '0',
    ));
    _model.weightLiftedTxtFocusNode ??= FocusNode();
    _model.weightLiftedTxtFocusNode!.addListener(
      () async {
        logFirebaseEvent('WEIGHT_EXERCISE_weightLiftedTxt_ON_FOCUS');
        if (_model.weightLiftedTxtTextController.text == '0') {
          logFirebaseEvent('weightLiftedTxt_clear_text_fields_pin_co');
          safeSetState(() {
            _model.weightLiftedTxtTextController?.clear();
          });
        }
      },
    );
    _model.repetitionTxtTextController ??= TextEditingController(
        text: valueOrDefault<String>(
      widget.repetitions.toString(),
      '1',
    ));
    _model.repetitionTxtFocusNode ??= FocusNode();

    _model.setTxtValTextController ??= TextEditingController(
        text: valueOrDefault<String>(
      widget.sets.toString(),
      '1',
    ));
    _model.setTxtValFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<ExercisesRecord>(
      stream: ExercisesRecord.getDocument(widget.exercise!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }

        final weightExerciseExercisesRecord = snapshot.data!;

        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: SafeArea(
              top: true,
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 0.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 20.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Align(
                                    alignment: const AlignmentDirectional(-1.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'WEIGHT_EXERCISE_Icon_6knt392c_ON_TAP');
                                        logFirebaseEvent('Icon_navigate_back');
                                        context.safePop();
                                      },
                                      child: const Icon(
                                        Icons.arrow_back_rounded,
                                        color: Color(0xFF40B1BF),
                                        size: 24.0,
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Align(
                                              alignment: const AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Container(
                                                      width: 32.0,
                                                      height: 32.0,
                                                      decoration: const BoxDecoration(
                                                        color:
                                                            Color(0xFF4C5259),
                                                        boxShadow: [
                                                          BoxShadow(
                                                            blurRadius: 4.0,
                                                            color: Color(
                                                                0x33000000),
                                                            offset: Offset(
                                                              0.0,
                                                              2.0,
                                                            ),
                                                          )
                                                        ],
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: Align(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Text(
                                                          '1',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Manrope',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    'Exercise',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Manrope',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                  ),
                                                ].divide(const SizedBox(height: 5.0)),
                                              ),
                                            ),
                                            const Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 20.0),
                                                child: Icon(
                                                  Icons.east,
                                                  color: Colors.black,
                                                  size: 30.0,
                                                ),
                                              ),
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Container(
                                                  width: 32.0,
                                                  height: 32.0,
                                                  decoration: const BoxDecoration(
                                                    color: Color(0xFF0098AD),
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Text(
                                                      '2',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Manrope',
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            fontSize: 14.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Text(
                                                    'Details',
                                                    textAlign: TextAlign.end,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Manrope',
                                                          color:
                                                              const Color(0xFF0098AD),
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                  ),
                                                ),
                                              ].divide(const SizedBox(height: 5.0)),
                                            ),
                                          ].divide(const SizedBox(width: 10.0)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            20.0, 35.0, 20.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'WEIGHT_EXERCISE_Container_po8y43op_ON_TA');
                                logFirebaseEvent('Container_date_time_picker');
                                final datePickedDate = await showDatePicker(
                                  context: context,
                                  initialDate:
                                      (widget.exerciseDate ?? DateTime.now()),
                                  firstDate: DateTime(1900),
                                  lastDate:
                                      (getCurrentTimestamp ?? DateTime(2050)),
                                  builder: (context, child) {
                                    return wrapInMaterialDatePickerTheme(
                                      context,
                                      child!,
                                      headerBackgroundColor: const Color(0xFF0098AD),
                                      headerForegroundColor:
                                          FlutterFlowTheme.of(context).info,
                                      headerTextStyle:
                                          FlutterFlowTheme.of(context)
                                              .headlineLarge
                                              .override(
                                                fontFamily: 'Manrope',
                                                fontSize: 32.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                      pickerBackgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                      pickerForegroundColor:
                                          FlutterFlowTheme.of(context)
                                              .primaryText,
                                      selectedDateTimeBackgroundColor:
                                          const Color(0xFF0098AD),
                                      selectedDateTimeForegroundColor:
                                          FlutterFlowTheme.of(context).info,
                                      actionButtonForegroundColor:
                                          FlutterFlowTheme.of(context)
                                              .primaryText,
                                      iconSize: 24.0,
                                    );
                                  },
                                );

                                if (datePickedDate != null) {
                                  safeSetState(() {
                                    _model.datePicked = DateTime(
                                      datePickedDate.year,
                                      datePickedDate.month,
                                      datePickedDate.day,
                                    );
                                  });
                                }
                                logFirebaseEvent('Container_update_page_state');
                                _model.selectedExerciseDate = _model.datePicked;
                                safeSetState(() {});
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(8.0),
                                    bottomRight: Radius.circular(8.0),
                                    topLeft: Radius.circular(8.0),
                                    topRight: Radius.circular(8.0),
                                  ),
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    width: 0.3,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      10.0, 13.0, 10.0, 13.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        dateTimeFormat(
                                          "MMMEd",
                                          _model.selectedExerciseDate,
                                          locale: FFLocalizations.of(context)
                                              .languageCode,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Manrope',
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                      const Icon(
                                        Icons.keyboard_arrow_down,
                                        color: Color(0xFF0098AD),
                                        size: 24.0,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  width: 0.3,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    10.0, 13.0, 10.0, 13.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.network(
                                        functions.getImageUrl(
                                            weightExerciseExercisesRecord.code,
                                            FFAppState().imageUrl.baseUrl,
                                            FFAppState().imageUrl.path,
                                            FFAppState().imageUrl.suffix),
                                        width: 40.0,
                                        height: 40.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    FutureBuilder<ExercisesRecord>(
                                      future: ExercisesRecord.getDocumentOnce(
                                          widget.exercise!),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }

                                        final textExercisesRecord =
                                            snapshot.data!;

                                        return Text(
                                          textExercisesRecord.name,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Manrope',
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        );
                                      },
                                    ),
                                  ].divide(const SizedBox(width: 10.0)),
                                ),
                              ),
                            ),
                          ].divide(const SizedBox(height: 20.0)),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                        child: Container(
                          height: 540.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 14.0,
                                color: Color(0xFFDFDFDF),
                                offset: Offset(
                                  0.0,
                                  0.0,
                                ),
                              )
                            ],
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(0.0),
                              bottomRight: Radius.circular(0.0),
                              topLeft: Radius.circular(24.0),
                              topRight: Radius.circular(24.0),
                            ),
                            shape: BoxShape.rectangle,
                            border: Border.all(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              width: 2.0,
                            ),
                          ),
                          child: Form(
                            key: _model.formKey,
                            autovalidateMode: AutovalidateMode.disabled,
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  20.0, 25.0, 20.0, 20.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Weight Lifted (Both hands)',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Manrope',
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 10.0, 0.0),
                                        child: FlutterFlowRadioButton(
                                          options: ['kg', 'lb'].toList(),
                                          onChanged: (val) async {
                                            safeSetState(() {});
                                            logFirebaseEvent(
                                                'WEIGHT_EXERCISE_weightUnitBtn_ON_FORM_WI');
                                            logFirebaseEvent(
                                                'weightUnitBtn_update_page_state');
                                            _model.weightUnit =
                                                _model.weightUnitBtnValue!;
                                            safeSetState(() {});
                                            logFirebaseEvent(
                                                'weightUnitBtn_set_form_field');
                                            safeSetState(() {
                                              _model
                                                  .weightLiftedTxtTextController
                                                  ?.text = '0';
                                              _model.weightLiftedTxtFocusNode
                                                  ?.requestFocus();
                                              WidgetsBinding.instance
                                                  .addPostFrameCallback((_) {
                                                _model.weightLiftedTxtTextController
                                                        ?.selection =
                                                    TextSelection.collapsed(
                                                  offset: _model
                                                      .weightLiftedTxtTextController!
                                                      .text
                                                      .length,
                                                );
                                              });
                                            });
                                          },
                                          controller: _model
                                                  .weightUnitBtnValueController ??=
                                              FormFieldController<String>(
                                                  valueOrDefault<String>(
                                            widget.weightUnit,
                                            'kg',
                                          )),
                                          optionHeight: 32.0,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'Manrope',
                                                    letterSpacing: 0.0,
                                                  ),
                                          selectedTextStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Manrope',
                                                    fontSize: 18.0,
                                                    letterSpacing: 0.0,
                                                  ),
                                          buttonPosition:
                                              RadioButtonPosition.left,
                                          direction: Axis.horizontal,
                                          radioButtonColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          inactiveRadioButtonColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                          toggleable: false,
                                          horizontalAlignment:
                                              WrapAlignment.start,
                                          verticalAlignment:
                                              WrapCrossAlignment.start,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'WEIGHT_EXERCISE_Container_x6556rk0_ON_TA');
                                            logFirebaseEvent(
                                                'Container_set_form_field');
                                            safeSetState(() {
                                              _model
                                                  .weightLiftedTxtTextController
                                                  ?.text = ((double
                                                              weightLifted,
                                                          String weightunit) {
                                                return (weightunit == 'kg')
                                                    ? ((weightLifted <= 2.5)
                                                        ? 0
                                                        : weightLifted - 2.5)
                                                    : ((weightLifted <= 10)
                                                        ? 0
                                                        : weightLifted - 10);
                                              }(
                                                      double.parse(_model
                                                          .weightLiftedTxtTextController
                                                          .text),
                                                      _model.weightUnit))
                                                  .toString();
                                              _model.weightLiftedTxtFocusNode
                                                  ?.requestFocus();
                                              WidgetsBinding.instance
                                                  .addPostFrameCallback((_) {
                                                _model.weightLiftedTxtTextController
                                                        ?.selection =
                                                    TextSelection.collapsed(
                                                  offset: _model
                                                      .weightLiftedTxtTextController!
                                                      .text
                                                      .length,
                                                );
                                              });
                                            });
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: const Color(0xFFE8FBFF),
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              border: Border.all(
                                                color: const Color(0xFFCCF2F8),
                                              ),
                                            ),
                                            child: const Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 2.0, 10.0, 16.0),
                                                child: Icon(
                                                  Icons.minimize,
                                                  color: Color(0xFF40B1BF),
                                                  size: 24.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 5,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                            ),
                                          ),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    7.0, 0.0, 7.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: TextFormField(
                                                    controller: _model
                                                        .weightLiftedTxtTextController,
                                                    focusNode: _model
                                                        .weightLiftedTxtFocusNode,
                                                    autofocus: false,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      labelText: 'Weight',
                                                      labelStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Manrope',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      hintStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Manrope',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      enabledBorder:
                                                          InputBorder.none,
                                                      focusedBorder:
                                                          InputBorder.none,
                                                      errorBorder:
                                                          InputBorder.none,
                                                      focusedErrorBorder:
                                                          InputBorder.none,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Manrope',
                                                          letterSpacing: 0.0,
                                                        ),
                                                    maxLength: 5,
                                                    buildCounter: (context,
                                                            {required currentLength,
                                                            required isFocused,
                                                            maxLength}) =>
                                                        null,
                                                    keyboardType:
                                                        const TextInputType
                                                            .numberWithOptions(
                                                            decimal: true),
                                                    validator: _model
                                                        .weightLiftedTxtTextControllerValidator
                                                        .asValidator(context),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 14.0, 0.0, 0.0),
                                                  child: Text(
                                                    _model.weightUnitBtnValue ==
                                                            'kg'
                                                        ? 'kg'
                                                        : 'lb',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Manrope',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'WEIGHT_EXERCISE_Container_ifkg9ehj_ON_TA');
                                            logFirebaseEvent(
                                                'Container_set_form_field');
                                            safeSetState(() {
                                              _model
                                                  .weightLiftedTxtTextController
                                                  ?.text = ((double
                                                              weightlifted,
                                                          String weightunit) {
                                                return (weightunit == 'kg')
                                                    ? weightlifted + 2.5
                                                    : weightlifted + 10;
                                              }(
                                                      double.parse(_model
                                                          .weightLiftedTxtTextController
                                                          .text),
                                                      _model.weightUnit))
                                                  .toString();
                                              _model.weightLiftedTxtFocusNode
                                                  ?.requestFocus();
                                              WidgetsBinding.instance
                                                  .addPostFrameCallback((_) {
                                                _model.weightLiftedTxtTextController
                                                        ?.selection =
                                                    TextSelection.collapsed(
                                                  offset: _model
                                                      .weightLiftedTxtTextController!
                                                      .text
                                                      .length,
                                                );
                                              });
                                            });
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: const Color(0xFFE8FBFF),
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              border: Border.all(
                                                color: const Color(0xFFCCF2F8),
                                              ),
                                            ),
                                            child: const Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsets.all(10.0),
                                                child: Icon(
                                                  Icons.add,
                                                  color: Color(0xFF40B1BF),
                                                  size: 24.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ].divide(const SizedBox(width: 10.0)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 30.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          'Repetitions',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Manrope',
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                        Text(
                                          'Sets',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Manrope',
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                      ].divide(const SizedBox(width: 110.0)),
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.38,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.06,
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFE8FBFF),
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          border: Border.all(
                                            color: const Color(0xFFCCF2F8),
                                          ),
                                        ),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'WEIGHT_EXERCISE_Icon_aewwpml6_ON_TAP');
                                            logFirebaseEvent(
                                                'Icon_set_form_field');
                                            safeSetState(() {
                                              _model.repetitionTxtTextController
                                                  ?.text = (int.parse(_model
                                                          .repetitionTxtTextController
                                                          .text) +
                                                      1)
                                                  .toString();
                                              _model.repetitionTxtFocusNode
                                                  ?.requestFocus();
                                              WidgetsBinding.instance
                                                  .addPostFrameCallback((_) {
                                                _model.repetitionTxtTextController
                                                        ?.selection =
                                                    TextSelection.collapsed(
                                                  offset: _model
                                                      .repetitionTxtTextController!
                                                      .text
                                                      .length,
                                                );
                                              });
                                            });
                                          },
                                          child: const Icon(
                                            Icons.add,
                                            color: Color(0xFF40B1BF),
                                            size: 24.0,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.38,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.06,
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFE8FBFF),
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          border: Border.all(
                                            color: const Color(0xFFCCF2F8),
                                          ),
                                        ),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'WEIGHT_EXERCISE_Icon_evrngxs7_ON_TAP');
                                            logFirebaseEvent(
                                                'Icon_set_form_field');
                                            safeSetState(() {
                                              _model.setTxtValTextController
                                                  ?.text = (int.parse(_model
                                                          .setTxtValTextController
                                                          .text) +
                                                      1)
                                                  .toString();
                                              _model.setTxtValFocusNode
                                                  ?.requestFocus();
                                              WidgetsBinding.instance
                                                  .addPostFrameCallback((_) {
                                                _model.setTxtValTextController
                                                        ?.selection =
                                                    TextSelection.collapsed(
                                                  offset: _model
                                                      .setTxtValTextController!
                                                      .text
                                                      .length,
                                                );
                                              });
                                            });
                                          },
                                          child: const Icon(
                                            Icons.add,
                                            color: Color(0xFF40B1BF),
                                            size: 24.0,
                                          ),
                                        ),
                                      ),
                                    ].divide(const SizedBox(width: 42.0)),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.38,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.06,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 0.0, 8.0, 0.0),
                                          child: TextFormField(
                                            controller: _model
                                                .repetitionTxtTextController,
                                            focusNode:
                                                _model.repetitionTxtFocusNode,
                                            autofocus: false,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'Manrope',
                                                        letterSpacing: 0.0,
                                                      ),
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'Manrope',
                                                        letterSpacing: 0.0,
                                                      ),
                                              enabledBorder: InputBorder.none,
                                              focusedBorder: InputBorder.none,
                                              errorBorder: InputBorder.none,
                                              focusedErrorBorder:
                                                  InputBorder.none,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Manrope',
                                                  letterSpacing: 0.0,
                                                ),
                                            textAlign: TextAlign.center,
                                            maxLength: 2,
                                            buildCounter: (context,
                                                    {required currentLength,
                                                    required isFocused,
                                                    maxLength}) =>
                                                null,
                                            keyboardType: TextInputType.number,
                                            validator: _model
                                                .repetitionTxtTextControllerValidator
                                                .asValidator(context),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        'X',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Manrope',
                                              fontSize: 18.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w800,
                                            ),
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.38,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.06,
                                        constraints: const BoxConstraints(
                                          minWidth: 80.0,
                                          minHeight: 50.0,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 0.0, 8.0, 0.0),
                                          child: TextFormField(
                                            controller:
                                                _model.setTxtValTextController,
                                            focusNode:
                                                _model.setTxtValFocusNode,
                                            autofocus: false,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'Manrope',
                                                        letterSpacing: 0.0,
                                                      ),
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'Manrope',
                                                        letterSpacing: 0.0,
                                                      ),
                                              enabledBorder: InputBorder.none,
                                              focusedBorder: InputBorder.none,
                                              errorBorder: InputBorder.none,
                                              focusedErrorBorder:
                                                  InputBorder.none,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Manrope',
                                                  letterSpacing: 0.0,
                                                ),
                                            textAlign: TextAlign.center,
                                            maxLength: 2,
                                            buildCounter: (context,
                                                    {required currentLength,
                                                    required isFocused,
                                                    maxLength}) =>
                                                null,
                                            keyboardType: TextInputType.number,
                                            validator: _model
                                                .setTxtValTextControllerValidator
                                                .asValidator(context),
                                          ),
                                        ),
                                      ),
                                    ].divide(const SizedBox(width: 15.0)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 20.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'WEIGHT_EXERCISE_Container_k1w7vwm0_ON_TA');
                                            logFirebaseEvent(
                                                'Container_set_form_field');
                                            safeSetState(() {
                                              _model.repetitionTxtTextController
                                                  ?.text = ((int repetition) {
                                                return (repetition <= 1)
                                                    ? 1
                                                    : repetition - 1;
                                              }(int.parse(_model
                                                      .repetitionTxtTextController
                                                      .text)))
                                                  .toString();
                                              _model.repetitionTxtFocusNode
                                                  ?.requestFocus();
                                              WidgetsBinding.instance
                                                  .addPostFrameCallback((_) {
                                                _model.repetitionTxtTextController
                                                        ?.selection =
                                                    TextSelection.collapsed(
                                                  offset: _model
                                                      .repetitionTxtTextController!
                                                      .text
                                                      .length,
                                                );
                                              });
                                            });
                                          },
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.38,
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                0.06,
                                            decoration: BoxDecoration(
                                              color: const Color(0xFFE8FBFF),
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              border: Border.all(
                                                color: const Color(0xFFCCF2F8),
                                              ),
                                            ),
                                            child: const Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 15.0),
                                              child: Icon(
                                                Icons.minimize_sharp,
                                                color: Color(0xFF40B1BF),
                                                size: 24.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'WEIGHT_EXERCISE_Container_fneczmos_ON_TA');
                                            logFirebaseEvent(
                                                'Container_set_form_field');
                                            safeSetState(() {
                                              _model.setTxtValTextController
                                                  ?.text = ((int repetition) {
                                                return (repetition <= 1)
                                                    ? 1
                                                    : repetition - 1;
                                              }(int.parse(_model
                                                      .setTxtValTextController
                                                      .text)))
                                                  .toString();
                                              _model.setTxtValFocusNode
                                                  ?.requestFocus();
                                              WidgetsBinding.instance
                                                  .addPostFrameCallback((_) {
                                                _model.setTxtValTextController
                                                        ?.selection =
                                                    TextSelection.collapsed(
                                                  offset: _model
                                                      .setTxtValTextController!
                                                      .text
                                                      .length,
                                                );
                                              });
                                            });
                                          },
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.38,
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                0.06,
                                            decoration: BoxDecoration(
                                              color: const Color(0xFFE8FBFF),
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              border: Border.all(
                                                color: const Color(0xFFCCF2F8),
                                              ),
                                            ),
                                            child: const Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 15.0),
                                              child: Icon(
                                                Icons.minimize,
                                                color: Color(0xFF40B1BF),
                                                size: 24.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ].divide(const SizedBox(width: 42.0)),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF4CB256),
                                      borderRadius: BorderRadius.circular(6.0),
                                    ),
                                  ),
                                  Builder(
                                    builder: (context) {
                                      if (widget.oldExerciseScore != null) {
                                        return FFButtonWidget(
                                          onPressed: () async {
                                            logFirebaseEvent(
                                                'WEIGHT_EXERCISE_PAGE_UpdateButton_ON_TAP');
                                            // Get user data
                                            logFirebaseEvent(
                                                'UpdateButton_Getuserdata');
                                            _model.updateUserDataResponse =
                                                await UsersDataRecord
                                                    .getDocumentOnce(FFAppState()
                                                        .userDataReference!);
                                            logFirebaseEvent(
                                                'UpdateButton_custom_action');
                                            _model.updateActionCalculateWeightScoreResponse =
                                                await actions
                                                    .actionWeightsFunctionalScore(
                                              double.parse(_model
                                                  .weightLiftedTxtTextController
                                                  .text),
                                              _model.weightUnitBtnValue!,
                                              int.parse(_model
                                                  .repetitionTxtTextController
                                                  .text),
                                              int.parse(_model
                                                  .setTxtValTextController
                                                  .text),
                                              FFAppConstants.rpe,
                                              weightExerciseExercisesRecord,
                                              functions.getHeightBasedMultiplierValue(_model
                                                          .updateUserDataResponse
                                                          ?.height
                                                          .name ==
                                                      'feet inch'
                                                  ? functions.convertFeetInchToCM(
                                                      _model
                                                          .updateUserDataResponse
                                                          ?.feet,
                                                      _model
                                                          .updateUserDataResponse
                                                          ?.inch)
                                                  : functions
                                                      .convertStringToDouble(_model
                                                          .updateUserDataResponse
                                                          ?.height
                                                          .value))!,
                                              FFAppState().musclesData.toList(),
                                            );
                                            if (_model
                                                    .updateActionCalculateWeightScoreResponse
                                                    ?.totalScore ==
                                                0.0) {
                                              logFirebaseEvent(
                                                  'UpdateButton_show_snack_bar');
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'Additionaal weight needs to be changed',
                                                    style: TextStyle(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                    ),
                                                  ),
                                                  duration: const Duration(
                                                      milliseconds: 4000),
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondary,
                                                ),
                                              );
                                            } else {
                                              // Read Old Exercise Score Data
                                              logFirebaseEvent(
                                                  'UpdateButton_ReadOldExerciseScoreData');
                                              _model.oldExerciseScoreResponse =
                                                  await ExerciseScoresDataRecord
                                                      .getDocumentOnce(widget
                                                          .oldExerciseScore!);
                                              // Read day score data
                                              logFirebaseEvent(
                                                  'UpdateButton_Readdayscoredata');
                                              _model.updateDayScoreResponse =
                                                  await queryDayScoresDataRecordOnce(
                                                parent: FFAppState()
                                                    .userDataReference,
                                                queryBuilder:
                                                    (dayScoresDataRecord) =>
                                                        dayScoresDataRecord
                                                            .where(
                                                  'date',
                                                  isEqualTo: functions
                                                      .convertDateTimeToDate(
                                                          widget
                                                              .exerciseDate!),
                                                ),
                                                singleRecord: true,
                                              ).then((s) => s.firstOrNull);
                                              // Update new score to old doc
                                              logFirebaseEvent(
                                                  'UpdateButton_Updatenewscoretoolddoc');

                                              await widget.oldExerciseScore!
                                                  .update({
                                                ...createExerciseScoresDataRecordData(
                                                  totalScore: _model
                                                      .updateActionCalculateWeightScoreResponse
                                                      ?.totalScore,
                                                  formData:
                                                      updateExerciseFormDataStruct(
                                                    _model
                                                        .updateActionCalculateWeightScoreResponse
                                                        ?.formData,
                                                    clearUnsetFields: false,
                                                  ),
                                                ),
                                                ...mapToFirestore(
                                                  {
                                                    'muscles':
                                                        getMusclesListFirestoreData(
                                                      _model
                                                          .updateActionCalculateWeightScoreResponse
                                                          ?.muscles,
                                                    ),
                                                  },
                                                ),
                                              });
                                              // get the modified muscles score for day
                                              logFirebaseEvent(
                                                  'UpdateButton_getthemodifiedmusclesscoref');
                                              _model.newMusclesScoresResponse =
                                                  await actions
                                                      .modifyMusclesScore(
                                                _model.updateDayScoreResponse!
                                                    .musclesScore
                                                    .toList(),
                                                _model
                                                    .updateActionCalculateWeightScoreResponse!
                                                    .muscles
                                                    .toList(),
                                                _model.oldExerciseScoreResponse!
                                                    .muscles
                                                    .toList(),
                                              );
                                              // Update new score response
                                              logFirebaseEvent(
                                                  'UpdateButton_Updatenewscoreresponse');

                                              await _model
                                                  .updateDayScoreResponse!
                                                  .reference
                                                  .update({
                                                ...createDayScoresDataRecordData(
                                                  totalScore: _model
                                                      .newMusclesScoresResponse
                                                      ?.totalScore,
                                                ),
                                                ...mapToFirestore(
                                                  {
                                                    'musclesScore':
                                                        getMusclesListFirestoreData(
                                                      _model
                                                          .newMusclesScoresResponse
                                                          ?.muscles,
                                                    ),
                                                  },
                                                ),
                                              });
                                              logFirebaseEvent(
                                                  'UpdateButton_navigate_to');

                                              context.goNamed(
                                                'ExerciseScoreList',
                                                queryParameters: {
                                                  'exerciseDate':
                                                      serializeParam(
                                                    widget.exerciseDate,
                                                    ParamType.DateTime,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            }

                                            safeSetState(() {});
                                          },
                                          text: 'Update',
                                          icon: const Icon(
                                            Icons.edit,
                                            size: 15.0,
                                          ),
                                          options: FFButtonOptions(
                                            width: double.infinity,
                                            height: 40.0,
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 0.0, 24.0, 0.0),
                                            iconPadding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: const Color(0xFF4CB256),
                                            textStyle:
                                                FlutterFlowTheme.of(context)
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
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        );
                                      } else {
                                        return FFButtonWidget(
                                          onPressed: () async {
                                            logFirebaseEvent(
                                                'WEIGHT_EXERCISE_PAGE_ADD_BTN_ON_TAP');
                                            // Get user data
                                            logFirebaseEvent(
                                                'Button_Getuserdata');
                                            _model.userDataResponse =
                                                await UsersDataRecord
                                                    .getDocumentOnce(FFAppState()
                                                        .userDataReference!);
                                            logFirebaseEvent(
                                                'Button_custom_action');
                                            _model.actionCalculateWeightScoreResponse =
                                                await actions
                                                    .actionWeightsFunctionalScore(
                                              double.parse(_model
                                                  .weightLiftedTxtTextController
                                                  .text),
                                              _model.weightUnitBtnValue!,
                                              int.parse(_model
                                                  .repetitionTxtTextController
                                                  .text),
                                              int.parse(_model
                                                  .setTxtValTextController
                                                  .text),
                                              FFAppConstants.rpe,
                                              weightExerciseExercisesRecord,
                                              functions.getHeightBasedMultiplierValue(_model
                                                          .userDataResponse
                                                          ?.height
                                                          .name ==
                                                      'feet inch'
                                                  ? functions
                                                      .convertFeetInchToCM(
                                                          _model
                                                              .userDataResponse
                                                              ?.feet,
                                                          _model
                                                              .userDataResponse
                                                              ?.inch)
                                                  : functions
                                                      .convertStringToDouble(
                                                          _model
                                                              .userDataResponse
                                                              ?.height
                                                              .value))!,
                                              FFAppState().musclesData.toList(),
                                            );
                                            if (_model
                                                    .actionCalculateWeightScoreResponse
                                                    ?.totalScore ==
                                                0.0) {
                                              logFirebaseEvent(
                                                  'Button_show_snack_bar');
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'Seems you missed entering a value. Kindly recheck',
                                                    style: TextStyle(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                    ),
                                                  ),
                                                  duration: const Duration(
                                                      milliseconds: 4000),
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondary,
                                                ),
                                              );
                                            } else {
                                              // Get Todays Days Scores
                                              logFirebaseEvent(
                                                  'Button_GetTodaysDaysScores');
                                              _model.getDayScoreResponse =
                                                  await queryDayScoresDataRecordOnce(
                                                parent: _model.userDataResponse
                                                    ?.reference,
                                                queryBuilder:
                                                    (dayScoresDataRecord) =>
                                                        dayScoresDataRecord
                                                            .where(
                                                  'date',
                                                  isEqualTo: functions
                                                      .convertDateTimeToDate(_model
                                                          .selectedExerciseDate!),
                                                ),
                                                singleRecord: true,
                                              ).then((s) => s.firstOrNull);
                                              if (_model.getDayScoreResponse !=
                                                  null) {
                                                // Update Day Score
                                                logFirebaseEvent(
                                                    'Button_UpdateDayScore');

                                                await _model
                                                    .getDayScoreResponse!
                                                    .reference
                                                    .update({
                                                  ...createDayScoresDataRecordData(
                                                    totalScore: double.parse((_model
                                                                .actionCalculateWeightScoreResponse!
                                                                .totalScore +
                                                            _model
                                                                .getDayScoreResponse!
                                                                .totalScore)
                                                        .toStringAsFixed(2)),
                                                  ),
                                                  ...mapToFirestore(
                                                    {
                                                      'musclesScore':
                                                          getMusclesListFirestoreData(
                                                        functions.sumMusclesSocre(
                                                            _model
                                                                .getDayScoreResponse!
                                                                .musclesScore
                                                                .toList(),
                                                            _model
                                                                .actionCalculateWeightScoreResponse!
                                                                .muscles
                                                                .toList()),
                                                      ),
                                                    },
                                                  ),
                                                });
                                              } else {
                                                // Create Doc
                                                logFirebaseEvent(
                                                    'Button_CreateDoc');

                                                var dayScoresDataRecordReference =
                                                    DayScoresDataRecord
                                                        .createDoc(_model
                                                            .userDataResponse!
                                                            .reference);
                                                await dayScoresDataRecordReference
                                                    .set({
                                                  ...createDayScoresDataRecordData(
                                                    date: functions
                                                        .convertDateTimeToDate(
                                                            _model
                                                                .selectedExerciseDate!),
                                                    totalScore:
                                                        valueOrDefault<double>(
                                                      _model
                                                          .actionCalculateWeightScoreResponse
                                                          ?.totalScore,
                                                      0.0,
                                                    ),
                                                  ),
                                                  ...mapToFirestore(
                                                    {
                                                      'musclesScore':
                                                          getMusclesListFirestoreData(
                                                        _model
                                                            .actionCalculateWeightScoreResponse
                                                            ?.muscles,
                                                      ),
                                                    },
                                                  ),
                                                });
                                                _model.newDayScoreResponse =
                                                    DayScoresDataRecord
                                                        .getDocumentFromData({
                                                  ...createDayScoresDataRecordData(
                                                    date: functions
                                                        .convertDateTimeToDate(
                                                            _model
                                                                .selectedExerciseDate!),
                                                    totalScore:
                                                        valueOrDefault<double>(
                                                      _model
                                                          .actionCalculateWeightScoreResponse
                                                          ?.totalScore,
                                                      0.0,
                                                    ),
                                                  ),
                                                  ...mapToFirestore(
                                                    {
                                                      'musclesScore':
                                                          getMusclesListFirestoreData(
                                                        _model
                                                            .actionCalculateWeightScoreResponse
                                                            ?.muscles,
                                                      ),
                                                    },
                                                  ),
                                                }, dayScoresDataRecordReference);
                                              }

                                              // Create Exercise Doc
                                              logFirebaseEvent(
                                                  'Button_CreateExerciseDoc');

                                              var exerciseScoresDataRecordReference =
                                                  ExerciseScoresDataRecord
                                                      .createDoc(_model
                                                          .userDataResponse!
                                                          .reference);
                                              await exerciseScoresDataRecordReference
                                                  .set({
                                                ...createExerciseScoresDataRecordData(
                                                  date: functions
                                                      .convertDateTimeToDate(_model
                                                          .selectedExerciseDate!),
                                                  name: _model
                                                      .actionCalculateWeightScoreResponse
                                                      ?.name,
                                                  totalScore: _model
                                                      .actionCalculateWeightScoreResponse
                                                      ?.totalScore,
                                                  formData:
                                                      updateExerciseFormDataStruct(
                                                    _model
                                                        .actionCalculateWeightScoreResponse
                                                        ?.formData,
                                                    clearUnsetFields: false,
                                                    create: true,
                                                  ),
                                                  imageUrl:
                                                      weightExerciseExercisesRecord
                                                          .imageUrl,
                                                  exercisesReference:
                                                      widget.exercise,
                                                  workoutType:
                                                      weightExerciseExercisesRecord
                                                          .workoutType.name,
                                                  timeStamp:
                                                      getCurrentTimestamp,
                                                ),
                                                ...mapToFirestore(
                                                  {
                                                    'muscles':
                                                        getMusclesListFirestoreData(
                                                      _model
                                                          .actionCalculateWeightScoreResponse
                                                          ?.muscles,
                                                    ),
                                                  },
                                                ),
                                              });
                                              _model.newExerciseScoreResponse =
                                                  ExerciseScoresDataRecord
                                                      .getDocumentFromData({
                                                ...createExerciseScoresDataRecordData(
                                                  date: functions
                                                      .convertDateTimeToDate(_model
                                                          .selectedExerciseDate!),
                                                  name: _model
                                                      .actionCalculateWeightScoreResponse
                                                      ?.name,
                                                  totalScore: _model
                                                      .actionCalculateWeightScoreResponse
                                                      ?.totalScore,
                                                  formData:
                                                      updateExerciseFormDataStruct(
                                                    _model
                                                        .actionCalculateWeightScoreResponse
                                                        ?.formData,
                                                    clearUnsetFields: false,
                                                    create: true,
                                                  ),
                                                  imageUrl:
                                                      weightExerciseExercisesRecord
                                                          .imageUrl,
                                                  exercisesReference:
                                                      widget.exercise,
                                                  workoutType:
                                                      weightExerciseExercisesRecord
                                                          .workoutType.name,
                                                  timeStamp:
                                                      getCurrentTimestamp,
                                                ),
                                                ...mapToFirestore(
                                                  {
                                                    'muscles':
                                                        getMusclesListFirestoreData(
                                                      _model
                                                          .actionCalculateWeightScoreResponse
                                                          ?.muscles,
                                                    ),
                                                  },
                                                ),
                                              }, exerciseScoresDataRecordReference);
                                              logFirebaseEvent(
                                                  'Button_navigate_to');

                                              context.goNamed(
                                                'ExerciseScoreList',
                                                queryParameters: {
                                                  'exerciseDate':
                                                      serializeParam(
                                                    _model.selectedExerciseDate,
                                                    ParamType.DateTime,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            }

                                            safeSetState(() {});
                                          },
                                          text: 'Add',
                                          icon: const Icon(
                                            Icons.add,
                                            size: 15.0,
                                          ),
                                          options: FFButtonOptions(
                                            width: double.infinity,
                                            height: 40.0,
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 0.0, 24.0, 0.0),
                                            iconPadding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: const Color(0xFF4CB256),
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleMedium
                                                    .override(
                                                      fontFamily: 'Manrope',
                                                      letterSpacing: 0.0,
                                                    ),
                                            elevation: 3.0,
                                            borderSide: const BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                ].divide(const SizedBox(height: 12.0)),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
