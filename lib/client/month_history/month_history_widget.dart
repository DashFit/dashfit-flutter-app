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
import 'month_history_model.dart';
export 'month_history_model.dart';

class MonthHistoryWidget extends StatefulWidget {
  const MonthHistoryWidget({
    super.key,
    this.clientName,
  });

  final String? clientName;

  @override
  State<MonthHistoryWidget> createState() => _MonthHistoryWidgetState();
}

class _MonthHistoryWidgetState extends State<MonthHistoryWidget> {
  late MonthHistoryModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MonthHistoryModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'MonthHistory'});
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
          isEqualTo: functions.getTodaysDate(),
        ),
        singleRecord: true,
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
        List<DayScoresDataRecord> monthHistoryDayScoresDataRecordList =
            snapshot.data!;
        final monthHistoryDayScoresDataRecord =
            monthHistoryDayScoresDataRecordList.isNotEmpty
                ? monthHistoryDayScoresDataRecordList.first
                : null;

        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            floatingActionButton: FloatingActionButton.extended(
              onPressed: () async {
                logFirebaseEvent('MONTH_HISTORY_FloatingActionButton_75wgb');
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
                ].divide(const SizedBox(width: 5.0)),
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
                                'MONTH_HISTORY_keyboard_backspace_ICN_ON_');
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
                                    monthHistoryDayScoresDataRecord?.totalScore,
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
                                                'MONTH_HISTORY_Container_4r4kw5f1_ON_TAP');
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
                                              'MonthHistory',
                                              queryParameters: {
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
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'MONTH_HISTORY_PAGE_Text_qwks6ufy_ON_TAP');
                                    logFirebaseEvent('Text_navigate_to');

                                    context.goNamed(
                                      'WeekHistory',
                                      queryParameters: {
                                        'weekStartDate': serializeParam(
                                          functions.getTodaysDate(),
                                          ParamType.DateTime,
                                        ),
                                      }.withoutNulls,
                                    );
                                  },
                                  child: Text(
                                    'Week',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Manrope',
                                          color: const Color(0xFF91979D),
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                                Text(
                                  'Month',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Manrope',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        letterSpacing: 0.0,
                                        decoration: TextDecoration.underline,
                                      ),
                                ),
                              ].divide(const SizedBox(width: 20.0)),
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                valueOrDefault<String>(
                                  functions.getMonthTitle(),
                                  '0',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Manrope',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ],
                          ),
                          Align(
                            alignment: const AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 0.0, 0.0),
                              child: StreamBuilder<List<DayScoresDataRecord>>(
                                stream: queryDayScoresDataRecord(
                                  parent: FFAppState().userDataReference,
                                  queryBuilder: (dayScoresDataRecord) =>
                                      dayScoresDataRecord
                                          .where(
                                            'date',
                                            isLessThanOrEqualTo: functions
                                                .getMonthStartEndDate()
                                                .end,
                                          )
                                          .where(
                                            'date',
                                            isGreaterThanOrEqualTo: functions
                                                .getMonthStartEndDate()
                                                .start,
                                          ),
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
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  List<DayScoresDataRecord>
                                      containerDayScoresDataRecordList =
                                      snapshot.data!;

                                  return Container(
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFE7F9E9),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    alignment: const AlignmentDirectional(-1.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 10.0, 0.0, 0.0),
                                          child: SizedBox(
                                            width: 330.0,
                                            height: 154.0,
                                            child: FlutterFlowBarChart(
                                              barData: [
                                                FFBarChartData(
                                                  yData: functions
                                                      .convertExerciseScoreToChartDataMonth(
                                                          containerDayScoresDataRecordList
                                                              .toList())
                                                      .yAxis,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .success,
                                                )
                                              ],
                                              xLabels: functions
                                                  .convertExerciseScoreToChartDataMonth(
                                                      containerDayScoresDataRecordList
                                                          .toList())
                                                  .xAxis
                                                  .map((e) => e.toString())
                                                  .toList(),
                                              barWidth: 5.0,
                                              barBorderRadius:
                                                  BorderRadius.circular(0.0),
                                              groupSpace: 4.0,
                                              alignment:
                                                  BarChartAlignment.spaceAround,
                                              chartStylingInfo:
                                                  ChartStylingInfo(
                                                backgroundColor:
                                                    const Color(0xFFE7F9E9),
                                                showGrid: true,
                                                borderColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                borderWidth: 1.0,
                                              ),
                                              axisBounds: const AxisBounds(),
                                              xAxisLabelInfo: AxisLabelInfo(
                                                title: 'Month days',
                                                titleTextStyle: TextStyle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .success,
                                                  fontWeight: FontWeight.w800,
                                                  fontSize: 10.0,
                                                ),
                                                showLabels: true,
                                                labelTextStyle: const TextStyle(
                                                  fontSize: 6.0,
                                                ),
                                                labelInterval: 10.0,
                                              ),
                                              yAxisLabelInfo: AxisLabelInfo(
                                                title:
                                                    '                   Total Score',
                                                titleTextStyle: TextStyle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .success,
                                                  fontWeight: FontWeight.w800,
                                                  fontSize: 10.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 12.0, 16.0, 12.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        'Total Score',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Manrope',
                                                              color: const Color(
                                                                  0xFF726E6E),
                                                              fontSize: 12.0,
                                                              letterSpacing:
                                                                  0.0,
                                                            ),
                                                      ),
                                                      Text(
                                                        formatNumber(
                                                          functions.getTotalWeekScore(
                                                              containerDayScoresDataRecordList
                                                                  .toList()),
                                                          formatType: FormatType
                                                              .decimal,
                                                          decimalType:
                                                              DecimalType
                                                                  .periodDecimal,
                                                        ),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Manrope',
                                                              color: const Color(
                                                                  0xFF20952C),
                                                              fontSize: 16.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                      ),
                                                    ],
                                                  ),
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        'Last week',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Manrope',
                                                              color: const Color(
                                                                  0xFF726E6E),
                                                              fontSize: 12.0,
                                                              letterSpacing:
                                                                  0.0,
                                                            ),
                                                      ),
                                                      StreamBuilder<
                                                          List<
                                                              DayScoresDataRecord>>(
                                                        stream:
                                                            queryDayScoresDataRecord(
                                                          parent: FFAppState()
                                                              .userDataReference,
                                                          queryBuilder:
                                                              (dayScoresDataRecord) =>
                                                                  dayScoresDataRecord
                                                                      .where(
                                                                        'date',
                                                                        isLessThanOrEqualTo: functions
                                                                            .getPreviousWeekStartEndDate()
                                                                            ?.end,
                                                                      )
                                                                      .where(
                                                                        'date',
                                                                        isGreaterThanOrEqualTo: functions
                                                                            .getPreviousWeekStartEndDate()
                                                                            ?.start,
                                                                      ),
                                                        ),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
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
                                                                  FormatType
                                                                      .decimal,
                                                              decimalType:
                                                                  DecimalType
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
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                          );
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        'Average',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Manrope',
                                                              color: const Color(
                                                                  0xFF726E6E),
                                                              fontSize: 12.0,
                                                              letterSpacing:
                                                                  0.0,
                                                            ),
                                                      ),
                                                      Text(
                                                        formatNumber(
                                                          functions.getAverageWeekScore(
                                                              containerDayScoresDataRecordList
                                                                  .toList()),
                                                          formatType: FormatType
                                                              .decimal,
                                                          decimalType:
                                                              DecimalType
                                                                  .periodDecimal,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Manrope',
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
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
                                  );
                                },
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
                            child: SingleChildScrollView(
                              primary: false,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  StreamBuilder<List<DayScoresDataRecord>>(
                                    stream: queryDayScoresDataRecord(
                                      parent: FFAppState().userDataReference,
                                      queryBuilder: (dayScoresDataRecord) =>
                                          dayScoresDataRecord
                                              .where(
                                                'date',
                                                isLessThanOrEqualTo: functions
                                                    .getMonthStartEndDate()
                                                    .end,
                                              )
                                              .where(
                                                'date',
                                                isGreaterThanOrEqualTo:
                                                    functions
                                                        .getMonthStartEndDate()
                                                        .start,
                                              )
                                              .orderBy('date',
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
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      List<DayScoresDataRecord>
                                          listViewDayScoresDataRecordList =
                                          snapshot.data!;

                                      return ListView.separated(
                                        padding: EdgeInsets.zero,
                                        primary: false,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount:
                                            listViewDayScoresDataRecordList
                                                .length,
                                        separatorBuilder: (_, __) =>
                                            const SizedBox(height: 10.0),
                                        itemBuilder: (context, listViewIndex) {
                                          final listViewDayScoresDataRecord =
                                              listViewDayScoresDataRecordList[
                                                  listViewIndex];
                                          return Align(
                                            alignment:
                                                const AlignmentDirectional(-1.0, 0.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: const Color(0xFFF2F2F2),
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
                                                          child: Align(
                                                            alignment:
                                                                const AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Text(
                                                              dateTimeFormat(
                                                                "MMMEd",
                                                                listViewDayScoresDataRecord
                                                                    .date!,
                                                                locale: FFLocalizations.of(
                                                                        context)
                                                                    .languageCode,
                                                              ).maybeHandleOverflow(
                                                                maxChars: 1,
                                                              ),
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
                                                                        12.0,
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
                                                                  listViewDayScoresDataRecord
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
                                                                  listViewDayScoresDataRecord
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
                                                                listViewDayScoresDataRecord
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
                                                          valueOrDefault<
                                                              String>(
                                                            formatNumber(
                                                              listViewDayScoresDataRecord
                                                                  .totalScore,
                                                              formatType:
                                                                  FormatType
                                                                      .decimal,
                                                              decimalType:
                                                                  DecimalType
                                                                      .automatic,
                                                            ),
                                                            '0',
                                                          ),
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
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ].divide(const SizedBox(height: 10.0)),
                              ),
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
