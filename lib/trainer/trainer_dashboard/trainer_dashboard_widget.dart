import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/empty_client_list_widget.dart';
import '/components/empty_score_list_widget.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'trainer_dashboard_model.dart';
export 'trainer_dashboard_model.dart';

class TrainerDashboardWidget extends StatefulWidget {
  const TrainerDashboardWidget({super.key});

  @override
  State<TrainerDashboardWidget> createState() => _TrainerDashboardWidgetState();
}

class _TrainerDashboardWidgetState extends State<TrainerDashboardWidget> {
  late TrainerDashboardModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TrainerDashboardModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'TrainerDashboard'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('TRAINER_DASHBOARD_TrainerDashboard_ON_IN');
      // Select First goers
      logFirebaseEvent('TrainerDashboard_SelectFirstgoers');
      _model.firstSelectedUsersData = await queryGoersDataRecordOnce(
        parent: currentUserDocument?.userDataReference,
        queryBuilder: (goersDataRecord) =>
            goersDataRecord.orderBy('updated_at', descending: true),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      // Update selected user ref details
      logFirebaseEvent('TrainerDashboard_Updateselecteduserrefde');
      _model.selectedUserDetails =
          _model.firstSelectedUsersData?.userDataReference;
      safeSetState(() {});
      // Update selected user ref setails
      logFirebaseEvent('TrainerDashboard_Updateselecteduserrefse');
      FFAppState().userDataReference =
          _model.firstSelectedUsersData?.userDataReference;
      safeSetState(() {});
      if (currentUserDisplayName == '') {
        logFirebaseEvent('TrainerDashboard_navigate_to');

        context.pushNamed('LogSignup');
      }
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return AuthUserStreamWidget(
      builder: (context) => StreamBuilder<List<GoersDataRecord>>(
        stream: queryGoersDataRecord(
          parent: currentUserDocument?.userDataReference,
          queryBuilder: (goersDataRecord) =>
              goersDataRecord.orderBy('updated_at', descending: true),
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
          List<GoersDataRecord> trainerDashboardGoersDataRecordList =
              snapshot.data!;

          return GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
              floatingActionButton: Visibility(
                visible: trainerDashboardGoersDataRecordList.isNotEmpty,
                child: Align(
                  alignment: const AlignmentDirectional(1.0, 1.0),
                  child: FloatingActionButton.extended(
                    onPressed: () {
                      print('FloatingActionButton pressed ...');
                    },
                    backgroundColor: const Color(0xFF151515),
                    label: Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Ready for a \nChallenge?',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Manrope',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  fontSize: 14.0,
                                  letterSpacing: 0.5,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'TRAINER_DASHBOARD_Container_nud0ajyb_ON_');
                              logFirebaseEvent('Container_navigate_to');

                              context.pushNamed('SearchExercise');
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xFF4CB256),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                          FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent(
                                  'TRAINER_DASHBOARD_ADD_SET_BTN_ON_TAP');
                              logFirebaseEvent('Button_navigate_to');

                              context.pushNamed('SearchExercise');
                            },
                            text: 'Add Set',
                            icon: const Icon(
                              Icons.add,
                              size: 14.0,
                            ),
                            options: FFButtonOptions(
                              height: 35.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 12.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: const Color(0xFF4CB256),
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Manrope',
                                    color: Colors.white,
                                    fontSize: 14.0,
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
                        ].divide(const SizedBox(width: 70.0)),
                      ),
                    ),
                  ),
                ),
              ),
              appBar: AppBar(
                backgroundColor:
                    FlutterFlowTheme.of(context).secondaryBackground,
                automaticallyImplyLeading: false,
                title: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/images/logo-dashfit-resized_1.png',
                        width: 140.0,
                        height: 40.0,
                        fit: BoxFit.cover,
                      ),
                    ),
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
                                'TRAINER_DASHBOARD_Container_memhbkwr_ON_');
                            logFirebaseEvent('Container_navigate_to');

                            context.pushNamed('MyProfile');
                          },
                          child: Container(
                            width: 40.0,
                            height: 40.0,
                            decoration: const BoxDecoration(
                              color: Color(0xFF6FC177),
                              shape: BoxShape.circle,
                            ),
                            child: Builder(
                              builder: (context) {
                                if (currentUserPhoto != '') {
                                  return ClipRRect(
                                    borderRadius: BorderRadius.circular(50.0),
                                    child: Image.network(
                                      currentUserPhoto,
                                      width: 300.0,
                                      height: 200.0,
                                      fit: BoxFit.contain,
                                    ),
                                  );
                                } else {
                                  return Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Text(
                                      functions.convertToTitleCase(
                                          currentUserDisplayName),
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Manrope',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            fontSize: 26.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  );
                                }
                              },
                            ),
                          ),
                        ),
                      ].divide(const SizedBox(width: 10.0)),
                    ),
                  ],
                ),
                actions: const [],
                centerTitle: false,
                elevation: 4.0,
              ),
              body: SafeArea(
                top: true,
                child: Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 20.0),
                  child: SingleChildScrollView(
                    primary: false,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Builder(
                          builder: (context) {
                            if (trainerDashboardGoersDataRecordList
                                .isNotEmpty) {
                              return Container(
                                decoration: const BoxDecoration(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      height: 80.0,
                                      constraints: const BoxConstraints(
                                        minHeight: 80.0,
                                      ),
                                      decoration: const BoxDecoration(),
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Builder(
                                              builder: (context) {
                                                final allGoersList =
                                                    trainerDashboardGoersDataRecordList
                                                        .toList();
                                                if (allGoersList.isEmpty) {
                                                  return const EmptyClientListWidget();
                                                }

                                                return ListView.separated(
                                                  padding: const EdgeInsets.symmetric(
                                                      horizontal: 10.0),
                                                  primary: false,
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  itemCount:
                                                      allGoersList.length,
                                                  separatorBuilder: (_, __) =>
                                                      const SizedBox(width: 10.0),
                                                  itemBuilder: (context,
                                                      allGoersListIndex) {
                                                    final allGoersListItem =
                                                        allGoersList[
                                                            allGoersListIndex];
                                                    return InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        logFirebaseEvent(
                                                            'TRAINER_DASHBOARD_Container_dx8hjzbc_ON_');
                                                        logFirebaseEvent(
                                                            'Container_backend_call');

                                                        await allGoersListItem
                                                            .reference
                                                            .update(
                                                                createGoersDataRecordData(
                                                          updatedAt:
                                                              getCurrentTimestamp,
                                                        ));
                                                        // update user ref page state
                                                        logFirebaseEvent(
                                                            'Container_updateuserrefpagestate');
                                                        _model.selectedUserDetails =
                                                            allGoersListItem
                                                                .userDataReference;
                                                        safeSetState(() {});
                                                        // Update user data ref app state
                                                        logFirebaseEvent(
                                                            'Container_Updateuserdatarefappstate');
                                                        FFAppState()
                                                                .userDataReference =
                                                            allGoersListItem
                                                                .userDataReference;
                                                        safeSetState(() {});
                                                      },
                                                      child: Container(
                                                        height: double.infinity,
                                                        constraints:
                                                            const BoxConstraints(
                                                          minWidth: 50.0,
                                                          maxWidth: 60.0,
                                                        ),
                                                        decoration:
                                                            const BoxDecoration(
                                                          shape: BoxShape
                                                              .rectangle,
                                                        ),
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                0.0, -1.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Builder(
                                                              builder:
                                                                  (context) {
                                                                if (allGoersListItem
                                                                            .photoUrl !=
                                                                        '') {
                                                                  return Container(
                                                                    width: 40.0,
                                                                    height:
                                                                        40.0,
                                                                    clipBehavior:
                                                                        Clip.antiAlias,
                                                                    decoration:
                                                                        const BoxDecoration(
                                                                      shape: BoxShape
                                                                          .circle,
                                                                    ),
                                                                    child: Image
                                                                        .network(
                                                                      allGoersListItem
                                                                          .photoUrl,
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  );
                                                                } else {
                                                                  return Container(
                                                                    width: 45.0,
                                                                    height:
                                                                        45.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: const Color(
                                                                          0xFF4CB256),
                                                                      shape: BoxShape
                                                                          .circle,
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: _model.selectedUserDetails ==
                                                                                allGoersListItem.userDataReference
                                                                            ? FlutterFlowTheme.of(context).secondary
                                                                            : const Color(0xFF4CB256),
                                                                        width:
                                                                            3.0,
                                                                      ),
                                                                    ),
                                                                    alignment:
                                                                        const AlignmentDirectional(
                                                                            0.0,
                                                                            1.0),
                                                                    child:
                                                                        Align(
                                                                      alignment:
                                                                          const AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          functions
                                                                              .convertToTitleCase(allGoersListItem.name),
                                                                          'Y',
                                                                        ),
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Manrope',
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              fontSize: 20.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w600,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                }
                                                              },
                                                            ),
                                                            Expanded(
                                                              child: Text(
                                                                allGoersListItem
                                                                    .name,
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Manrope',
                                                                      fontSize:
                                                                          12.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    logFirebaseEvent(
                                                        'TRAINER_DASHBOARD_Column_tjamwi3v_ON_TAP');
                                                    logFirebaseEvent(
                                                        'Column_navigate_to');

                                                    context.pushNamed(
                                                        'ManageClient');
                                                  },
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Container(
                                                        width: 40.0,
                                                        height: 40.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          border: Border.all(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .success,
                                                          ),
                                                        ),
                                                        child: const Icon(
                                                          Icons
                                                              .display_settings_rounded,
                                                          color:
                                                              Color(0xFF6DCBD7),
                                                          size: 24.0,
                                                        ),
                                                      ),
                                                      Text(
                                                        'Manage',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Manrope',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    StreamBuilder<UsersDataRecord>(
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
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }

                                        final containerUsersDataRecord =
                                            snapshot.data!;

                                        return Container(
                                          decoration: const BoxDecoration(),
                                          child: StreamBuilder<
                                              List<DayScoresDataRecord>>(
                                            stream: queryDayScoresDataRecord(
                                              parent: containerUsersDataRecord
                                                  .reference,
                                              queryBuilder:
                                                  (dayScoresDataRecord) =>
                                                      dayScoresDataRecord.where(
                                                'date',
                                                isEqualTo:
                                                    functions.getTodaysDate(),
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
                                                  containerDayScoresDataRecordList =
                                                  snapshot.data!;
                                              final containerDayScoresDataRecord =
                                                  containerDayScoresDataRecordList
                                                          .isNotEmpty
                                                      ? containerDayScoresDataRecordList
                                                          .first
                                                      : null;

                                              return Container(
                                                decoration: const BoxDecoration(),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  20.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Expanded(
                                                                flex: 4,
                                                                child: Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          10.0,
                                                                          0.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Align(
                                                                        alignment: const AlignmentDirectional(
                                                                            -1.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          containerUsersDataRecord
                                                                              .displayName,
                                                                          textAlign:
                                                                              TextAlign.start,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Manrope',
                                                                                color: const Color(0xFF40B1BF),
                                                                                fontSize: 24.0,
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children:
                                                                            [
                                                                          Align(
                                                                            alignment:
                                                                                const AlignmentDirectional(-1.0, 0.0),
                                                                            child:
                                                                                Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                              child: Text(
                                                                                '${containerUsersDataRecord.age} years',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Manrope',
                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Align(
                                                                            alignment:
                                                                                const AlignmentDirectional(-1.0, 0.0),
                                                                            child:
                                                                                Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                              child: Text(
                                                                                '${containerUsersDataRecord.height.value}ft/cm',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Manrope',
                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Align(
                                                                            alignment:
                                                                                const AlignmentDirectional(-1.0, 0.0),
                                                                            child:
                                                                                Text(
                                                                              '${containerUsersDataRecord.weight.toString()}kg',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Manrope',
                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                    letterSpacing: 0.0,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ].divide(const SizedBox(width: 2.0)),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    const AlignmentDirectional(
                                                                        1.0,
                                                                        0.0),
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: const Color(
                                                                        0xFF151515),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            40.0),
                                                                    shape: BoxShape
                                                                        .rectangle,
                                                                  ),
                                                                  alignment:
                                                                      const AlignmentDirectional(
                                                                          1.0,
                                                                          0.0),
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12.0,
                                                                            8.0,
                                                                            12.0,
                                                                            8.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children:
                                                                          [
                                                                        ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                          child:
                                                                              Image.asset(
                                                                            'assets/images/Vector.png',
                                                                            width:
                                                                                12.0,
                                                                            height:
                                                                                22.0,
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: const AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            valueOrDefault<String>(
                                                                              formatNumber(
                                                                                containerDayScoresDataRecord?.totalScore,
                                                                                formatType: FormatType.decimal,
                                                                                decimalType: DecimalType.automatic,
                                                                              ),
                                                                              '0',
                                                                            ),
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Poppins',
                                                                                  color: const Color(0xFF6DCBD7),
                                                                                  fontSize: 14.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ].divide(const SizedBox(
                                                                              width: 4.0)),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    logFirebaseEvent(
                                                                        'TRAINER_DASHBOARD_Container_nhxf0ht6_ON_');
                                                                    logFirebaseEvent(
                                                                        'Container_navigate_to');

                                                                    context
                                                                        .pushNamed(
                                                                      'ClientProfile',
                                                                      queryParameters:
                                                                          {
                                                                        'selectedClientDetails':
                                                                            serializeParam(
                                                                          _model
                                                                              .selectedUserDetails,
                                                                          ParamType
                                                                              .DocumentReference,
                                                                        ),
                                                                      }.withoutNulls,
                                                                    );
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    width: 40.0,
                                                                    height:
                                                                        40.0,
                                                                    decoration:
                                                                        const BoxDecoration(
                                                                      color: Color(
                                                                          0xFF6FC177),
                                                                      shape: BoxShape
                                                                          .circle,
                                                                    ),
                                                                    child:
                                                                        Builder(
                                                                      builder:
                                                                          (context) {
                                                                        if (containerUsersDataRecord.photoUrl !=
                                                                                '') {
                                                                          return ClipRRect(
                                                                            borderRadius:
                                                                                BorderRadius.circular(50.0),
                                                                            child:
                                                                                Image.network(
                                                                              containerUsersDataRecord.photoUrl,
                                                                              width: 300.0,
                                                                              height: 200.0,
                                                                              fit: BoxFit.contain,
                                                                            ),
                                                                          );
                                                                        } else {
                                                                          return Align(
                                                                            alignment:
                                                                                const AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                                Text(
                                                                              functions.convertToTitleCase(containerUsersDataRecord.displayName),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Manrope',
                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    fontSize: 20.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w600,
                                                                                  ),
                                                                            ),
                                                                          );
                                                                        }
                                                                      },
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  15.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Expanded(
                                                            flex: 1,
                                                            child: InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                logFirebaseEvent(
                                                                    'TRAINER_DASHBOARD_Container_djv3cy38_ON_');
                                                                logFirebaseEvent(
                                                                    'Container_navigate_to');

                                                                context
                                                                    .pushNamed(
                                                                  'ExerciseScoreList',
                                                                  queryParameters:
                                                                      {
                                                                    'exerciseDate':
                                                                        serializeParam(
                                                                      functions
                                                                          .getTodaysDate(),
                                                                      ParamType
                                                                          .DateTime,
                                                                    ),
                                                                    'clientName':
                                                                        serializeParam(
                                                                      containerUsersDataRecord
                                                                          .displayName,
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                  }.withoutNulls,
                                                                );
                                                              },
                                                              child: Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: const Color(
                                                                      0xFFD5F1F3),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12.0),
                                                                ),
                                                                child: Align(
                                                                  alignment:
                                                                      const AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        const EdgeInsets.all(
                                                                            20.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Align(
                                                                          alignment: const AlignmentDirectional(
                                                                              -1.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            'Today',
                                                                            textAlign:
                                                                                TextAlign.start,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Manrope',
                                                                                  fontSize: 14.0,
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children:
                                                                              [
                                                                            Container(
                                                                              width: 15.0,
                                                                              height: 15.0,
                                                                              decoration: const BoxDecoration(
                                                                                color: Color(0xFF6FC177),
                                                                              ),
                                                                            ),
                                                                            Text(
                                                                              valueOrDefault<String>(
                                                                                formatNumber(
                                                                                  containerDayScoresDataRecord?.totalScore,
                                                                                  formatType: FormatType.decimal,
                                                                                  decimalType: DecimalType.automatic,
                                                                                ),
                                                                                '0',
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Manrope',
                                                                                    fontSize: 18.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.bold,
                                                                                  ),
                                                                            ),
                                                                          ].divide(const SizedBox(width: 5.0)),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            flex: 1,
                                                            child: InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                logFirebaseEvent(
                                                                    'TRAINER_DASHBOARD_Container_ddw8otbl_ON_');
                                                                logFirebaseEvent(
                                                                    'Container_navigate_to');

                                                                context
                                                                    .pushNamed(
                                                                  'ExerciseScoreList',
                                                                  queryParameters:
                                                                      {
                                                                    'exerciseDate':
                                                                        serializeParam(
                                                                      functions
                                                                          .getYesterdaysDate(
                                                                              1),
                                                                      ParamType
                                                                          .DateTime,
                                                                    ),
                                                                    'clientName':
                                                                        serializeParam(
                                                                      containerUsersDataRecord
                                                                          .displayName,
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                  }.withoutNulls,
                                                                );
                                                              },
                                                              child: Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: const Color(
                                                                      0xFFE7F9E9),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12.0),
                                                                ),
                                                                child: Align(
                                                                  alignment:
                                                                      const AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        const EdgeInsets.all(
                                                                            20.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Align(
                                                                          alignment: const AlignmentDirectional(
                                                                              -1.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            'Yesterday',
                                                                            textAlign:
                                                                                TextAlign.start,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Manrope',
                                                                                  fontSize: 14.0,
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children:
                                                                              [
                                                                            Container(
                                                                              width: 15.0,
                                                                              height: 15.0,
                                                                              decoration: const BoxDecoration(
                                                                                color: Color(0xFF6DCBD7),
                                                                              ),
                                                                            ),
                                                                            StreamBuilder<List<DayScoresDataRecord>>(
                                                                              stream: queryDayScoresDataRecord(
                                                                                parent: containerUsersDataRecord.reference,
                                                                                queryBuilder: (dayScoresDataRecord) => dayScoresDataRecord.where(
                                                                                  'date',
                                                                                  isEqualTo: functions.getYesterdaysDate(1),
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
                                                                                List<DayScoresDataRecord> textDayScoresDataRecordList = snapshot.data!;
                                                                                final textDayScoresDataRecord = textDayScoresDataRecordList.isNotEmpty ? textDayScoresDataRecordList.first : null;

                                                                                return Text(
                                                                                  valueOrDefault<String>(
                                                                                    formatNumber(
                                                                                      textDayScoresDataRecord?.totalScore,
                                                                                      formatType: FormatType.decimal,
                                                                                      decimalType: DecimalType.automatic,
                                                                                    ),
                                                                                    '0',
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Manrope',
                                                                                        fontSize: 18.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.bold,
                                                                                      ),
                                                                                );
                                                                              },
                                                                            ),
                                                                          ].divide(const SizedBox(width: 5.0)),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ].divide(const SizedBox(
                                                            width: 7.0)),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              -1.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    8.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: StreamBuilder<
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
                                                                              .getCurrentWeekStartEndDate()
                                                                              ?.end,
                                                                        )
                                                                        .where(
                                                                          'date',
                                                                          isGreaterThanOrEqualTo: functions
                                                                              .getCurrentWeekStartEndDate()
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
                                                                containerDayScoresDataRecordList =
                                                                snapshot.data!;

                                                            return Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: const Color(
                                                                    0xFFE7F9E9),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12.0),
                                                              ),
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      -1.0,
                                                                      0.0),
                                                              child: Padding(
                                                                padding: const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        20.0,
                                                                        16.0,
                                                                        12.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Text(
                                                                              'This week',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Manrope',
                                                                                    fontSize: 12.0,
                                                                                    letterSpacing: 0.0,
                                                                                  ),
                                                                            ),
                                                                            Text(
                                                                              valueOrDefault<String>(
                                                                                formatNumber(
                                                                                  functions.getTotalWeekScore(containerDayScoresDataRecordList.toList()),
                                                                                  formatType: FormatType.decimal,
                                                                                  decimalType: DecimalType.periodDecimal,
                                                                                ),
                                                                                '0',
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Manrope',
                                                                                    color: const Color(0xFF20952C),
                                                                                    fontSize: 16.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.bold,
                                                                                  ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        SizedBox(
                                                                          width:
                                                                              240.0,
                                                                          height:
                                                                              80.0,
                                                                          child:
                                                                              FlutterFlowBarChart(
                                                                            barData: [
                                                                              FFBarChartData(
                                                                                yData: functions.convertExerciseScoreToChartData(containerDayScoresDataRecordList.toList()).yAxis,
                                                                                color: FlutterFlowTheme.of(context).success,
                                                                              )
                                                                            ],
                                                                            xLabels:
                                                                                functions.convertExerciseScoreToChartData(containerDayScoresDataRecordList.toList()).xAxis.map((e) => e.toString()).toList(),
                                                                            barWidth:
                                                                                15.0,
                                                                            barBorderRadius:
                                                                                BorderRadius.circular(0.0),
                                                                            groupSpace:
                                                                                8.0,
                                                                            alignment:
                                                                                BarChartAlignment.spaceAround,
                                                                            chartStylingInfo:
                                                                                ChartStylingInfo(
                                                                              backgroundColor: const Color(0xFFE7F9E9),
                                                                              showGrid: true,
                                                                              borderColor: FlutterFlowTheme.of(context).secondaryText,
                                                                              borderWidth: 1.0,
                                                                            ),
                                                                            axisBounds:
                                                                                const AxisBounds(),
                                                                            xAxisLabelInfo:
                                                                                const AxisLabelInfo(
                                                                              showLabels: true,
                                                                              labelTextStyle: TextStyle(
                                                                                fontWeight: FontWeight.w600,
                                                                                fontSize: 10.0,
                                                                              ),
                                                                              labelInterval: 10.0,
                                                                            ),
                                                                            yAxisLabelInfo:
                                                                                const AxisLabelInfo(),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children:
                                                                              [
                                                                            Text(
                                                                              'Last week',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Manrope',
                                                                                    fontSize: 12.0,
                                                                                    letterSpacing: 0.0,
                                                                                  ),
                                                                            ),
                                                                            StreamBuilder<List<DayScoresDataRecord>>(
                                                                              stream: queryDayScoresDataRecord(
                                                                                parent: FFAppState().userDataReference,
                                                                                queryBuilder: (dayScoresDataRecord) => dayScoresDataRecord
                                                                                    .where(
                                                                                      'date',
                                                                                      isLessThanOrEqualTo: functions.getPreviousWeekStartEndDate()?.end,
                                                                                    )
                                                                                    .where(
                                                                                      'date',
                                                                                      isGreaterThanOrEqualTo: functions.getPreviousWeekStartEndDate()?.start,
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
                                                                                        valueColor: AlwaysStoppedAnimation<Color>(
                                                                                          FlutterFlowTheme.of(context).primary,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                }
                                                                                List<DayScoresDataRecord> textDayScoresDataRecordList = snapshot.data!;

                                                                                return Text(
                                                                                  valueOrDefault<String>(
                                                                                    formatNumber(
                                                                                      functions.getTotalWeekScore(textDayScoresDataRecordList.toList()),
                                                                                      formatType: FormatType.decimal,
                                                                                      decimalType: DecimalType.periodDecimal,
                                                                                    ),
                                                                                    '0',
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Manrope',
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.bold,
                                                                                      ),
                                                                                );
                                                                              },
                                                                            ),
                                                                          ].divide(const SizedBox(width: 5.0)),
                                                                        ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children:
                                                                              [
                                                                            Text(
                                                                              'Average',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Manrope',
                                                                                    fontSize: 12.0,
                                                                                    letterSpacing: 0.0,
                                                                                  ),
                                                                            ),
                                                                            Text(
                                                                              valueOrDefault<String>(
                                                                                formatNumber(
                                                                                  functions.getAverageWeekScore(containerDayScoresDataRecordList.toList()),
                                                                                  formatType: FormatType.decimal,
                                                                                  decimalType: DecimalType.periodDecimal,
                                                                                ),
                                                                                '0',
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Manrope',
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.bold,
                                                                                  ),
                                                                            ),
                                                                          ].divide(const SizedBox(width: 5.0)),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ].divide(const SizedBox(
                                                                      height:
                                                                          10.0)),
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  22.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            'Your Workout Scores',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Manrope',
                                                                  fontSize:
                                                                      16.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                          InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              logFirebaseEvent(
                                                                  'TRAINER_DASHBOARD_Row_kn6m36rh_ON_TAP');
                                                              logFirebaseEvent(
                                                                  'Row_navigate_to');

                                                              context.pushNamed(
                                                                'WeekHistory',
                                                                queryParameters:
                                                                    {
                                                                  'weekStartDate':
                                                                      serializeParam(
                                                                    functions
                                                                        .getTodaysDate(),
                                                                    ParamType
                                                                        .DateTime,
                                                                  ),
                                                                  'clientName':
                                                                      serializeParam(
                                                                    containerUsersDataRecord
                                                                        .displayName,
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                }.withoutNulls,
                                                              );
                                                            },
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Text(
                                                                  'See all',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Manrope',
                                                                        color: const Color(
                                                                            0xFF40B1BF),
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                                FlutterFlowIconButton(
                                                                  borderColor:
                                                                      Colors
                                                                          .transparent,
                                                                  borderRadius:
                                                                      20.0,
                                                                  borderWidth:
                                                                      1.0,
                                                                  buttonSize:
                                                                      30.0,
                                                                  icon: const Icon(
                                                                    Icons
                                                                        .chevron_right,
                                                                    color: Color(
                                                                        0xFF40B1BF),
                                                                    size: 14.0,
                                                                  ),
                                                                  onPressed:
                                                                      () {
                                                                    print(
                                                                        'IconButton pressed ...');
                                                                  },
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  10.0,
                                                                  0.0,
                                                                  45.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color: const Color(
                                                                  0xFFD5F1F3),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12.0),
                                                            ),
                                                            child: Align(
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      -1.0,
                                                                      0.0),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(
                                                                            12.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .center,
                                                                      children:
                                                                          [
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.start,
                                                                          children:
                                                                              [
                                                                            Container(
                                                                              width: 32.0,
                                                                              height: 32.0,
                                                                              decoration: const BoxDecoration(
                                                                                color: Color(0xFF6DCBD7),
                                                                                shape: BoxShape.circle,
                                                                              ),
                                                                              child: Align(
                                                                                alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                child: Text(
                                                                                  'T',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Poppins',
                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        fontSize: 16.0,
                                                                                        letterSpacing: 0.0,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Text(
                                                                              'Today',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Manrope',
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w500,
                                                                                  ),
                                                                            ),
                                                                          ].divide(const SizedBox(width: 8.0)),
                                                                        ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children:
                                                                              [
                                                                            Text(
                                                                              valueOrDefault<String>(
                                                                                formatNumber(
                                                                                  containerDayScoresDataRecord?.totalScore,
                                                                                  formatType: FormatType.decimal,
                                                                                  decimalType: DecimalType.automatic,
                                                                                ),
                                                                                '0',
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Manrope',
                                                                                    fontSize: 16.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.bold,
                                                                                  ),
                                                                            ),
                                                                            Text(
                                                                              '>',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Manrope',
                                                                                    color: const Color(0xFF40B1BF),
                                                                                    fontSize: 18.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.bold,
                                                                                  ),
                                                                            ),
                                                                          ].divide(const SizedBox(width: 8.0)),
                                                                        ),
                                                                      ].divide(const SizedBox(
                                                                              width: 8.0)),
                                                                    ),
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              40.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              InkWell(
                                                                            splashColor:
                                                                                Colors.transparent,
                                                                            focusColor:
                                                                                Colors.transparent,
                                                                            hoverColor:
                                                                                Colors.transparent,
                                                                            highlightColor:
                                                                                Colors.transparent,
                                                                            onTap:
                                                                                () async {
                                                                              logFirebaseEvent('TRAINER_DASHBOARD_Text_b2vco8py_ON_TAP');
                                                                              logFirebaseEvent('Text_navigate_to');

                                                                              context.pushNamed(
                                                                                'ExerciseScoreList',
                                                                                queryParameters: {
                                                                                  'exerciseDate': serializeParam(
                                                                                    functions.getTodaysDate(),
                                                                                    ParamType.DateTime,
                                                                                  ),
                                                                                  'clientName': serializeParam(
                                                                                    containerUsersDataRecord.displayName,
                                                                                    ParamType.String,
                                                                                  ),
                                                                                }.withoutNulls,
                                                                              );
                                                                            },
                                                                            child:
                                                                                Text(
                                                                              'Add exercise',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Manrope',
                                                                                    letterSpacing: 0.0,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        FFButtonWidget(
                                                                          onPressed:
                                                                              () async {
                                                                            logFirebaseEvent('TRAINER_DASHBOARD_ADD_SET_BTN_ON_TAP');
                                                                            logFirebaseEvent('Button_navigate_to');

                                                                            context.pushNamed('SearchExercise');
                                                                          },
                                                                          text:
                                                                              'Add Set',
                                                                          icon:
                                                                              const Icon(
                                                                            Icons.add,
                                                                            size:
                                                                                14.0,
                                                                          ),
                                                                          options:
                                                                              FFButtonOptions(
                                                                            height:
                                                                                30.0,
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                14.0,
                                                                                0.0,
                                                                                14.0,
                                                                                0.0),
                                                                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            color:
                                                                                const Color(0xFF4CB256),
                                                                            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                  fontFamily: 'Manrope',
                                                                                  color: Colors.white,
                                                                                  fontSize: 12.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.bold,
                                                                                ),
                                                                            elevation:
                                                                                3.0,
                                                                            borderSide:
                                                                                const BorderSide(
                                                                              color: Colors.transparent,
                                                                              width: 1.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ].divide(const SizedBox(
                                                                      height:
                                                                          5.0)),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          StreamBuilder<
                                                              List<
                                                                  DayScoresDataRecord>>(
                                                            stream:
                                                                queryDayScoresDataRecord(
                                                              parent:
                                                                  containerUsersDataRecord
                                                                      .reference,
                                                              queryBuilder: (dayScoresDataRecord) =>
                                                                  dayScoresDataRecord
                                                                      .where(
                                                                        'date',
                                                                        isNotEqualTo:
                                                                            functions.getTodaysDate(),
                                                                      )
                                                                      .orderBy(
                                                                          'date',
                                                                          descending:
                                                                              true),
                                                              limit: 6,
                                                            ),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 50.0,
                                                                    height:
                                                                        50.0,
                                                                    child:
                                                                        CircularProgressIndicator(
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
                                                              List<DayScoresDataRecord>
                                                                  containerDayScoresDataRecordList =
                                                                  snapshot
                                                                      .data!;

                                                              return Container(
                                                                decoration:
                                                                    const BoxDecoration(),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    if (containerDayScoresDataRecordList
                                                                        .isNotEmpty)
                                                                      Builder(
                                                                        builder:
                                                                            (context) {
                                                                          final dayScoreList =
                                                                              containerDayScoresDataRecordList.toList();
                                                                          if (dayScoreList
                                                                              .isEmpty) {
                                                                            return const EmptyScoreListWidget();
                                                                          }

                                                                          return ListView
                                                                              .separated(
                                                                            padding:
                                                                                EdgeInsets.zero,
                                                                            primary:
                                                                                false,
                                                                            shrinkWrap:
                                                                                true,
                                                                            scrollDirection:
                                                                                Axis.vertical,
                                                                            itemCount:
                                                                                dayScoreList.length,
                                                                            separatorBuilder: (_, __) =>
                                                                                const SizedBox(height: 10.0),
                                                                            itemBuilder:
                                                                                (context, dayScoreListIndex) {
                                                                              final dayScoreListItem = dayScoreList[dayScoreListIndex];
                                                                              return Align(
                                                                                alignment: const AlignmentDirectional(-1.0, 0.0),
                                                                                child: InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    logFirebaseEvent('TRAINER_DASHBOARD_Container_xs2zfa6f_ON_');
                                                                                    logFirebaseEvent('Container_navigate_to');

                                                                                    context.pushNamed(
                                                                                      'ExerciseScoreList',
                                                                                      queryParameters: {
                                                                                        'exerciseDate': serializeParam(
                                                                                          dayScoreListItem.date,
                                                                                          ParamType.DateTime,
                                                                                        ),
                                                                                        'clientName': serializeParam(
                                                                                          containerUsersDataRecord.displayName,
                                                                                          ParamType.String,
                                                                                        ),
                                                                                      }.withoutNulls,
                                                                                    );
                                                                                  },
                                                                                  child: Container(
                                                                                    decoration: BoxDecoration(
                                                                                      color: const Color(0xFFF2F2F2),
                                                                                      borderRadius: BorderRadius.circular(12.0),
                                                                                    ),
                                                                                    child: Padding(
                                                                                      padding: const EdgeInsets.all(12.0),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                        children: [
                                                                                          Expanded(
                                                                                            flex: 4,
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                Expanded(
                                                                                                  flex: 1,
                                                                                                  child: Container(
                                                                                                    width: 24.0,
                                                                                                    height: 24.0,
                                                                                                    decoration: const BoxDecoration(
                                                                                                      color: Color(0xFF6FC177),
                                                                                                      shape: BoxShape.circle,
                                                                                                    ),
                                                                                                    child: Align(
                                                                                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                                      child: Text(
                                                                                                        dateTimeFormat(
                                                                                                          "MEd",
                                                                                                          dayScoreListItem.date!,
                                                                                                          locale: FFLocalizations.of(context).languageCode,
                                                                                                        ).maybeHandleOverflow(
                                                                                                          maxChars: 1,
                                                                                                        ),
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              fontFamily: 'Poppins',
                                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                              fontSize: 12.0,
                                                                                                              letterSpacing: 0.0,
                                                                                                            ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                                Expanded(
                                                                                                  flex: 10,
                                                                                                  child: Text(
                                                                                                    dateTimeFormat(
                                                                                                              "d/M/y",
                                                                                                              dayScoreListItem.date,
                                                                                                              locale: FFLocalizations.of(context).languageCode,
                                                                                                            ) ==
                                                                                                            dateTimeFormat(
                                                                                                              "d/M/y",
                                                                                                              functions.getYesterdaysDate(1),
                                                                                                              locale: FFLocalizations.of(context).languageCode,
                                                                                                            )
                                                                                                        ? 'Yesterday'
                                                                                                        : dateTimeFormat(
                                                                                                            "MMMEd",
                                                                                                            dayScoreListItem.date!,
                                                                                                            locale: FFLocalizations.of(context).languageCode,
                                                                                                          ),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Manrope',
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FontWeight.w500,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ].divide(const SizedBox(width: 8.0)),
                                                                                            ),
                                                                                          ),
                                                                                          Expanded(
                                                                                            flex: 1,
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                Expanded(
                                                                                                  child: Text(
                                                                                                    formatNumber(
                                                                                                      dayScoreListItem.totalScore,
                                                                                                      formatType: FormatType.decimal,
                                                                                                      decimalType: DecimalType.automatic,
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Manrope',
                                                                                                          fontSize: 16.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FontWeight.bold,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ].divide(const SizedBox(width: 8.0)),
                                                                                            ),
                                                                                          ),
                                                                                          Text(
                                                                                            '>',
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Manrope',
                                                                                                  color: const Color(0xFF40B1BF),
                                                                                                  fontSize: 18.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.bold,
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
                                                                    if (!(containerDayScoresDataRecordList
                                                                        .isNotEmpty))
                                                                      Builder(
                                                                        builder:
                                                                            (context) {
                                                                          final containerVar = functions
                                                                              .generateDaysFromLastWeek()
                                                                              .toList();

                                                                          return ListView
                                                                              .separated(
                                                                            padding:
                                                                                EdgeInsets.zero,
                                                                            shrinkWrap:
                                                                                true,
                                                                            scrollDirection:
                                                                                Axis.vertical,
                                                                            itemCount:
                                                                                containerVar.length,
                                                                            separatorBuilder: (_, __) =>
                                                                                const SizedBox(height: 10.0),
                                                                            itemBuilder:
                                                                                (context, containerVarIndex) {
                                                                              final containerVarItem = containerVar[containerVarIndex];
                                                                              return Container(
                                                                                decoration: BoxDecoration(
                                                                                  color: const Color(0xFFF2F2F2),
                                                                                  borderRadius: BorderRadius.circular(12.0),
                                                                                ),
                                                                                child: Padding(
                                                                                  padding: const EdgeInsets.all(12.0),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                    children: [
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Container(
                                                                                            width: 24.0,
                                                                                            height: 24.0,
                                                                                            decoration: const BoxDecoration(
                                                                                              color: Color(0xFF6FC177),
                                                                                              shape: BoxShape.circle,
                                                                                            ),
                                                                                            child: Align(
                                                                                              alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                              child: Text(
                                                                                                containerVarItem.maybeHandleOverflow(
                                                                                                  maxChars: 1,
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'Manrope',
                                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                      fontSize: 12.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          Text(
                                                                                            containerVarItem,
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Manrope',
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.w500,
                                                                                                ),
                                                                                          ),
                                                                                        ].divide(const SizedBox(width: 8.0)),
                                                                                      ),
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Text(
                                                                                            '0',
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Manrope',
                                                                                                  fontSize: 16.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.bold,
                                                                                                ),
                                                                                          ),
                                                                                          const Icon(
                                                                                            Icons.chevron_right_sharp,
                                                                                            color: Color(0xFF40B1BF),
                                                                                            size: 20.0,
                                                                                          ),
                                                                                        ].divide(const SizedBox(width: 8.0)),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            },
                                                                          );
                                                                        },
                                                                      ),
                                                                  ].divide(const SizedBox(
                                                                      height:
                                                                          10.0)),
                                                                ),
                                                              );
                                                            },
                                                          ),
                                                        ].divide(const SizedBox(
                                                            height: 10.0)),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              );
                            } else {
                              return Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 20.0),
                                      child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Align(
                                              alignment: const AlignmentDirectional(
                                                  -1.0, 0.0),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 10.0, 0.0, 0.0),
                                                child: Text(
                                                  valueOrDefault<String>(
                                                    functions
                                                        .getGreetingMessage(),
                                                    '1',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: const AlignmentDirectional(
                                                  -1.0, 0.0),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 5.0, 0.0, 0.0),
                                                child: Text(
                                                  currentUserDisplayName,
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Manrope',
                                                        color:
                                                            const Color(0xFF40B1BF),
                                                        fontSize: 24.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Text(
                                      'Add Client',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Manrope',
                                            fontSize: 24.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                    Text(
                                      'Let’s start by adding your clients',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Manrope',
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 0.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          logFirebaseEvent(
                                              'TRAINER_DASHBOARD_ADD_CLIENTS_BTN_ON_TAP');
                                          logFirebaseEvent(
                                              'Button_navigate_to');

                                          context.pushNamed('AddClientLogin');
                                        },
                                        text: 'Add Clients',
                                        icon: const Icon(
                                          Icons.add,
                                          color: Color(0xFF40B1BF),
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
                                          color: const Color(0xFFEFFEFF),
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                fontFamily: 'Manrope',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                              ),
                                          borderSide: const BorderSide(
                                            color: Color(0xFFC8F1F4),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ),
                                  ]
                                      .divide(const SizedBox(height: 10.0))
                                      .around(const SizedBox(height: 10.0)),
                                ),
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
