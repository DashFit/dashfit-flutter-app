// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ResponseModifyMusclesScoreStruct extends FFFirebaseStruct {
  ResponseModifyMusclesScoreStruct({
    double? totalScore,
    List<MusclesStruct>? muscles,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _totalScore = totalScore,
        _muscles = muscles,
        super(firestoreUtilData);

  // "totalScore" field.
  double? _totalScore;
  double get totalScore => _totalScore ?? 0.0;
  set totalScore(double? val) => _totalScore = val;

  void incrementTotalScore(double amount) => totalScore = totalScore + amount;

  bool hasTotalScore() => _totalScore != null;

  // "muscles" field.
  List<MusclesStruct>? _muscles;
  List<MusclesStruct> get muscles => _muscles ?? const [];
  set muscles(List<MusclesStruct>? val) => _muscles = val;

  void updateMuscles(Function(List<MusclesStruct>) updateFn) {
    updateFn(_muscles ??= []);
  }

  bool hasMuscles() => _muscles != null;

  static ResponseModifyMusclesScoreStruct fromMap(Map<String, dynamic> data) =>
      ResponseModifyMusclesScoreStruct(
        totalScore: castToType<double>(data['totalScore']),
        muscles: getStructList(
          data['muscles'],
          MusclesStruct.fromMap,
        ),
      );

  static ResponseModifyMusclesScoreStruct? maybeFromMap(dynamic data) => data
          is Map
      ? ResponseModifyMusclesScoreStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'totalScore': _totalScore,
        'muscles': _muscles?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'totalScore': serializeParam(
          _totalScore,
          ParamType.double,
        ),
        'muscles': serializeParam(
          _muscles,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static ResponseModifyMusclesScoreStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ResponseModifyMusclesScoreStruct(
        totalScore: deserializeParam(
          data['totalScore'],
          ParamType.double,
          false,
        ),
        muscles: deserializeStructParam<MusclesStruct>(
          data['muscles'],
          ParamType.DataStruct,
          true,
          structBuilder: MusclesStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'ResponseModifyMusclesScoreStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ResponseModifyMusclesScoreStruct &&
        totalScore == other.totalScore &&
        listEquality.equals(muscles, other.muscles);
  }

  @override
  int get hashCode => const ListEquality().hash([totalScore, muscles]);
}

ResponseModifyMusclesScoreStruct createResponseModifyMusclesScoreStruct({
  double? totalScore,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ResponseModifyMusclesScoreStruct(
      totalScore: totalScore,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ResponseModifyMusclesScoreStruct? updateResponseModifyMusclesScoreStruct(
  ResponseModifyMusclesScoreStruct? responseModifyMusclesScore, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    responseModifyMusclesScore
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addResponseModifyMusclesScoreStructData(
  Map<String, dynamic> firestoreData,
  ResponseModifyMusclesScoreStruct? responseModifyMusclesScore,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (responseModifyMusclesScore == null) {
    return;
  }
  if (responseModifyMusclesScore.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      responseModifyMusclesScore.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final responseModifyMusclesScoreData =
      getResponseModifyMusclesScoreFirestoreData(
          responseModifyMusclesScore, forFieldValue);
  final nestedData = responseModifyMusclesScoreData
      .map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      responseModifyMusclesScore.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getResponseModifyMusclesScoreFirestoreData(
  ResponseModifyMusclesScoreStruct? responseModifyMusclesScore, [
  bool forFieldValue = false,
]) {
  if (responseModifyMusclesScore == null) {
    return {};
  }
  final firestoreData = mapToFirestore(responseModifyMusclesScore.toMap());

  // Add any Firestore field values
  responseModifyMusclesScore.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getResponseModifyMusclesScoreListFirestoreData(
  List<ResponseModifyMusclesScoreStruct>? responseModifyMusclesScores,
) =>
    responseModifyMusclesScores
        ?.map((e) => getResponseModifyMusclesScoreFirestoreData(e, true))
        .toList() ??
    [];
