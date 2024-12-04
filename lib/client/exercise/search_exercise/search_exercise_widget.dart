import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';
import 'search_exercise_model.dart';
export 'search_exercise_model.dart';

class SearchExerciseWidget extends StatefulWidget {
  const SearchExerciseWidget({
    super.key,
    String? selectedCategory,
    this.selectedDate,
  }) : selectedCategory = selectedCategory ?? 'All';

  final String selectedCategory;
  final DateTime? selectedDate;

  @override
  State<SearchExerciseWidget> createState() => _SearchExerciseWidgetState();
}

class _SearchExerciseWidgetState extends State<SearchExerciseWidget> {
  late SearchExerciseModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchExerciseModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'SearchExercise'});
    _model.searchTextBoxTextController ??= TextEditingController();
    _model.searchTextBoxFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<ExercisesRecord>>(
      stream: queryExercisesRecord(
        queryBuilder: (exercisesRecord) => exercisesRecord.orderBy('name'),
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
        List<ExercisesRecord> searchExerciseExercisesRecordList =
            snapshot.data!;

        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: SafeArea(
              top: true,
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: SingleChildScrollView(
                  primary: false,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          if (_model.searchTextBoxTextController.text == '')
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
                                            'SEARCH_EXERCISE_Icon_bumufi6u_ON_TAP');
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
                                                            Color(0xFF0098AD),
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
                                                          color:
                                                              const Color(0xFF0098AD),
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
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                    ),
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
                                                            color: const Color(
                                                                0xFF0098AD),
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
                                                              const Color(0xFF8B959E),
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
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).alternate,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 7.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    controller:
                                        _model.searchTextBoxTextController,
                                    focusNode: _model.searchTextBoxFocusNode,
                                    onChanged: (_) => EasyDebounce.debounce(
                                      '_model.searchTextBoxTextController',
                                      const Duration(milliseconds: 500),
                                      () async {
                                        logFirebaseEvent(
                                            'SEARCH_EXERCISE_searchTextBox_ON_TEXTFIE');
                                        logFirebaseEvent(
                                            'searchTextBox_simple_search');
                                        safeSetState(() {
                                          _model
                                              .simpleSearchResults = TextSearch(
                                            searchExerciseExercisesRecordList
                                                .map(
                                                  (record) =>
                                                      TextSearchItem.fromTerms(
                                                          record,
                                                          [record.name]),
                                                )
                                                .toList(),
                                          )
                                              .search(_model
                                                  .searchTextBoxTextController
                                                  .text)
                                              .map((r) => r.object)
                                              .toList();
                                        });
                                        if (_model.searchTextBoxTextController
                                                    .text ==
                                                '') {
                                          logFirebaseEvent(
                                              'searchTextBox_update_page_state');
                                          _model.searchActive = false;
                                          safeSetState(() {});
                                        } else {
                                          logFirebaseEvent(
                                              'searchTextBox_update_page_state');
                                          _model.searchActive = true;
                                          safeSetState(() {});
                                        }
                                      },
                                    ),
                                    autofocus: false,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Manrope',
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                          ),
                                      hintText: 'Search',
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
                                      filled: true,
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      prefixIcon: const Icon(
                                        Icons.search_sharp,
                                        color: Color(0xFF0098AD),
                                      ),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Manrope',
                                          letterSpacing: 0.0,
                                        ),
                                    validator: _model
                                        .searchTextBoxTextControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                                if (_model.searchTextBoxTextController.text !=
                                        '')
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'SEARCH_EXERCISE_Icon_ciwqauph_ON_TAP');
                                      logFirebaseEvent(
                                          'Icon_clear_text_fields_pin_codes');
                                      safeSetState(() {
                                        _model.searchTextBoxTextController
                                            ?.clear();
                                      });
                                      logFirebaseEvent(
                                          'Icon_update_page_state');
                                      _model.searchActive = false;
                                      safeSetState(() {});
                                    },
                                    child: const Icon(
                                      Icons.close,
                                      color: Color(0xFF0098AD),
                                      size: 24.0,
                                    ),
                                  ),
                              ].divide(const SizedBox(width: 10.0)),
                            ),
                          ),
                        ),
                      ),
                      SingleChildScrollView(
                        primary: false,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: Container(
                                width: double.infinity,
                                height: 125.0,
                                decoration: const BoxDecoration(),
                                child: StreamBuilder<
                                    List<ExerciseCategoriesRecord>>(
                                  stream: queryExerciseCategoriesRecord(
                                    queryBuilder: (exerciseCategoriesRecord) =>
                                        exerciseCategoriesRecord
                                            .orderBy('priority'),
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
                                    List<ExerciseCategoriesRecord>
                                        listViewExerciseCategoriesRecordList =
                                        snapshot.data!;

                                    return ListView.separated(
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemCount:
                                          listViewExerciseCategoriesRecordList
                                              .length,
                                      separatorBuilder: (_, __) =>
                                          const SizedBox(width: 5.0),
                                      itemBuilder: (context, listViewIndex) {
                                        final listViewExerciseCategoriesRecord =
                                            listViewExerciseCategoriesRecordList[
                                                listViewIndex];
                                        return Container(
                                          width: 75.0,
                                          decoration: const BoxDecoration(),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'SEARCH_EXERCISE_Column_c62mkbip_ON_TAP');
                                              logFirebaseEvent(
                                                  'Column_clear_text_fields_pin_codes');
                                              safeSetState(() {
                                                _model
                                                    .searchTextBoxTextController
                                                    ?.clear();
                                              });
                                              logFirebaseEvent(
                                                  'Column_update_page_state');
                                              _model.exerciseFilter =
                                                  listViewExerciseCategoriesRecord
                                                      .code;
                                              _model.searchActive = false;
                                              safeSetState(() {});
                                            },
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Container(
                                                  width: 70.0,
                                                  height: 70.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .info,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16.0),
                                                    border: Border.all(
                                                      color: listViewExerciseCategoriesRecord.code ==
                                                              _model
                                                                  .exerciseFilter
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .success
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryBackground,
                                                      width: 2.0,
                                                    ),
                                                  ),
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(10.0),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        child: Image.network(
                                                          listViewExerciseCategoriesRecord
                                                              .imgUrl,
                                                          width: 35.0,
                                                          height: 35.0,
                                                          fit: BoxFit.cover,
                                                          alignment: const Alignment(
                                                              0.0, 0.0),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  functions.wrapText(
                                                      listViewExerciseCategoriesRecord
                                                          .name),
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Manrope',
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                              ].divide(const SizedBox(height: 4.0)),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                            if (!_model.searchActive)
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 0.0),
                                child: Builder(
                                  builder: (context) {
                                    final exerciseList =
                                        searchExerciseExercisesRecordList
                                            .sortedList(
                                                keyOf: (e) => e.name,
                                                desc: false)
                                            .where((e) => e.category.contains(
                                                _model.exerciseFilter))
                                            .toList();

                                    return ListView.separated(
                                      padding: EdgeInsets.zero,
                                      primary: false,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: exerciseList.length,
                                      separatorBuilder: (_, __) =>
                                          const SizedBox(height: 8.0),
                                      itemBuilder:
                                          (context, exerciseListIndex) {
                                        final exerciseListItem =
                                            exerciseList[exerciseListIndex];
                                        return InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'SEARCH_EXERCISE_Container_g6fa5hl4_ON_TA');
                                            if (exerciseListItem
                                                    .workoutType.name ==
                                                'functional') {
                                              logFirebaseEvent(
                                                  'Container_navigate_to');

                                              context.pushNamed(
                                                'FunctionalExercise',
                                                queryParameters: {
                                                  'exerciseDate':
                                                      serializeParam(
                                                    widget.selectedDate ?? functions
                                                            .getTodaysDate(),
                                                    ParamType.DateTime,
                                                  ),
                                                  'exercise': serializeParam(
                                                    exerciseListItem.reference,
                                                    ParamType.DocumentReference,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            } else if (exerciseListItem
                                                    .workoutType.name ==
                                                'weights') {
                                              logFirebaseEvent(
                                                  'Container_navigate_to');

                                              context.pushNamed(
                                                'WeightExercise',
                                                queryParameters: {
                                                  'exerciseDate':
                                                      serializeParam(
                                                    widget.selectedDate ?? functions
                                                            .getTodaysDate(),
                                                    ParamType.DateTime,
                                                  ),
                                                  'exercise': serializeParam(
                                                    exerciseListItem.reference,
                                                    ParamType.DocumentReference,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            } else if (exerciseListItem
                                                    .workoutType.name ==
                                                'plank') {
                                              logFirebaseEvent(
                                                  'Container_navigate_to');

                                              context.pushNamed(
                                                'PlankExercise',
                                                queryParameters: {
                                                  'exerciseDate':
                                                      serializeParam(
                                                    widget.selectedDate ?? functions
                                                            .getTodaysDate(),
                                                    ParamType.DateTime,
                                                  ),
                                                  'exercise': serializeParam(
                                                    exerciseListItem.reference,
                                                    ParamType.DocumentReference,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            } else if ((exerciseListItem
                                                        .workoutType.name ==
                                                    'kettlebell-functional') ||
                                                (exerciseListItem
                                                        .workoutType.name ==
                                                    'medicine-ball-functional')) {
                                              logFirebaseEvent(
                                                  'Container_navigate_to');

                                              context.pushNamed(
                                                'kettlebellMedicineBall',
                                                queryParameters: {
                                                  'exerciseDate':
                                                      serializeParam(
                                                    widget.selectedDate ?? functions
                                                            .getTodaysDate(),
                                                    ParamType.DateTime,
                                                  ),
                                                  'exercise': serializeParam(
                                                    exerciseListItem.reference,
                                                    ParamType.DocumentReference,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            } else if (exerciseListItem
                                                    .workoutType.name ==
                                                'strongman-exercises') {
                                              logFirebaseEvent(
                                                  'Container_navigate_to');

                                              context.pushNamed(
                                                'StrongmanExercise',
                                                queryParameters: {
                                                  'exerciseDate':
                                                      serializeParam(
                                                    widget.selectedDate ?? functions
                                                            .getTodaysDate(),
                                                    ParamType.DateTime,
                                                  ),
                                                  'exercise': serializeParam(
                                                    exerciseListItem.reference,
                                                    ParamType.DocumentReference,
                                                  ),
                                                  'distanceCovered':
                                                      serializeParam(
                                                    0,
                                                    ParamType.int,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            }
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: const Color(0xFFE6F5F7),
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                              border: Border.all(
                                                color: const Color(0xFF97D7E0),
                                              ),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 5.0, 0.0, 5.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Expanded(
                                                    flex: 8,
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child: Image.network(
                                                            functions.getImageUrl(
                                                                exerciseListItem
                                                                    .code,
                                                                FFAppState()
                                                                    .imageUrl
                                                                    .baseUrl,
                                                                FFAppState()
                                                                    .imageUrl
                                                                    .path,
                                                                FFAppState()
                                                                    .imageUrl
                                                                    .suffix),
                                                            width: 35.0,
                                                            height: 35.0,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                        Text(
                                                          exerciseListItem.name,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Manrope',
                                                                fontSize: 12.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                        ),
                                                      ].divide(const SizedBox(
                                                          width: 15.0)),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 1,
                                                    child: Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              1.0, 0.0),
                                                      child:
                                                          FlutterFlowIconButton(
                                                        borderColor:
                                                            Colors.transparent,
                                                        borderRadius: 30.0,
                                                        buttonSize: 40.0,
                                                        icon: Icon(
                                                          Icons
                                                              .arrow_forward_ios,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondary,
                                                          size: 20.0,
                                                        ),
                                                        onPressed: () async {
                                                          logFirebaseEvent(
                                                              'SEARCH_EXERCISE_arrow_forward_ios_ICN_ON');
                                                          if (exerciseListItem
                                                                  .workoutType
                                                                  .name ==
                                                              'functional') {
                                                            logFirebaseEvent(
                                                                'IconButton_navigate_to');

                                                            context.pushNamed(
                                                              'FunctionalExercise',
                                                              queryParameters: {
                                                                'exerciseDate':
                                                                    serializeParam(
                                                                  widget
                                                                          .selectedDate ?? functions
                                                                          .getTodaysDate(),
                                                                  ParamType
                                                                      .DateTime,
                                                                ),
                                                                'exercise':
                                                                    serializeParam(
                                                                  exerciseListItem
                                                                      .reference,
                                                                  ParamType
                                                                      .DocumentReference,
                                                                ),
                                                              }.withoutNulls,
                                                            );
                                                          } else if (exerciseListItem
                                                                  .workoutType
                                                                  .name ==
                                                              'weights') {
                                                            logFirebaseEvent(
                                                                'IconButton_navigate_to');

                                                            context.pushNamed(
                                                              'WeightExercise',
                                                              queryParameters: {
                                                                'exerciseDate':
                                                                    serializeParam(
                                                                  widget
                                                                          .selectedDate ?? functions
                                                                          .getTodaysDate(),
                                                                  ParamType
                                                                      .DateTime,
                                                                ),
                                                                'exercise':
                                                                    serializeParam(
                                                                  exerciseListItem
                                                                      .reference,
                                                                  ParamType
                                                                      .DocumentReference,
                                                                ),
                                                              }.withoutNulls,
                                                            );
                                                          } else if (exerciseListItem
                                                                  .workoutType
                                                                  .name ==
                                                              'plank') {
                                                            logFirebaseEvent(
                                                                'IconButton_navigate_to');

                                                            context.pushNamed(
                                                              'PlankExercise',
                                                              queryParameters: {
                                                                'exerciseDate':
                                                                    serializeParam(
                                                                  widget
                                                                          .selectedDate ?? functions
                                                                          .getTodaysDate(),
                                                                  ParamType
                                                                      .DateTime,
                                                                ),
                                                                'exercise':
                                                                    serializeParam(
                                                                  exerciseListItem
                                                                      .reference,
                                                                  ParamType
                                                                      .DocumentReference,
                                                                ),
                                                              }.withoutNulls,
                                                            );
                                                          } else if ((exerciseListItem
                                                                      .workoutType
                                                                      .name ==
                                                                  'kettlebell-functional') ||
                                                              (exerciseListItem
                                                                      .workoutType
                                                                      .name ==
                                                                  'medicine-ball-functional')) {
                                                            logFirebaseEvent(
                                                                'IconButton_navigate_to');

                                                            context.pushNamed(
                                                              'kettlebellMedicineBall',
                                                              queryParameters: {
                                                                'exerciseDate':
                                                                    serializeParam(
                                                                  widget
                                                                          .selectedDate ?? functions
                                                                          .getTodaysDate(),
                                                                  ParamType
                                                                      .DateTime,
                                                                ),
                                                                'exercise':
                                                                    serializeParam(
                                                                  exerciseListItem
                                                                      .reference,
                                                                  ParamType
                                                                      .DocumentReference,
                                                                ),
                                                              }.withoutNulls,
                                                            );
                                                          } else if (exerciseListItem
                                                                  .workoutType
                                                                  .name ==
                                                              'strongman-exercises') {
                                                            logFirebaseEvent(
                                                                'IconButton_navigate_to');

                                                            context.pushNamed(
                                                              'StrongmanExercise',
                                                              queryParameters: {
                                                                'exerciseDate':
                                                                    serializeParam(
                                                                  widget
                                                                          .selectedDate ?? functions
                                                                          .getTodaysDate(),
                                                                  ParamType
                                                                      .DateTime,
                                                                ),
                                                                'exercise':
                                                                    serializeParam(
                                                                  exerciseListItem
                                                                      .reference,
                                                                  ParamType
                                                                      .DocumentReference,
                                                                ),
                                                                'distanceCovered':
                                                                    serializeParam(
                                                                  0,
                                                                  ParamType.int,
                                                                ),
                                                              }.withoutNulls,
                                                            );
                                                          }
                                                        },
                                                      ),
                                                    ),
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
                              ),
                            if (_model.searchActive)
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 20.0, 0.0, 0.0),
                                child: Builder(
                                  builder: (context) {
                                    final searchReults =
                                        _model.simpleSearchResults.toList();

                                    return ListView.separated(
                                      padding: EdgeInsets.zero,
                                      primary: false,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: searchReults.length,
                                      separatorBuilder: (_, __) =>
                                          const SizedBox(height: 8.0),
                                      itemBuilder:
                                          (context, searchReultsIndex) {
                                        final searchReultsItem =
                                            searchReults[searchReultsIndex];
                                        return InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'SEARCH_EXERCISE_Container_wgkx30j3_ON_TA');
                                            if (searchReultsItem
                                                    .workoutType.name ==
                                                'functional') {
                                              logFirebaseEvent(
                                                  'Container_navigate_to');

                                              context.pushNamed(
                                                'FunctionalExercise',
                                                queryParameters: {
                                                  'exerciseDate':
                                                      serializeParam(
                                                    widget.selectedDate ?? functions
                                                            .getTodaysDate(),
                                                    ParamType.DateTime,
                                                  ),
                                                  'exercise': serializeParam(
                                                    searchReultsItem.reference,
                                                    ParamType.DocumentReference,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            } else if (searchReultsItem
                                                    .workoutType.name ==
                                                'weights') {
                                              logFirebaseEvent(
                                                  'Container_navigate_to');

                                              context.pushNamed(
                                                'WeightExercise',
                                                queryParameters: {
                                                  'exerciseDate':
                                                      serializeParam(
                                                    widget.selectedDate ?? functions
                                                            .getTodaysDate(),
                                                    ParamType.DateTime,
                                                  ),
                                                  'exercise': serializeParam(
                                                    searchReultsItem.reference,
                                                    ParamType.DocumentReference,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            } else if (searchReultsItem
                                                    .workoutType.name ==
                                                'plank') {
                                              logFirebaseEvent(
                                                  'Container_navigate_to');

                                              context.pushNamed(
                                                'PlankExercise',
                                                queryParameters: {
                                                  'exerciseDate':
                                                      serializeParam(
                                                    widget.selectedDate ?? functions
                                                            .getTodaysDate(),
                                                    ParamType.DateTime,
                                                  ),
                                                  'exercise': serializeParam(
                                                    searchReultsItem.reference,
                                                    ParamType.DocumentReference,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            } else if ((searchReultsItem
                                                        .workoutType.name ==
                                                    'kettlebell-functional') ||
                                                (searchReultsItem
                                                        .workoutType.name ==
                                                    'medicine-ball-functional')) {
                                              logFirebaseEvent(
                                                  'Container_navigate_to');

                                              context.pushNamed(
                                                'kettlebellMedicineBall',
                                                queryParameters: {
                                                  'exerciseDate':
                                                      serializeParam(
                                                    widget.selectedDate ?? functions
                                                            .getTodaysDate(),
                                                    ParamType.DateTime,
                                                  ),
                                                  'exercise': serializeParam(
                                                    searchReultsItem.reference,
                                                    ParamType.DocumentReference,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            } else if (searchReultsItem
                                                    .workoutType.name ==
                                                'strongman-exercises') {
                                              logFirebaseEvent(
                                                  'Container_navigate_to');

                                              context.pushNamed(
                                                'StrongmanExercise',
                                                queryParameters: {
                                                  'exerciseDate':
                                                      serializeParam(
                                                    widget.selectedDate ?? functions
                                                            .getTodaysDate(),
                                                    ParamType.DateTime,
                                                  ),
                                                  'exercise': serializeParam(
                                                    searchReultsItem.reference,
                                                    ParamType.DocumentReference,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            }
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: const Color(0xFFE6F5F7),
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                              border: Border.all(
                                                color: const Color(0xFF97D7E0),
                                              ),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 5.0, 0.0, 5.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Expanded(
                                                    flex: 8,
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child: Image.network(
                                                            functions.getImageUrl(
                                                                searchReultsItem
                                                                    .code,
                                                                FFAppState()
                                                                    .imageUrl
                                                                    .baseUrl,
                                                                FFAppState()
                                                                    .imageUrl
                                                                    .path,
                                                                FFAppState()
                                                                    .imageUrl
                                                                    .suffix),
                                                            width: 35.0,
                                                            height: 35.0,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                        Text(
                                                          searchReultsItem.name,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Manrope',
                                                                fontSize: 12.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                        ),
                                                      ].divide(const SizedBox(
                                                          width: 15.0)),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 1,
                                                    child: Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              1.0, 0.0),
                                                      child:
                                                          FlutterFlowIconButton(
                                                        borderColor:
                                                            Colors.transparent,
                                                        borderRadius: 30.0,
                                                        buttonSize: 40.0,
                                                        icon: Icon(
                                                          Icons
                                                              .arrow_forward_ios,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondary,
                                                          size: 20.0,
                                                        ),
                                                        onPressed: () {
                                                          print(
                                                              'IconButton pressed ...');
                                                        },
                                                      ),
                                                    ),
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
                              ),
                          ],
                        ),
                      ),
                    ].divide(const SizedBox(height: 10.0)),
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
