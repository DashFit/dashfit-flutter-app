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
import 'functional_exercise_model.dart';
export 'functional_exercise_model.dart';

class FunctionalExerciseWidget extends StatefulWidget {
  const FunctionalExerciseWidget({
    super.key,
    required this.exerciseDate,
    required this.exercise,
    this.additionalWeight,
    int? repetitions,
    int? sets,
    this.oldExerciseScore,
    String? weightUnit,
  })  : repetitions = repetitions ?? 1,
        sets = sets ?? 1,
        weightUnit = weightUnit ?? 'kg';

  final DateTime? exerciseDate;
  final DocumentReference? exercise;
  final double? additionalWeight;
  final int repetitions;
  final int sets;
  final DocumentReference? oldExerciseScore;
  final String weightUnit;

  @override
  State<FunctionalExerciseWidget> createState() =>
      _FunctionalExerciseWidgetState();
}

class _FunctionalExerciseWidgetState extends State<FunctionalExerciseWidget> {
  late FunctionalExerciseModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FunctionalExerciseModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'FunctionalExercise'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('FUNCTIONAL_EXERCISE_FunctionalExercise_O');
      logFirebaseEvent('FunctionalExercise_update_page_state');
      _model.selectedExerciseDate = widget.exerciseDate;
      _model.weightUnit = widget.weightUnit;
      safeSetState(() {});
    });

    _model.additionalWeighTxtValTextController ??= TextEditingController(
        text: valueOrDefault<String>(
      widget.additionalWeight?.toString(),
      '0',
    ));
    _model.additionalWeighTxtValFocusNode ??= FocusNode();
    _model.additionalWeighTxtValFocusNode!.addListener(
      () async {
        logFirebaseEvent('FUNCTIONAL_EXERCISE_additionalWeighTxtVa');
        if (_model.additionalWeighTxtValTextController.text == '0') {
          logFirebaseEvent('additionalWeighTxtVal_clear_text_fields_');
          safeSetState(() {
            _model.additionalWeighTxtValTextController?.clear();
          });
        }
      },
    );
    _model.reptitionsTxtValTextController ??= TextEditingController(
        text: valueOrDefault<String>(
      widget.repetitions.toString(),
      '1',
    ));
    _model.reptitionsTxtValFocusNode ??= FocusNode();

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

    return FutureBuilder<ExercisesRecord>(
      future: ExercisesRecord.getDocumentOnce(widget.exercise!),
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

        final functionalExerciseExercisesRecord = snapshot.data!;

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
                                            'FUNCTIONAL_EXERCISE_Icon_pag4uoy1_ON_TAP');
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
                                    'FUNCTIONAL_EXERCISE_Container_hx9nnpe8_O');
                                logFirebaseEvent('Container_date_time_picker');
                                final datePickedDate = await showDatePicker(
                                  context: context,
                                  initialDate:
                                      (widget.exerciseDate ?? DateTime.now()),
                                  firstDate: DateTime(1900),
                                  lastDate:
                                      (widget.exerciseDate ?? DateTime.now()),
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
                                            functionalExerciseExercisesRecord
                                                .code,
                                            FFAppState().imageUrl.baseUrl,
                                            FFAppState().imageUrl.path,
                                            FFAppState().imageUrl.suffix),
                                        width: 40.0,
                                        height: 40.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Text(
                                      functionalExerciseExercisesRecord.name,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Manrope',
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                          ),
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
                              child: SingleChildScrollView(
                                primary: false,
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Additional Weight \nlifted',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Manrope',
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                            Text(
                                              'Any additional weight that \nyou put on your body',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Manrope',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ].divide(const SizedBox(height: 4.0)),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 10.0, 0.0),
                                          child: FlutterFlowRadioButton(
                                            options: ['kg', 'lb'].toList(),
                                            onChanged: (val) async {
                                              safeSetState(() {});
                                              logFirebaseEvent(
                                                  'FUNCTIONAL_EXERCISE_weightUnitBtn_ON_FOR');
                                              logFirebaseEvent(
                                                  'weightUnitBtn_update_page_state');
                                              _model.weightUnit =
                                                  _model.weightUnitBtnValue!;
                                              safeSetState(() {});
                                              logFirebaseEvent(
                                                  'weightUnitBtn_set_form_field');
                                              safeSetState(() {
                                                _model
                                                    .additionalWeighTxtValTextController
                                                    ?.text = '0';
                                                _model
                                                    .additionalWeighTxtValFocusNode
                                                    ?.requestFocus();
                                                WidgetsBinding.instance
                                                    .addPostFrameCallback((_) {
                                                  _model.additionalWeighTxtValTextController
                                                          ?.selection =
                                                      TextSelection.collapsed(
                                                    offset: _model
                                                        .additionalWeighTxtValTextController!
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
                                                  'FUNCTIONAL_EXERCISE_Container_hdkuumyt_O');
                                              logFirebaseEvent(
                                                  'Container_set_form_field');
                                              safeSetState(() {
                                                _model
                                                    .additionalWeighTxtValTextController
                                                    ?.text = ((double
                                                                additionalweight,
                                                            String weightunit) {
                                                  return (weightunit == 'kg')
                                                      ? ((additionalweight <=
                                                              2.5)
                                                          ? 0
                                                          : additionalweight -
                                                              2.5)
                                                      : ((additionalweight <=
                                                              10)
                                                          ? 0
                                                          : additionalweight -
                                                              10);
                                                }(
                                                        double.parse(_model
                                                            .additionalWeighTxtValTextController
                                                            .text),
                                                        _model.weightUnit))
                                                    .toString();
                                                _model
                                                    .additionalWeighTxtValFocusNode
                                                    ?.requestFocus();
                                                WidgetsBinding.instance
                                                    .addPostFrameCallback((_) {
                                                  _model.additionalWeighTxtValTextController
                                                          ?.selection =
                                                      TextSelection.collapsed(
                                                    offset: _model
                                                        .additionalWeighTxtValTextController!
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
                                                      .fromSTEB(10.0, 2.0, 10.0,
                                                          16.0),
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
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(7.0, 0.0, 7.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Expanded(
                                                    child: TextFormField(
                                                      controller: _model
                                                          .additionalWeighTxtValTextController,
                                                      focusNode: _model
                                                          .additionalWeighTxtValFocusNode,
                                                      autofocus: false,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        labelText:
                                                            'Additional Weight',
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Manrope',
                                                                  fontSize:
                                                                      16.0,
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
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Manrope',
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
                                                          .additionalWeighTxtValTextControllerValidator
                                                          .asValidator(context),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 11.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      _model.weightUnitBtnValue ==
                                                              'kg'
                                                          ? 'kg'
                                                          : 'lb',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Manrope',
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
                                                  'FUNCTIONAL_EXERCISE_Container_mlsz5lyf_O');
                                              logFirebaseEvent(
                                                  'Container_set_form_field');
                                              safeSetState(() {
                                                _model
                                                    .additionalWeighTxtValTextController
                                                    ?.text = ((double
                                                                additionalweight,
                                                            String weightunit) {
                                                  return (weightunit == 'kg')
                                                      ? additionalweight + 2.5
                                                      : additionalweight + 10;
                                                }(
                                                        double.parse(_model
                                                            .additionalWeighTxtValTextController
                                                            .text),
                                                        _model.weightUnit))
                                                    .toString();
                                                _model
                                                    .additionalWeighTxtValFocusNode
                                                    ?.requestFocus();
                                                WidgetsBinding.instance
                                                    .addPostFrameCallback((_) {
                                                  _model.additionalWeighTxtValTextController
                                                          ?.selection =
                                                      TextSelection.collapsed(
                                                    offset: _model
                                                        .additionalWeighTxtValTextController!
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
                                          30.0, 30.0, 30.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
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
                                        ],
                                      ),
                                    ),
                                    Row(
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
                                                'FUNCTIONAL_EXERCISE_Container_uehz7c24_O');
                                            logFirebaseEvent(
                                                'Container_set_form_field');
                                            safeSetState(() {
                                              _model
                                                  .reptitionsTxtValTextController
                                                  ?.text = (int.parse(_model
                                                          .reptitionsTxtValTextController
                                                          .text) +
                                                      1)
                                                  .toString();
                                              _model.reptitionsTxtValFocusNode
                                                  ?.requestFocus();
                                              WidgetsBinding.instance
                                                  .addPostFrameCallback((_) {
                                                _model.reptitionsTxtValTextController
                                                        ?.selection =
                                                    TextSelection.collapsed(
                                                  offset: _model
                                                      .reptitionsTxtValTextController!
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
                                            child: const Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Icon(
                                                Icons.add,
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
                                                'FUNCTIONAL_EXERCISE_Container_uzcmbg2w_O');
                                            logFirebaseEvent(
                                                'Container_set_form_field');
                                            safeSetState(() {
                                              _model.setTxtValTextController
                                                  ?.text = (valueOrDefault<int>(
                                                        int.tryParse(_model
                                                            .setTxtValTextController
                                                            .text),
                                                        1,
                                                      ) +
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
                                            child: const Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Icon(
                                                Icons.add,
                                                color: Color(0xFF40B1BF),
                                                size: 24.0,
                                              ),
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
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.06,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                            ),
                                          ),
                                          child: Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, 0.0),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 0.0, 8.0, 0.0),
                                              child: TextFormField(
                                                controller: _model
                                                    .reptitionsTxtValTextController,
                                                focusNode: _model
                                                    .reptitionsTxtValFocusNode,
                                                autofocus: false,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  labelStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'Manrope',
                                                        letterSpacing: 0.0,
                                                      ),
                                                  hintStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'Manrope',
                                                        letterSpacing: 0.0,
                                                      ),
                                                  enabledBorder:
                                                      InputBorder.none,
                                                  focusedBorder:
                                                      InputBorder.none,
                                                  errorBorder: InputBorder.none,
                                                  focusedErrorBorder:
                                                      InputBorder.none,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
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
                                                keyboardType:
                                                    TextInputType.number,
                                                validator: _model
                                                    .reptitionsTxtValTextControllerValidator
                                                    .asValidator(context),
                                              ),
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
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.06,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                            ),
                                          ),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 8.0, 0.0),
                                            child: TextFormField(
                                              controller: _model
                                                  .setTxtValTextController,
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
                                              style:
                                                  FlutterFlowTheme.of(context)
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
                                              keyboardType:
                                                  TextInputType.number,
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
                                                  'FUNCTIONAL_EXERCISE_Container_7lr83shl_O');
                                              logFirebaseEvent(
                                                  'Container_set_form_field');
                                              safeSetState(() {
                                                _model
                                                    .reptitionsTxtValTextController
                                                    ?.text = ((int repetition) {
                                                  return (repetition <= 1)
                                                      ? 1
                                                      : repetition - 1;
                                                }(int.parse(_model
                                                        .reptitionsTxtValTextController
                                                        .text)))
                                                    .toString();
                                                _model.reptitionsTxtValFocusNode
                                                    ?.requestFocus();
                                                WidgetsBinding.instance
                                                    .addPostFrameCallback((_) {
                                                  _model.reptitionsTxtValTextController
                                                          ?.selection =
                                                      TextSelection.collapsed(
                                                    offset: _model
                                                        .reptitionsTxtValTextController!
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
                                                  'FUNCTIONAL_EXERCISE_Container_o8umfs3g_O');
                                              logFirebaseEvent(
                                                  'Container_set_form_field');
                                              safeSetState(() {
                                                _model.setTxtValTextController
                                                    ?.text = ((int setcount) {
                                                  return (setcount <= 1)
                                                      ? 1
                                                      : setcount - 1;
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
                                    Builder(
                                      builder: (context) {
                                        if (widget.oldExerciseScore?.id !=
                                                null &&
                                            widget.oldExerciseScore?.id !=
                                                '') {
                                          return FFButtonWidget(
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'FUNCTIONAL_EXERCISE_UpdateButton_ON_TAP');
                                              // Get user data
                                              logFirebaseEvent(
                                                  'UpdateButton_Getuserdata');
                                              _model.updateUserDataResponse =
                                                  await UsersDataRecord
                                                      .getDocumentOnce(FFAppState()
                                                          .userDataReference!);
                                              logFirebaseEvent(
                                                  'UpdateButton_custom_action');
                                              _model.updateActionCalculateFunctionalScoreResponse =
                                                  await actions
                                                      .actionCalculateFunctionalScore(
                                                _model.updateUserDataResponse!
                                                    .weight,
                                                double.parse(_model
                                                    .additionalWeighTxtValTextController
                                                    .text),
                                                int.parse(_model
                                                    .reptitionsTxtValTextController
                                                    .text),
                                                FFAppConstants.rpe,
                                                functionalExerciseExercisesRecord
                                                    .difficultyMultiplier,
                                                functionalExerciseExercisesRecord,
                                                FFAppState()
                                                    .musclesData
                                                    .toList(),
                                                valueOrDefault<int>(
                                                  int.tryParse(_model
                                                      .setTxtValTextController
                                                      .text),
                                                  1,
                                                ),
                                                _model.weightUnitBtnValue!,
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
                                                        .convertStringToDouble(
                                                            _model
                                                                .updateUserDataResponse
                                                                ?.height
                                                                .value))!,
                                              );
                                              if (_model
                                                      .updateActionCalculateFunctionalScoreResponse
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
                                                        .updateActionCalculateFunctionalScoreResponse
                                                        ?.totalScore,
                                                    formData:
                                                        updateExerciseFormDataStruct(
                                                      _model
                                                          .updateActionCalculateFunctionalScoreResponse
                                                          ?.formData,
                                                      clearUnsetFields: false,
                                                    ),
                                                  ),
                                                  ...mapToFirestore(
                                                    {
                                                      'muscles':
                                                          getMusclesListFirestoreData(
                                                        _model
                                                            .updateActionCalculateFunctionalScoreResponse
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
                                                      .updateActionCalculateFunctionalScoreResponse!
                                                      .muscles
                                                      .toList(),
                                                  _model
                                                      .oldExerciseScoreResponse!
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
                                                      _model
                                                          .selectedExerciseDate,
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
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 0.0, 24.0, 0.0),
                                              iconPadding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
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
                                                  'FUNCTIONAL_EXERCISE_PAGE_ADD_BTN_ON_TAP');
                                              // Get user data
                                              logFirebaseEvent(
                                                  'Button_Getuserdata');
                                              _model.userDataResponse =
                                                  await UsersDataRecord
                                                      .getDocumentOnce(FFAppState()
                                                          .userDataReference!);
                                              logFirebaseEvent(
                                                  'Button_custom_action');
                                              _model.actionCalculateFunctionalScoreResponse =
                                                  await actions
                                                      .actionCalculateFunctionalScore(
                                                _model.userDataResponse!.weight,
                                                double.parse(_model
                                                    .additionalWeighTxtValTextController
                                                    .text),
                                                int.parse(_model
                                                    .reptitionsTxtValTextController
                                                    .text),
                                                FFAppConstants.rpe,
                                                functionalExerciseExercisesRecord
                                                    .difficultyMultiplier,
                                                functionalExerciseExercisesRecord,
                                                FFAppState()
                                                    .musclesData
                                                    .toList(),
                                                valueOrDefault<int>(
                                                  int.tryParse(_model
                                                      .setTxtValTextController
                                                      .text),
                                                  1,
                                                ),
                                                _model.weightUnitBtnValue!,
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
                                              );
                                              if (_model
                                                      .actionCalculateFunctionalScoreResponse
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
                                                  parent: _model
                                                      .userDataResponse
                                                      ?.reference,
                                                  queryBuilder:
                                                      (dayScoresDataRecord) =>
                                                          dayScoresDataRecord
                                                              .where(
                                                    'date',
                                                    isEqualTo: functions
                                                        .convertDateTimeToDate(
                                                            _model
                                                                .selectedExerciseDate!),
                                                  ),
                                                  singleRecord: true,
                                                ).then((s) => s.firstOrNull);
                                                if (_model
                                                        .getDayScoreResponse !=
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
                                                                  .actionCalculateFunctionalScoreResponse!
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
                                                                  .actionCalculateFunctionalScoreResponse!
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
                                                      totalScore: _model
                                                          .actionCalculateFunctionalScoreResponse
                                                          ?.totalScore,
                                                    ),
                                                    ...mapToFirestore(
                                                      {
                                                        'musclesScore':
                                                            getMusclesListFirestoreData(
                                                          _model
                                                              .actionCalculateFunctionalScoreResponse
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
                                                      totalScore: _model
                                                          .actionCalculateFunctionalScoreResponse
                                                          ?.totalScore,
                                                    ),
                                                    ...mapToFirestore(
                                                      {
                                                        'musclesScore':
                                                            getMusclesListFirestoreData(
                                                          _model
                                                              .actionCalculateFunctionalScoreResponse
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
                                                        .convertDateTimeToDate(
                                                            _model
                                                                .selectedExerciseDate!),
                                                    name: _model
                                                        .actionCalculateFunctionalScoreResponse
                                                        ?.name,
                                                    totalScore: _model
                                                        .actionCalculateFunctionalScoreResponse
                                                        ?.totalScore,
                                                    formData:
                                                        updateExerciseFormDataStruct(
                                                      _model
                                                          .actionCalculateFunctionalScoreResponse
                                                          ?.formData,
                                                      clearUnsetFields: false,
                                                      create: true,
                                                    ),
                                                    exercisesReference:
                                                        widget.exercise,
                                                    imageUrl:
                                                        functionalExerciseExercisesRecord
                                                            .imageUrl,
                                                    workoutType:
                                                        functionalExerciseExercisesRecord
                                                            .workoutType.name,
                                                    timeStamp:
                                                        getCurrentTimestamp,
                                                  ),
                                                  ...mapToFirestore(
                                                    {
                                                      'muscles':
                                                          getMusclesListFirestoreData(
                                                        _model
                                                            .actionCalculateFunctionalScoreResponse
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
                                                        .convertDateTimeToDate(
                                                            _model
                                                                .selectedExerciseDate!),
                                                    name: _model
                                                        .actionCalculateFunctionalScoreResponse
                                                        ?.name,
                                                    totalScore: _model
                                                        .actionCalculateFunctionalScoreResponse
                                                        ?.totalScore,
                                                    formData:
                                                        updateExerciseFormDataStruct(
                                                      _model
                                                          .actionCalculateFunctionalScoreResponse
                                                          ?.formData,
                                                      clearUnsetFields: false,
                                                      create: true,
                                                    ),
                                                    exercisesReference:
                                                        widget.exercise,
                                                    imageUrl:
                                                        functionalExerciseExercisesRecord
                                                            .imageUrl,
                                                    workoutType:
                                                        functionalExerciseExercisesRecord
                                                            .workoutType.name,
                                                    timeStamp:
                                                        getCurrentTimestamp,
                                                  ),
                                                  ...mapToFirestore(
                                                    {
                                                      'muscles':
                                                          getMusclesListFirestoreData(
                                                        _model
                                                            .actionCalculateFunctionalScoreResponse
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
                                                      _model
                                                          .selectedExerciseDate,
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
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 0.0, 24.0, 0.0),
                                              iconPadding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
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
