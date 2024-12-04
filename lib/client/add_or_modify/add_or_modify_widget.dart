import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'add_or_modify_model.dart';
export 'add_or_modify_model.dart';

class AddOrModifyWidget extends StatefulWidget {
  const AddOrModifyWidget({
    super.key,
    required this.exerciseScoresData,
  });

  final ExerciseScoresDataRecord? exerciseScoresData;

  @override
  State<AddOrModifyWidget> createState() => _AddOrModifyWidgetState();
}

class _AddOrModifyWidgetState extends State<AddOrModifyWidget> {
  late AddOrModifyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddOrModifyModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(16.0),
        shape: BoxShape.rectangle,
      ),
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: const AlignmentDirectional(1.0, 1.0),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 10.0, 0.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    logFirebaseEvent('ADD_OR_MODIFY_COMP_Icon_wpd3qeab_ON_TAP');
                    logFirebaseEvent('Icon_close_dialog_drawer_etc');
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.close,
                    color: Color(0xFF0098AD),
                    size: 20.0,
                  ),
                ),
              ),
            ),
            FFButtonWidget(
              onPressed: () async {
                logFirebaseEvent('ADD_OR_MODIFY_COMP_MODIFY_BTN_ON_TAP');
                if (widget.exerciseScoresData?.workoutType == 'functional') {
                  logFirebaseEvent('Button_navigate_to');

                  context.pushNamed(
                    'FunctionalExercise',
                    queryParameters: {
                      'exerciseDate': serializeParam(
                        widget.exerciseScoresData?.date,
                        ParamType.DateTime,
                      ),
                      'exercise': serializeParam(
                        widget.exerciseScoresData?.exercisesReference,
                        ParamType.DocumentReference,
                      ),
                      'additionalWeight': serializeParam(
                        widget.exerciseScoresData?.formData.additionalWeight,
                        ParamType.double,
                      ),
                      'repetitions': serializeParam(
                        widget.exerciseScoresData?.formData.repetitions,
                        ParamType.int,
                      ),
                      'sets': serializeParam(
                        widget.exerciseScoresData?.formData.setCount,
                        ParamType.int,
                      ),
                      'oldExerciseScore': serializeParam(
                        widget.exerciseScoresData?.reference,
                        ParamType.DocumentReference,
                      ),
                      'weightUnit': serializeParam(
                        widget.exerciseScoresData?.formData.weightUnit,
                        ParamType.String,
                      ),
                    }.withoutNulls,
                  );
                } else if (widget.exerciseScoresData?.workoutType ==
                    'weights') {
                  logFirebaseEvent('Button_navigate_to');

                  context.pushNamed(
                    'WeightExercise',
                    queryParameters: {
                      'exerciseDate': serializeParam(
                        widget.exerciseScoresData?.date,
                        ParamType.DateTime,
                      ),
                      'exercise': serializeParam(
                        widget.exerciseScoresData?.exercisesReference,
                        ParamType.DocumentReference,
                      ),
                      'weightLifted': serializeParam(
                        widget.exerciseScoresData?.formData.weightLifted,
                        ParamType.double,
                      ),
                      'repetitions': serializeParam(
                        widget.exerciseScoresData?.formData.repetitions,
                        ParamType.int,
                      ),
                      'sets': serializeParam(
                        widget.exerciseScoresData?.formData.setCount,
                        ParamType.int,
                      ),
                      'oldExerciseScore': serializeParam(
                        widget.exerciseScoresData?.reference,
                        ParamType.DocumentReference,
                      ),
                      'weightUnit': serializeParam(
                        widget.exerciseScoresData?.formData.weightUnit,
                        ParamType.String,
                      ),
                    }.withoutNulls,
                  );
                } else if (widget.exerciseScoresData?.workoutType == 'plank') {
                  logFirebaseEvent('Button_navigate_to');

                  context.pushNamed(
                    'PlankExercise',
                    queryParameters: {
                      'exerciseDate': serializeParam(
                        widget.exerciseScoresData?.date,
                        ParamType.DateTime,
                      ),
                      'exercise': serializeParam(
                        widget.exerciseScoresData?.exercisesReference,
                        ParamType.DocumentReference,
                      ),
                      'additionalWeight': serializeParam(
                        widget.exerciseScoresData?.formData.additionalWeight,
                        ParamType.double,
                      ),
                      'durations': serializeParam(
                        widget.exerciseScoresData?.formData.timeDuration,
                        ParamType.int,
                      ),
                      'sets': serializeParam(
                        widget.exerciseScoresData?.formData.setCount,
                        ParamType.int,
                      ),
                      'oldExerciseScore': serializeParam(
                        widget.exerciseScoresData?.reference,
                        ParamType.DocumentReference,
                      ),
                      'weightUnit': serializeParam(
                        widget.exerciseScoresData?.formData.weightUnit,
                        ParamType.String,
                      ),
                    }.withoutNulls,
                  );
                } else if ((widget.exerciseScoresData?.workoutType ==
                        'kettlebell') ||
                    (widget.exerciseScoresData?.workoutType ==
                        'medicine-ball-functional')) {
                  logFirebaseEvent('Button_navigate_to');

                  context.pushNamed(
                    'kettlebellMedicineBall',
                    queryParameters: {
                      'exerciseDate': serializeParam(
                        widget.exerciseScoresData?.date,
                        ParamType.DateTime,
                      ),
                      'exercise': serializeParam(
                        widget.exerciseScoresData?.exercisesReference,
                        ParamType.DocumentReference,
                      ),
                      'weightLifted': serializeParam(
                        widget.exerciseScoresData?.formData.weightLifted,
                        ParamType.double,
                      ),
                      'repetitions': serializeParam(
                        widget.exerciseScoresData?.formData.repetitions,
                        ParamType.int,
                      ),
                      'sets': serializeParam(
                        widget.exerciseScoresData?.formData.setCount,
                        ParamType.int,
                      ),
                      'oldExerciseScore': serializeParam(
                        widget.exerciseScoresData?.reference,
                        ParamType.DocumentReference,
                      ),
                      'weightUnit': serializeParam(
                        widget.exerciseScoresData?.formData.weightUnit,
                        ParamType.String,
                      ),
                    }.withoutNulls,
                  );
                } else if (widget.exerciseScoresData?.workoutType ==
                    'strongman-exercises') {
                  logFirebaseEvent('Button_navigate_to');

                  context.pushNamed(
                    'StrongmanExercise',
                    queryParameters: {
                      'exerciseDate': serializeParam(
                        widget.exerciseScoresData?.date,
                        ParamType.DateTime,
                      ),
                      'exercise': serializeParam(
                        widget.exerciseScoresData?.exercisesReference,
                        ParamType.DocumentReference,
                      ),
                      'additionalWeight': serializeParam(
                        widget.exerciseScoresData?.formData.additionalWeight,
                        ParamType.double,
                      ),
                      'distanceCovered': serializeParam(
                        widget.exerciseScoresData?.formData.distanceCovered,
                        ParamType.int,
                      ),
                      'sets': serializeParam(
                        widget.exerciseScoresData?.formData.setCount,
                        ParamType.int,
                      ),
                      'oldExerciseScore': serializeParam(
                        widget.exerciseScoresData?.reference,
                        ParamType.DocumentReference,
                      ),
                      'weightUnit': serializeParam(
                        widget.exerciseScoresData?.formData.weightUnit,
                        ParamType.String,
                      ),
                    }.withoutNulls,
                  );
                }

                logFirebaseEvent('Button_dismiss_dialog');
                Navigator.pop(context);
              },
              text: 'Modify',
              icon: const Icon(
                Icons.edit,
                color: Color(0xFF40B1BF),
                size: 24.0,
              ),
              options: FFButtonOptions(
                width: double.infinity,
                height: 40.0,
                padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: const Color(0xFFE6F7FC),
                textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Manrope',
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w600,
                    ),
                elevation: 3.0,
                borderSide: const BorderSide(
                  color: Colors.transparent,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            FFButtonWidget(
              onPressed: () async {
                logFirebaseEvent('ADD_OR_MODIFY_COMP_DELETE_BTN_ON_TAP');
                // Find day score data
                logFirebaseEvent('Button_Finddayscoredata');
                _model.dayScoreDataResponse =
                    await queryDayScoresDataRecordOnce(
                  parent: FFAppState().userDataReference,
                  queryBuilder: (dayScoresDataRecord) =>
                      dayScoresDataRecord.where(
                    'date',
                    isEqualTo: functions.convertDateTimeToDate(
                        widget.exerciseScoresData!.date!),
                  ),
                  singleRecord: true,
                ).then((s) => s.firstOrNull);
                // Minus muscles score from all score list
                logFirebaseEvent('Button_Minusmusclesscorefromallscorelist');
                _model.removeMusclesScoreResponse =
                    await actions.removeMusclesScore(
                  _model.dayScoreDataResponse!.musclesScore.toList(),
                  widget.exerciseScoresData!.muscles.toList(),
                );
                // Update new muscles score in all day scores
                logFirebaseEvent('Button_Updatenewmusclesscoreinalldayscor');

                await _model.dayScoreDataResponse!.reference.update({
                  ...createDayScoresDataRecordData(
                    totalScore: valueOrDefault<double>(
                      _model.removeMusclesScoreResponse?.totalScore,
                      0.0,
                    ),
                  ),
                  ...mapToFirestore(
                    {
                      'musclesScore': getMusclesListFirestoreData(
                        _model.removeMusclesScoreResponse?.muscles,
                      ),
                    },
                  ),
                });
                // Delete the score muscles
                logFirebaseEvent('Button_Deletethescoremuscles');
                await widget.exerciseScoresData!.reference.delete();
                logFirebaseEvent('Button_close_dialog_drawer_etc');
                Navigator.pop(context);

                safeSetState(() {});
              },
              text: 'Delete',
              icon: const Icon(
                Icons.delete,
                color: Color(0xFFD42B31),
                size: 24.0,
              ),
              options: FFButtonOptions(
                width: double.infinity,
                height: 40.0,
                padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: const Color(0xFFE6F7FC),
                textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Manrope',
                      color: const Color(0xFFD42B31),
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w600,
                    ),
                elevation: 3.0,
                borderSide: const BorderSide(
                  color: Colors.transparent,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ].divide(const SizedBox(height: 20.0)),
        ),
      ),
    );
  }
}
