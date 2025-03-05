// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ResponseExerciseScoresStruct extends FFFirebaseStruct {
  ResponseExerciseScoresStruct({
    double? totalScore,
    List<MusclesStruct>? muscles,
    String? name,
    String? code,
    ExerciseFormDataStruct? formData,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _totalScore = totalScore,
        _muscles = muscles,
        _name = name,
        _code = code,
        _formData = formData,
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

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "code" field.
  String? _code;
  String get code => _code ?? '';
  set code(String? val) => _code = val;

  bool hasCode() => _code != null;

  // "formData" field.
  ExerciseFormDataStruct? _formData;
  ExerciseFormDataStruct get formData => _formData ?? ExerciseFormDataStruct();
  set formData(ExerciseFormDataStruct? val) => _formData = val;

  void updateFormData(Function(ExerciseFormDataStruct) updateFn) {
    updateFn(_formData ??= ExerciseFormDataStruct());
  }

  bool hasFormData() => _formData != null;

  static ResponseExerciseScoresStruct fromMap(Map<String, dynamic> data) =>
      ResponseExerciseScoresStruct(
        totalScore: castToType<double>(data['totalScore']),
        muscles: getStructList(
          data['muscles'],
          MusclesStruct.fromMap,
        ),
        name: data['name'] as String?,
        code: data['code'] as String?,
        formData: ExerciseFormDataStruct.maybeFromMap(data['formData']),
      );

  static ResponseExerciseScoresStruct? maybeFromMap(dynamic data) => data is Map
      ? ResponseExerciseScoresStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'totalScore': _totalScore,
        'muscles': _muscles?.map((e) => e.toMap()).toList(),
        'name': _name,
        'code': _code,
        'formData': _formData?.toMap(),
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
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'code': serializeParam(
          _code,
          ParamType.String,
        ),
        'formData': serializeParam(
          _formData,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static ResponseExerciseScoresStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ResponseExerciseScoresStruct(
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
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        code: deserializeParam(
          data['code'],
          ParamType.String,
          false,
        ),
        formData: deserializeStructParam(
          data['formData'],
          ParamType.DataStruct,
          false,
          structBuilder: ExerciseFormDataStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'ResponseExerciseScoresStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ResponseExerciseScoresStruct &&
        totalScore == other.totalScore &&
        listEquality.equals(muscles, other.muscles) &&
        name == other.name &&
        code == other.code &&
        formData == other.formData;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([totalScore, muscles, name, code, formData]);
}

ResponseExerciseScoresStruct createResponseExerciseScoresStruct({
  double? totalScore,
  String? name,
  String? code,
  ExerciseFormDataStruct? formData,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ResponseExerciseScoresStruct(
      totalScore: totalScore,
      name: name,
      code: code,
      formData:
          formData ?? (clearUnsetFields ? ExerciseFormDataStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ResponseExerciseScoresStruct? updateResponseExerciseScoresStruct(
  ResponseExerciseScoresStruct? responseExerciseScores, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    responseExerciseScores
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addResponseExerciseScoresStructData(
  Map<String, dynamic> firestoreData,
  ResponseExerciseScoresStruct? responseExerciseScores,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (responseExerciseScores == null) {
    return;
  }
  if (responseExerciseScores.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      responseExerciseScores.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final responseExerciseScoresData = getResponseExerciseScoresFirestoreData(
      responseExerciseScores, forFieldValue);
  final nestedData =
      responseExerciseScoresData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      responseExerciseScores.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getResponseExerciseScoresFirestoreData(
  ResponseExerciseScoresStruct? responseExerciseScores, [
  bool forFieldValue = false,
]) {
  if (responseExerciseScores == null) {
    return {};
  }
  final firestoreData = mapToFirestore(responseExerciseScores.toMap());

  // Handle nested data for "formData" field.
  addExerciseFormDataStructData(
    firestoreData,
    responseExerciseScores.hasFormData()
        ? responseExerciseScores.formData
        : null,
    'formData',
    forFieldValue,
  );

  // Add any Firestore field values
  responseExerciseScores.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getResponseExerciseScoresListFirestoreData(
  List<ResponseExerciseScoresStruct>? responseExerciseScoress,
) =>
    responseExerciseScoress
        ?.map((e) => getResponseExerciseScoresFirestoreData(e, true))
        .toList() ??
    [];
