import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/empty_client_list_widget.dart';
import '/components/loading_component_widget.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'week_history_model.dart';
export 'week_history_model.dart';

class WeekHistoryWidget extends StatefulWidget {
  const WeekHistoryWidget({
    super.key,
    required this.weekStartDate,
    this.clientName,
  });

  final DateTime? weekStartDate;
  final String? clientName;

  @override
  State<WeekHistoryWidget> createState() => _WeekHistoryWidgetState();
}

class _WeekHistoryWidgetState extends State<WeekHistoryWidget> {
  late WeekHistoryModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WeekHistoryModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'WeekHistory'});
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
        queryBuilder: (dayScoresDataRecord) => dayScoresDataRecord
            .where(
              'date',
              isLessThanOrEqualTo: functions.getCurrentWeekStartEndDate()?.end,
            )
            .where(
              'date',
              isGreaterThanOrEqualTo:
                  functions.getCurrentWeekStartEndDate()?.start,
            )
            .orderBy('date', descending: true),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
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
        List<DayScoresDataRecord> weekHistoryDayScoresDataRecordList =
            snapshot.data!;

        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            floatingActionButton: FloatingActionButton.extended(
              onPressed: () async {
                logFirebaseEvent('WEEK_HISTORY_FloatingActionButton_7nvbnk');
                logFirebaseEvent('FloatingActionButton_navigate_to');

                context.pushNamed('SearchExercise');
              },
              backgroundColor: const Color(0xFF4CB256),
              label: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Icon(
                    Icons.add,
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    size: 20.0,
                  ),
                  Text(
                    'Add Set',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Manrope',
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ],
              ),
            ),
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
                                'WEEK_HISTORY_keyboard_backspace_ICN_ON_T');
                            logFirebaseEvent('IconButton_navigate_to');

                            context.pushNamed('Dashboard');
                          },
                        ),
                        if (FFAppState().userType == 'trainer')
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Align(
                                alignment: const AlignmentDirectional(-1.0, 0.0),
                                child: Text(
                                  valueOrDefault<String>(
                                    widget.clientName,
                                    'test',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Manrope',
                                        fontSize: 18.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
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
                      ],
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(1.0, 0.0),
                    child: StreamBuilder<List<DayScoresDataRecord>>(
                      stream: queryDayScoresDataRecord(
                        parent: FFAppState().userDataReference,
                        queryBuilder: (dayScoresDataRecord) =>
                            dayScoresDataRecord.where(
                          'date',
                          isEqualTo: functions.getTodaysDate(),
                        ),
                        singleRecord: true,
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            ),
                          );
                        }
                        List<DayScoresDataRecord>
                            containerDayScoresDataRecordList = snapshot.data!;
                        // Return an empty Container when the item does not exist.
                        if (snapshot.data!.isEmpty) {
                          return Container();
                        }
                        final containerDayScoresDataRecord =
                            containerDayScoresDataRecordList.isNotEmpty
                                ? containerDayScoresDataRecordList.first
                                : null;

                        return Container(
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
                                    formatNumber(
                                      containerDayScoresDataRecord!.totalScore,
                                      formatType: FormatType.decimal,
                                      decimalType: DecimalType.periodDecimal,
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
                        );
                      },
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
              child: SingleChildScrollView(
                primary: false,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    if (FFAppState().userType == 'trainer')
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          height: 84.0,
                          constraints: const BoxConstraints(
                            minHeight: 84.0,
                          ),
                          decoration: const BoxDecoration(),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                10.0, 10.0, 10.0, 0.0),
                            child: AuthUserStreamWidget(
                              builder: (context) =>
                                  StreamBuilder<List<GoersDataRecord>>(
                                stream: queryGoersDataRecord(
                                  parent:
                                      currentUserDocument?.userDataReference,
                                  queryBuilder: (goersDataRecord) =>
                                      goersDataRecord.orderBy('updated_at',
                                          descending: true),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return const SizedBox(
                                      width: double.infinity,
                                      height: 40.0,
                                      child: LoadingComponentWidget(),
                                    );
                                  }
                                  List<GoersDataRecord>
                                      listViewGoersDataRecordList =
                                      snapshot.data!;
                                  if (listViewGoersDataRecordList.isEmpty) {
                                    return const EmptyClientListWidget();
                                  }

                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    primary: false,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount:
                                        listViewGoersDataRecordList.length,
                                    itemBuilder: (context, listViewIndex) {
                                      final listViewGoersDataRecord =
                                          listViewGoersDataRecordList[
                                              listViewIndex];
                                      return Align(
                                        alignment:
                                            const AlignmentDirectional(-1.0, 0.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'WEEK_HISTORY_Container_6mu6tktj_ON_TAP');
                                            // Update user data ref app state
                                            logFirebaseEvent(
                                                'Container_Updateuserdatarefappstate');
                                            FFAppState().userDataReference =
                                                listViewGoersDataRecord
                                                    .userDataReference;
                                            safeSetState(() {});
                                            logFirebaseEvent(
                                                'Container_backend_call');

                                            await listViewGoersDataRecord
                                                .reference
                                                .update(
                                                    createGoersDataRecordData(
                                              updatedAt: getCurrentTimestamp,
                                            ));
                                            logFirebaseEvent(
                                                'Container_navigate_to');

                                            context.pushNamed(
                                              'WeekHistory',
                                              queryParameters: {
                                                'weekStartDate': serializeParam(
                                                  widget.weekStartDate,
                                                  ParamType.DateTime,
                                                ),
                                                'clientName': serializeParam(
                                                  listViewGoersDataRecord.name,
                                                  ParamType.String,
                                                ),
                                              }.withoutNulls,
                                            );
                                          },
                                          child: Container(
                                            width: 75.0,
                                            height: double.infinity,
                                            decoration: const BoxDecoration(),
                                            child: SingleChildScrollView(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    width: 40.0,
                                                    height: 40.0,
                                                    decoration: const BoxDecoration(
                                                      color: Color(0xFF6FC177),
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Builder(
                                                      builder: (context) {
                                                        if (listViewGoersDataRecord
                                                                    .photoUrl !=
                                                                '') {
                                                          return ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        50.0),
                                                            child:
                                                                Image.network(
                                                              listViewGoersDataRecord
                                                                  .photoUrl,
                                                              width: 300.0,
                                                              height: 200.0,
                                                              fit: BoxFit
                                                                  .contain,
                                                            ),
                                                          );
                                                        } else {
                                                          return Align(
                                                            alignment:
                                                                const AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Text(
                                                              functions.convertToTitleCase(
                                                                  listViewGoersDataRecord
                                                                      .name),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Manrope',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    fontSize:
                                                                        20.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                            ),
                                                          );
                                                        }
                                                      },
                                                    ),
                                                  ),
                                                  Text(
                                                    listViewGoersDataRecord
                                                        .name,
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Manrope',
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ],
                                              ),
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
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Week',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Manrope',
                                        letterSpacing: 0.0,
                                        decoration: TextDecoration.underline,
                                      ),
                                ),
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'WEEK_HISTORY_PAGE_Text_fdgzyqyc_ON_TAP');
                                    logFirebaseEvent('Text_navigate_to');

                                    context.goNamed(
                                      'MonthHistory',
                                      queryParameters: {
                                        'clientName': serializeParam(
                                          widget.clientName,
                                          ParamType.String,
                                        ),
                                      }.withoutNulls,
                                    );
                                  },
                                  child: Text(
                                    'Month',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Manrope',
                                          color: const Color(0xFF91979D),
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                              ].divide(const SizedBox(width: 20.0)),
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                valueOrDefault<String>(
                                  functions.getCurrentWeekScoreTitle(
                                      getCurrentTimestamp),
                                  '0',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Manrope',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              Builder(
                                builder: (context) {
                                  if (functions.convertDateTimeToDate(
                                          widget.weekStartDate!) <
                                      functions.getTodaysDate()) {
                                    return InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'WEEK_HISTORY_PAGE_Icon_2c43rhpe_ON_TAP');
                                        logFirebaseEvent('Icon_navigate_to');

                                        context.pushNamed(
                                          'WeekHistory',
                                          queryParameters: {
                                            'weekStartDate': serializeParam(
                                              functions.getFutureDate(
                                                  widget.weekStartDate!, 7),
                                              ParamType.DateTime,
                                            ),
                                            'clientName': serializeParam(
                                              widget.clientName,
                                              ParamType.String,
                                            ),
                                          }.withoutNulls,
                                        );
                                      },
                                      child: const Icon(
                                        Icons.chevron_right,
                                        color: Color(0xFF40B1BF),
                                        size: 20.0,
                                      ),
                                    );
                                  } else {
                                    return Container(
                                      width: 10.0,
                                      height: 10.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                    );
                                  }
                                },
                              ),
                            ],
                          ),
                          Align(
                            alignment: const AlignmentDirectional(-1.0, 0.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xFFE7F9E9),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              alignment: const AlignmentDirectional(-1.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: SizedBox(
                                      width: 322.0,
                                      height: 135.0,
                                      child: FlutterFlowBarChart(
                                        barData: [
                                          FFBarChartData(
                                            yData: functions
                                                .convertExerciseScoreToChartData(
                                                    weekHistoryDayScoresDataRecordList
                                                        .toList())
                                                .yAxis,
                                            color: FlutterFlowTheme.of(context)
                                                .success,
                                          )
                                        ],
                                        xLabels: functions
                                            .convertExerciseScoreToChartData(
                                                weekHistoryDayScoresDataRecordList
                                                    .toList())
                                            .xAxis
                                            .map((e) => e.toString())
                                            .toList(),
                                        barWidth: 10.0,
                                        barBorderRadius:
                                            BorderRadius.circular(0.0),
                                        groupSpace: 8.0,
                                        alignment:
                                            BarChartAlignment.spaceAround,
                                        chartStylingInfo: ChartStylingInfo(
                                          backgroundColor: const Color(0xFFE7F9E9),
                                          showGrid: true,
                                          borderColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                          borderWidth: 1.0,
                                        ),
                                        axisBounds: const AxisBounds(),
                                        xAxisLabelInfo: AxisLabelInfo(
                                          title: 'Week days',
                                          titleTextStyle: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .success,
                                            fontWeight: FontWeight.w800,
                                            fontSize: 10.0,
                                          ),
                                          showLabels: true,
                                          labelInterval: 10.0,
                                        ),
                                        yAxisLabelInfo: AxisLabelInfo(
                                          title: '                Total Score',
                                          titleTextStyle: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .success,
                                            fontWeight: FontWeight.w800,
                                            fontSize: 10.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        16.0, 10.0, 16.0, 12.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'This week',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Manrope',
                                                        color:
                                                            const Color(0xFF726E6E),
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                                Text(
                                                  formatNumber(
                                                    functions.getTotalWeekScore(
                                                        weekHistoryDayScoresDataRecordList
                                                            .toList()),
                                                    formatType:
                                                        FormatType.decimal,
                                                    decimalType: DecimalType
                                                        .periodDecimal,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Manrope',
                                                        color:
                                                            const Color(0xFF20952C),
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  'Last week',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Manrope',
                                                        color:
                                                            const Color(0xFF726E6E),
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                                StreamBuilder<
                                                    List<DayScoresDataRecord>>(
                                                  stream:
                                                      queryDayScoresDataRecord(
                                                    parent: FFAppState()
                                                        .userDataReference,
                                                    queryBuilder:
                                                        (dayScoresDataRecord) =>
                                                            dayScoresDataRecord
                                                                .where(
                                                                  'date',
                                                                  isLessThanOrEqualTo:
                                                                      functions
                                                                          .getPreviousWeekStartEndDate()
                                                                          ?.end,
                                                                )
                                                                .where(
                                                                  'date',
                                                                  isGreaterThanOrEqualTo:
                                                                      functions
                                                                          .getPreviousWeekStartEndDate()
                                                                          ?.start,
                                                                ),
                                                    limit: 7,
                                                  ),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 50.0,
                                                          height: 50.0,
                                                          child:
                                                              CircularProgressIndicator(
                                                            valueColor:
                                                                AlwaysStoppedAnimation<
                                                                    Color>(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    List<DayScoresDataRecord>
                                                        textDayScoresDataRecordList =
                                                        snapshot.data!;

                                                    return Text(
                                                      formatNumber(
                                                        functions.getTotalWeekScore(
                                                            textDayScoresDataRecordList
                                                                .toList()),
                                                        formatType:
                                                            FormatType.decimal,
                                                        decimalType: DecimalType
                                                            .periodDecimal,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Manrope',
                                                            color: const Color(
                                                                0xFF2995A3),
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                    );
                                                  },
                                                ),
                                              ],
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  'Average',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Manrope',
                                                        color:
                                                            const Color(0xFF726E6E),
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                                Text(
                                                  formatNumber(
                                                    functions.getAverageWeekScore(
                                                        weekHistoryDayScoresDataRecordList
                                                            .toList()),
                                                    formatType:
                                                        FormatType.decimal,
                                                    decimalType: DecimalType
                                                        .periodDecimal,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Manrope',
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ].divide(const SizedBox(height: 10.0)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 22.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Your Workout Scores',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Manrope',
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Builder(
                                  builder: (context) {
                                    final getDayScoreData =
                                        weekHistoryDayScoresDataRecordList
                                            .toList();

                                    return ListView.separated(
                                      padding: EdgeInsets.zero,
                                      primary: false,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: getDayScoreData.length,
                                      separatorBuilder: (_, __) =>
                                          const SizedBox(height: 10.0),
                                      itemBuilder:
                                          (context, getDayScoreDataIndex) {
                                        final getDayScoreDataItem =
                                            getDayScoreData[
                                                getDayScoreDataIndex];
                                        return Align(
                                          alignment:
                                              const AlignmentDirectional(-1.0, 0.0),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 5.0, 0.0, 5.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: dateTimeFormat(
                                                          "d/M/y",
                                                          getDayScoreDataItem
                                                              .date,
                                                          locale:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .languageCode,
                                                        ) ==
                                                        dateTimeFormat(
                                                          "d/M/y",
                                                          functions
                                                              .getTodaysDate(),
                                                          locale:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .languageCode,
                                                        )
                                                    ? const Color(0xFFD5F1F3)
                                                    : const Color(0xF2F2F2F2),
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        5.0, 12.0, 5.0, 12.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Container(
                                                          width: 24.0,
                                                          height: 24.0,
                                                          decoration:
                                                              const BoxDecoration(
                                                            color: Color(
                                                                0xFF6FC177),
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          alignment:
                                                              const AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Align(
                                                            alignment:
                                                                const AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Text(
                                                              dateTimeFormat(
                                                                "MMMEd",
                                                                getDayScoreDataItem
                                                                    .date!,
                                                                locale: FFLocalizations.of(
                                                                        context)
                                                                    .languageCode,
                                                              ).maybeHandleOverflow(
                                                                maxChars: 1,
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    fontSize:
                                                                        16.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                        Text(
                                                          () {
                                                            if (dateTimeFormat(
                                                                  "d/M/y",
                                                                  getDayScoreDataItem
                                                                      .date,
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                ) ==
                                                                dateTimeFormat(
                                                                  "d/M/y",
                                                                  functions
                                                                      .getYesterdaysDate(
                                                                          1),
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                )) {
                                                              return 'Yesterday';
                                                            } else if (dateTimeFormat(
                                                                  "d/M/y",
                                                                  getDayScoreDataItem
                                                                      .date,
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                ) ==
                                                                dateTimeFormat(
                                                                  "d/M/y",
                                                                  functions
                                                                      .getTodaysDate(),
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                )) {
                                                              return 'Today';
                                                            } else {
                                                              return dateTimeFormat(
                                                                "MMMEd",
                                                                getDayScoreDataItem
                                                                    .date!,
                                                                locale: FFLocalizations.of(
                                                                        context)
                                                                    .languageCode,
                                                              );
                                                            }
                                                          }(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Manrope',
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                        ),
                                                      ].divide(
                                                          const SizedBox(width: 8.0)),
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Text(
                                                          getDayScoreDataItem
                                                              .totalScore
                                                              .toString(),
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
                                                                        .bold,
                                                              ),
                                                        ),
                                                        const Icon(
                                                          Icons.chevron_right,
                                                          color:
                                                              Color(0xFF40B1BF),
                                                          size: 20.0,
                                                        ),
                                                      ].divide(
                                                          const SizedBox(width: 8.0)),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ].divide(const SizedBox(height: 10.0)),
                            ),
                          ),
                        ].divide(const SizedBox(height: 15.0)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
