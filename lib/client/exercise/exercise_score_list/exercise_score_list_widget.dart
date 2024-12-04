import '/backend/backend.dart';
import '/client/add_or_modify/add_or_modify_widget.dart';
import '/client/scores_calculation_bottom_sheet/scores_calculation_bottom_sheet_widget.dart';
import '/components/empty_score_list_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'exercise_score_list_model.dart';
export 'exercise_score_list_model.dart';

class ExerciseScoreListWidget extends StatefulWidget {
  const ExerciseScoreListWidget({
    super.key,
    required this.exerciseDate,
    this.clientName,
  });

  final DateTime? exerciseDate;
  final String? clientName;

  @override
  State<ExerciseScoreListWidget> createState() =>
      _ExerciseScoreListWidgetState();
}

class _ExerciseScoreListWidgetState extends State<ExerciseScoreListWidget> {
  late ExerciseScoreListModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ExerciseScoreListModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'ExerciseScoreList'});
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<DayScoresDataRecord>>(
      stream: queryDayScoresDataRecord(
        parent: FFAppState().userDataReference,
        queryBuilder: (dayScoresDataRecord) => dayScoresDataRecord.where(
          'date',
          isEqualTo: functions.convertDateTimeToDate(widget.exerciseDate!),
        ),
        singleRecord: true,
      ),
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
        List<DayScoresDataRecord> exerciseScoreListDayScoresDataRecordList =
            snapshot.data!;
        final exerciseScoreListDayScoresDataRecord =
            exerciseScoreListDayScoresDataRecordList.isNotEmpty
                ? exerciseScoreListDayScoresDataRecordList.first
                : null;

        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
              automaticallyImplyLeading: false,
              title: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 20.0,
                          borderWidth: 1.0,
                          buttonSize: 40.0,
                          icon: const Icon(
                            Icons.keyboard_backspace,
                            color: Color(0xFF40B1BF),
                            size: 24.0,
                          ),
                          onPressed: () async {
                            logFirebaseEvent(
                                'EXERCISE_SCORE_LIST_keyboard_backspace_I');
                            logFirebaseEvent('IconButton_navigate_back');
                            context.safePop();
                          },
                        ),
                        if (FFAppState().userType == 'trainer')
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                5.0, 0.0, 0.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: const AlignmentDirectional(-1.0, 0.0),
                                  child: StreamBuilder<UsersDataRecord>(
                                    stream: UsersDataRecord.getDocument(
                                        FFAppState().userDataReference!),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }

                                      final textUsersDataRecord =
                                          snapshot.data!;

                                      return Text(
                                        textUsersDataRecord.displayName,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Manrope',
                                              fontSize: 18.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      );
                                    },
                                  ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(-1.0, 0.0),
                                  child: Text(
                                    'Workout Score',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Manrope',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(1.0, 0.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF151515),
                        borderRadius: BorderRadius.circular(40.0),
                        shape: BoxShape.rectangle,
                      ),
                      alignment: const AlignmentDirectional(1.0, 0.0),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            12.0, 8.0, 12.0, 8.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                'assets/images/Vector.png',
                                width: 12.0,
                                height: 22.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Text(
                                valueOrDefault<String>(
                                  formatNumber(
                                    exerciseScoreListDayScoresDataRecord
                                        ?.totalScore,
                                    formatType: FormatType.decimal,
                                    decimalType: DecimalType.automatic,
                                  ),
                                  '0',
                                ),
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: const Color(0xFF6DCBD7),
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                          ].divide(const SizedBox(width: 4.0)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              actions: const [],
              centerTitle: false,
              elevation: 2.0,
            ),
            body: SafeArea(
              top: true,
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                child: SingleChildScrollView(
                  primary: false,
                  controller: _model.columnController1,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 20.0, 0.0),
                        child: SingleChildScrollView(
                          primary: false,
                          controller: _model.columnController2,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
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
                                          'EXERCISE_SCORE_LIST_Icon_fdzlpk5s_ON_TAP');
                                      logFirebaseEvent('Icon_navigate_to');

                                      context.goNamed(
                                        'ExerciseScoreList',
                                        queryParameters: {
                                          'exerciseDate': serializeParam(
                                            functions.getPastDate(
                                                widget.exerciseDate!, 1),
                                            ParamType.DateTime,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                                    child: const Icon(
                                      Icons.chevron_left,
                                      color: Color(0xFF40B1BF),
                                      size: 24.0,
                                    ),
                                  ),
                                  Text(
                                    dateTimeFormat(
                                      "MMMMEEEEd",
                                      widget.exerciseDate,
                                      locale: FFLocalizations.of(context)
                                          .languageCode,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Manrope',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                  Builder(
                                    builder: (context) {
                                      if (dateTimeFormat(
                                            "d/M/y",
                                            getCurrentTimestamp,
                                            locale: FFLocalizations.of(context)
                                                .languageCode,
                                          ) ==
                                          dateTimeFormat(
                                            "d/M/y",
                                            widget.exerciseDate,
                                            locale: FFLocalizations.of(context)
                                                .languageCode,
                                          )) {
                                        return Visibility(
                                          visible: dateTimeFormat(
                                                "d/M/y",
                                                getCurrentTimestamp,
                                                locale:
                                                    FFLocalizations.of(context)
                                                        .languageCode,
                                              ) !=
                                              dateTimeFormat(
                                                "d/M/y",
                                                widget.exerciseDate,
                                                locale:
                                                    FFLocalizations.of(context)
                                                        .languageCode,
                                              ),
                                          child: const Icon(
                                            Icons.chevron_right,
                                            color: Color(0xFF40B1BF),
                                            size: 24.0,
                                          ),
                                        );
                                      } else {
                                        return Visibility(
                                          visible: dateTimeFormat(
                                                "d/M/y",
                                                getCurrentTimestamp,
                                                locale:
                                                    FFLocalizations.of(context)
                                                        .languageCode,
                                              ) !=
                                              dateTimeFormat(
                                                "d/M/y",
                                                widget.exerciseDate,
                                                locale:
                                                    FFLocalizations.of(context)
                                                        .languageCode,
                                              ),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'EXERCISE_SCORE_LIST_Icon_x2eeolr7_ON_TAP');
                                              logFirebaseEvent(
                                                  'Icon_navigate_to');

                                              context.goNamed(
                                                'ExerciseScoreList',
                                                queryParameters: {
                                                  'exerciseDate':
                                                      serializeParam(
                                                    functions.getFutureDate(
                                                        widget.exerciseDate!,
                                                        1),
                                                    ParamType.DateTime,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            },
                                            child: const Icon(
                                              Icons.chevron_right,
                                              color: Color(0xFF40B1BF),
                                              size: 24.0,
                                            ),
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        valueOrDefault<String>(
                                          formatNumber(
                                            exerciseScoreListDayScoresDataRecord
                                                ?.totalScore,
                                            formatType: FormatType.decimal,
                                            decimalType: DecimalType.automatic,
                                          ),
                                          '0',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Manrope',
                                              fontSize: 20.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(1.0, -1.0),
                                        child: Text(
                                          'Score',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Manrope',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                                decoration:
                                                    TextDecoration.underline,
                                              ),
                                        ),
                                      ),
                                    ].divide(const SizedBox(height: 6.0)),
                                  ),
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'EXERCISE_SCORE_LIST_Column_csqu9qjb_ON_T');
                                      logFirebaseEvent('Column_navigate_to');

                                      context.goNamed(
                                        'AbdomentScoreBreakdown',
                                        queryParameters: {
                                          'exerciseDate': serializeParam(
                                            widget.exerciseDate,
                                            ParamType.DateTime,
                                          ),
                                        }.withoutNulls,
                                      );
                                    },
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 32.0,
                                          height: 32.0,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: const Color(0xFF9E9A9A),
                                            ),
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.asset(
                                              'assets/images/arm-flex.png',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          'Breakdown',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Manrope',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ].divide(const SizedBox(height: 6.0)),
                                    ),
                                  ),
                                ].divide(const SizedBox(width: 40.0)),
                              ),
                              SingleChildScrollView(
                                primary: false,
                                controller: _model.columnController3,
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    StreamBuilder<
                                        List<ExerciseScoresDataRecord>>(
                                      stream: queryExerciseScoresDataRecord(
                                        parent: FFAppState().userDataReference,
                                        queryBuilder:
                                            (exerciseScoresDataRecord) =>
                                                exerciseScoresDataRecord
                                                    .where(
                                                      'date',
                                                      isEqualTo: functions
                                                          .convertDateTimeToDate(
                                                              widget
                                                                  .exerciseDate!),
                                                    )
                                                    .orderBy('timeStamp',
                                                        descending: true),
                                      ),
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
                                        List<ExerciseScoresDataRecord>
                                            listViewExerciseScoresDataRecordList =
                                            snapshot.data!;
                                        if (listViewExerciseScoresDataRecordList
                                            .isEmpty) {
                                          return const EmptyScoreListWidget();
                                        }

                                        return ListView.builder(
                                          padding: EdgeInsets.zero,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount:
                                              listViewExerciseScoresDataRecordList
                                                  .length,
                                          itemBuilder:
                                              (context, listViewIndex) {
                                            final listViewExerciseScoresDataRecord =
                                                listViewExerciseScoresDataRecordList[
                                                    listViewIndex];
                                            return Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 5.0, 0.0, 5.0),
                                              child: Container(
                                                height: 60.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(10.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Expanded(
                                                        flex: 1,
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child: Image.network(
                                                            functions.getImageUrl(
                                                                functions.generateCodeFromName(
                                                                    listViewExerciseScoresDataRecord
                                                                        .name),
                                                                FFAppState()
                                                                    .imageUrl
                                                                    .baseUrl,
                                                                FFAppState()
                                                                    .imageUrl
                                                                    .path,
                                                                FFAppState()
                                                                    .imageUrl
                                                                    .suffix),
                                                            width: 40.0,
                                                            height: 40.0,
                                                            fit: BoxFit.contain,
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 2,
                                                        child: AutoSizeText(
                                                          listViewExerciseScoresDataRecord
                                                              .name,
                                                          maxLines: 2,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Manrope',
                                                                fontSize: 16.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 2,
                                                        child: Text(
                                                          formatNumber(
                                                            listViewExerciseScoresDataRecord
                                                                .totalScore,
                                                            formatType:
                                                                FormatType
                                                                    .decimal,
                                                            decimalType:
                                                                DecimalType
                                                                    .automatic,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Manrope',
                                                                fontSize: 20.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                        ),
                                                      ),
                                                      FlutterFlowIconButton(
                                                        borderColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryBackground,
                                                        borderRadius: 20.0,
                                                        borderWidth: 1.0,
                                                        buttonSize: 40.0,
                                                        fillColor: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        icon: Icon(
                                                          Icons.add,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .iconColor,
                                                          size: 24.0,
                                                        ),
                                                        onPressed: () async {
                                                          logFirebaseEvent(
                                                              'EXERCISE_SCORE_LIST_PAGE_add_ICN_ON_TAP');
                                                          if (listViewExerciseScoresDataRecord
                                                                  .workoutType ==
                                                              'functional') {
                                                            logFirebaseEvent(
                                                                'IconButton_navigate_to');

                                                            context.pushNamed(
                                                              'FunctionalExercise',
                                                              queryParameters: {
                                                                'exerciseDate':
                                                                    serializeParam(
                                                                  listViewExerciseScoresDataRecord
                                                                      .date,
                                                                  ParamType
                                                                      .DateTime,
                                                                ),
                                                                'exercise':
                                                                    serializeParam(
                                                                  listViewExerciseScoresDataRecord
                                                                      .exercisesReference,
                                                                  ParamType
                                                                      .DocumentReference,
                                                                ),
                                                                'additionalWeight':
                                                                    serializeParam(
                                                                  listViewExerciseScoresDataRecord
                                                                      .formData
                                                                      .additionalWeight,
                                                                  ParamType
                                                                      .double,
                                                                ),
                                                                'repetitions':
                                                                    serializeParam(
                                                                  listViewExerciseScoresDataRecord
                                                                      .formData
                                                                      .repetitions,
                                                                  ParamType.int,
                                                                ),
                                                                'sets':
                                                                    serializeParam(
                                                                  listViewExerciseScoresDataRecord
                                                                      .formData
                                                                      .setCount,
                                                                  ParamType.int,
                                                                ),
                                                                'weightUnit':
                                                                    serializeParam(
                                                                  listViewExerciseScoresDataRecord
                                                                      .formData
                                                                      .weightUnit,
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                              }.withoutNulls,
                                                            );
                                                          } else if (listViewExerciseScoresDataRecord
                                                                  .workoutType ==
                                                              'weights') {
                                                            logFirebaseEvent(
                                                                'IconButton_navigate_to');

                                                            context.pushNamed(
                                                              'WeightExercise',
                                                              queryParameters: {
                                                                'exerciseDate':
                                                                    serializeParam(
                                                                  listViewExerciseScoresDataRecord
                                                                      .date,
                                                                  ParamType
                                                                      .DateTime,
                                                                ),
                                                                'exercise':
                                                                    serializeParam(
                                                                  listViewExerciseScoresDataRecord
                                                                      .exercisesReference,
                                                                  ParamType
                                                                      .DocumentReference,
                                                                ),
                                                                'weightLifted':
                                                                    serializeParam(
                                                                  listViewExerciseScoresDataRecord
                                                                      .formData
                                                                      .weightLifted,
                                                                  ParamType
                                                                      .double,
                                                                ),
                                                                'repetitions':
                                                                    serializeParam(
                                                                  listViewExerciseScoresDataRecord
                                                                      .formData
                                                                      .repetitions,
                                                                  ParamType.int,
                                                                ),
                                                                'sets':
                                                                    serializeParam(
                                                                  listViewExerciseScoresDataRecord
                                                                      .formData
                                                                      .setCount,
                                                                  ParamType.int,
                                                                ),
                                                                'weightUnit':
                                                                    serializeParam(
                                                                  listViewExerciseScoresDataRecord
                                                                      .formData
                                                                      .weightUnit,
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                              }.withoutNulls,
                                                            );
                                                          } else if (listViewExerciseScoresDataRecord
                                                                  .workoutType ==
                                                              'plank') {
                                                            logFirebaseEvent(
                                                                'IconButton_navigate_to');

                                                            context.pushNamed(
                                                              'PlankExercise',
                                                              queryParameters: {
                                                                'exerciseDate':
                                                                    serializeParam(
                                                                  listViewExerciseScoresDataRecord
                                                                      .date,
                                                                  ParamType
                                                                      .DateTime,
                                                                ),
                                                                'exercise':
                                                                    serializeParam(
                                                                  listViewExerciseScoresDataRecord
                                                                      .exercisesReference,
                                                                  ParamType
                                                                      .DocumentReference,
                                                                ),
                                                                'additionalWeight':
                                                                    serializeParam(
                                                                  listViewExerciseScoresDataRecord
                                                                      .formData
                                                                      .additionalWeight,
                                                                  ParamType
                                                                      .double,
                                                                ),
                                                                'durations':
                                                                    serializeParam(
                                                                  listViewExerciseScoresDataRecord
                                                                      .formData
                                                                      .timeDuration,
                                                                  ParamType.int,
                                                                ),
                                                                'sets':
                                                                    serializeParam(
                                                                  listViewExerciseScoresDataRecord
                                                                      .formData
                                                                      .setCount,
                                                                  ParamType.int,
                                                                ),
                                                                'weightUnit':
                                                                    serializeParam(
                                                                  listViewExerciseScoresDataRecord
                                                                      .formData
                                                                      .weightUnit,
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                              }.withoutNulls,
                                                            );
                                                          } else if ((listViewExerciseScoresDataRecord
                                                                      .workoutType ==
                                                                  'kettlebell-functional') ||
                                                              (listViewExerciseScoresDataRecord
                                                                      .workoutType ==
                                                                  'medicine-ball-functional')) {
                                                            logFirebaseEvent(
                                                                'IconButton_navigate_to');

                                                            context.pushNamed(
                                                              'kettlebellMedicineBall',
                                                              queryParameters: {
                                                                'exerciseDate':
                                                                    serializeParam(
                                                                  listViewExerciseScoresDataRecord
                                                                      .date,
                                                                  ParamType
                                                                      .DateTime,
                                                                ),
                                                                'exercise':
                                                                    serializeParam(
                                                                  listViewExerciseScoresDataRecord
                                                                      .exercisesReference,
                                                                  ParamType
                                                                      .DocumentReference,
                                                                ),
                                                                'weightLifted':
                                                                    serializeParam(
                                                                  listViewExerciseScoresDataRecord
                                                                      .formData
                                                                      .weightLifted,
                                                                  ParamType
                                                                      .double,
                                                                ),
                                                                'repetitions':
                                                                    serializeParam(
                                                                  listViewExerciseScoresDataRecord
                                                                      .formData
                                                                      .repetitions,
                                                                  ParamType.int,
                                                                ),
                                                                'sets':
                                                                    serializeParam(
                                                                  listViewExerciseScoresDataRecord
                                                                      .formData
                                                                      .setCount,
                                                                  ParamType.int,
                                                                ),
                                                                'weightUnit':
                                                                    serializeParam(
                                                                  listViewExerciseScoresDataRecord
                                                                      .formData
                                                                      .weightUnit,
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                              }.withoutNulls,
                                                            );
                                                          } else if (listViewExerciseScoresDataRecord
                                                                  .workoutType ==
                                                              'strongman-exercises') {
                                                            logFirebaseEvent(
                                                                'IconButton_navigate_to');

                                                            context.pushNamed(
                                                              'StrongmanExercise',
                                                              queryParameters: {
                                                                'exerciseDate':
                                                                    serializeParam(
                                                                  listViewExerciseScoresDataRecord
                                                                      .date,
                                                                  ParamType
                                                                      .DateTime,
                                                                ),
                                                                'exercise':
                                                                    serializeParam(
                                                                  listViewExerciseScoresDataRecord
                                                                      .exercisesReference,
                                                                  ParamType
                                                                      .DocumentReference,
                                                                ),
                                                                'additionalWeight':
                                                                    serializeParam(
                                                                  listViewExerciseScoresDataRecord
                                                                      .formData
                                                                      .additionalWeight,
                                                                  ParamType
                                                                      .double,
                                                                ),
                                                                'distanceCovered':
                                                                    serializeParam(
                                                                  listViewExerciseScoresDataRecord
                                                                      .formData
                                                                      .distanceCovered,
                                                                  ParamType.int,
                                                                ),
                                                                'sets':
                                                                    serializeParam(
                                                                  listViewExerciseScoresDataRecord
                                                                      .formData
                                                                      .setCount,
                                                                  ParamType.int,
                                                                ),
                                                                'weightUnit':
                                                                    serializeParam(
                                                                  listViewExerciseScoresDataRecord
                                                                      .formData
                                                                      .weightUnit,
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                              }.withoutNulls,
                                                            );
                                                          } else {
                                                            logFirebaseEvent(
                                                                'IconButton_show_snack_bar');
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  'Error 1',
                                                                  style:
                                                                      TextStyle(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                  ),
                                                                ),
                                                                duration: const Duration(
                                                                    milliseconds:
                                                                        4000),
                                                                backgroundColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondary,
                                                              ),
                                                            );
                                                          }
                                                        },
                                                      ),
                                                      Align(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                1.0, 0.0),
                                                        child: Builder(
                                                          builder: (context) =>
                                                              FlutterFlowIconButton(
                                                            borderColor: Colors
                                                                .transparent,
                                                            borderRadius: 30.0,
                                                            buttonSize: 40.0,
                                                            icon: Icon(
                                                              Icons.more_vert,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .iconColor,
                                                              size: 20.0,
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              logFirebaseEvent(
                                                                  'EXERCISE_SCORE_LIST_more_vert_ICN_ON_TAP');
                                                              logFirebaseEvent(
                                                                  'IconButton_alert_dialog');
                                                              await showDialog(
                                                                barrierDismissible:
                                                                    false,
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (dialogContext) {
                                                                  return Dialog(
                                                                    elevation:
                                                                        0,
                                                                    insetPadding:
                                                                        EdgeInsets
                                                                            .zero,
                                                                    backgroundColor:
                                                                        Colors
                                                                            .transparent,
                                                                    alignment: const AlignmentDirectional(
                                                                            0.0,
                                                                            0.0)
                                                                        .resolve(
                                                                            Directionality.of(context)),
                                                                    child:
                                                                        GestureDetector(
                                                                      onTap: () =>
                                                                          FocusScope.of(dialogContext)
                                                                              .unfocus(),
                                                                      child:
                                                                          SizedBox(
                                                                        height:
                                                                            200.0,
                                                                        width:
                                                                            300.0,
                                                                        child:
                                                                            AddOrModifyWidget(
                                                                          exerciseScoresData:
                                                                              listViewExerciseScoresDataRecord,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        const SizedBox(width: 5.0)),
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                          controller: _model.listViewController,
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(1.0, 0.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'EXERCISE_SCORE_LIST_ADD_ANOTHER_SET_BTN_');
                                    logFirebaseEvent('Button_navigate_to');

                                    context.pushNamed(
                                      'SearchExercise',
                                      queryParameters: {
                                        'selectedDate': serializeParam(
                                          widget.exerciseDate,
                                          ParamType.DateTime,
                                        ),
                                      }.withoutNulls,
                                    );
                                  },
                                  text: 'Add Another Set',
                                  icon: const Icon(
                                    Icons.add,
                                    size: 15.0,
                                  ),
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
                              Align(
                                alignment: const AlignmentDirectional(-1.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'EXERCISE_SCORE_LIST_Text_elwr9ful_ON_TAP');
                                    logFirebaseEvent('Text_bottom_sheet');
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      useSafeArea: true,
                                      context: context,
                                      builder: (context) {
                                        return GestureDetector(
                                          onTap: () =>
                                              FocusScope.of(context).unfocus(),
                                          child: Padding(
                                            padding: MediaQuery.viewInsetsOf(
                                                context),
                                            child: const SizedBox(
                                              height: 500.0,
                                              child:
                                                  ScoresCalculationBottomSheetWidget(),
                                            ),
                                          ),
                                        );
                                      },
                                    ).then((value) => safeSetState(() {}));
                                  },
                                  child: Text(
                                    'See how the scores are calculated',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Manrope',
                                          color: const Color(0xFF0098AD),
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                              ),
                            ].divide(const SizedBox(height: 20.0)),
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
      },
    );
  }
}
