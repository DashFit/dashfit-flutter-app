// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class DashboardDayScoresStruct extends FFFirebaseStruct {
  DashboardDayScoresStruct({
    DateTime? date,
    double? score,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _date = date,
        _score = score,
        super(firestoreUtilData);

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  set date(DateTime? val) => _date = val;

  bool hasDate() => _date != null;

  // "score" field.
  double? _score;
  double get score => _score ?? 0.0;
  set score(double? val) => _score = val;

  void incrementScore(double amount) => score = score + amount;

  bool hasScore() => _score != null;

  static DashboardDayScoresStruct fromMap(Map<String, dynamic> data) =>
      DashboardDayScoresStruct(
        date: data['date'] as DateTime?,
        score: castToType<double>(data['score']),
      );

  static DashboardDayScoresStruct? maybeFromMap(dynamic data) => data is Map
      ? DashboardDayScoresStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'date': _date,
        'score': _score,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'date': serializeParam(
          _date,
          ParamType.DateTime,
        ),
        'score': serializeParam(
          _score,
          ParamType.double,
        ),
      }.withoutNulls;

  static DashboardDayScoresStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      DashboardDayScoresStruct(
        date: deserializeParam(
          data['date'],
          ParamType.DateTime,
          false,
        ),
        score: deserializeParam(
          data['score'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'DashboardDayScoresStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DashboardDayScoresStruct &&
        date == other.date &&
        score == other.score;
  }

  @override
  int get hashCode => const ListEquality().hash([date, score]);
}

DashboardDayScoresStruct createDashboardDayScoresStruct({
  DateTime? date,
  double? score,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DashboardDayScoresStruct(
      date: date,
      score: score,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DashboardDayScoresStruct? updateDashboardDayScoresStruct(
  DashboardDayScoresStruct? dashboardDayScores, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    dashboardDayScores
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDashboardDayScoresStructData(
  Map<String, dynamic> firestoreData,
  DashboardDayScoresStruct? dashboardDayScores,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (dashboardDayScores == null) {
    return;
  }
  if (dashboardDayScores.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && dashboardDayScores.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final dashboardDayScoresData =
      getDashboardDayScoresFirestoreData(dashboardDayScores, forFieldValue);
  final nestedData =
      dashboardDayScoresData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      dashboardDayScores.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDashboardDayScoresFirestoreData(
  DashboardDayScoresStruct? dashboardDayScores, [
  bool forFieldValue = false,
]) {
  if (dashboardDayScores == null) {
    return {};
  }
  final firestoreData = mapToFirestore(dashboardDayScores.toMap());

  // Add any Firestore field values
  dashboardDayScores.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDashboardDayScoresListFirestoreData(
  List<DashboardDayScoresStruct>? dashboardDayScoress,
) =>
    dashboardDayScoress
        ?.map((e) => getDashboardDayScoresFirestoreData(e, true))
        .toList() ??
    [];
