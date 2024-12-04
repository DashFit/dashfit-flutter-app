// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ExerciseFormDataStruct extends FFFirebaseStruct {
  ExerciseFormDataStruct({
    int? repetitions,
    int? setCount,
    String? weightUnit,
    int? timeDuration,
    int? distanceCovered,
    double? additionalWeight,
    double? weightLifted,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _repetitions = repetitions,
        _setCount = setCount,
        _weightUnit = weightUnit,
        _timeDuration = timeDuration,
        _distanceCovered = distanceCovered,
        _additionalWeight = additionalWeight,
        _weightLifted = weightLifted,
        super(firestoreUtilData);

  // "repetitions" field.
  int? _repetitions;
  int get repetitions => _repetitions ?? 0;
  set repetitions(int? val) => _repetitions = val;

  void incrementRepetitions(int amount) => repetitions = repetitions + amount;

  bool hasRepetitions() => _repetitions != null;

  // "setCount" field.
  int? _setCount;
  int get setCount => _setCount ?? 0;
  set setCount(int? val) => _setCount = val;

  void incrementSetCount(int amount) => setCount = setCount + amount;

  bool hasSetCount() => _setCount != null;

  // "weightUnit" field.
  String? _weightUnit;
  String get weightUnit => _weightUnit ?? '';
  set weightUnit(String? val) => _weightUnit = val;

  bool hasWeightUnit() => _weightUnit != null;

  // "timeDuration" field.
  int? _timeDuration;
  int get timeDuration => _timeDuration ?? 0;
  set timeDuration(int? val) => _timeDuration = val;

  void incrementTimeDuration(int amount) =>
      timeDuration = timeDuration + amount;

  bool hasTimeDuration() => _timeDuration != null;

  // "distanceCovered" field.
  int? _distanceCovered;
  int get distanceCovered => _distanceCovered ?? 0;
  set distanceCovered(int? val) => _distanceCovered = val;

  void incrementDistanceCovered(int amount) =>
      distanceCovered = distanceCovered + amount;

  bool hasDistanceCovered() => _distanceCovered != null;

  // "additionalWeight" field.
  double? _additionalWeight;
  double get additionalWeight => _additionalWeight ?? 0.0;
  set additionalWeight(double? val) => _additionalWeight = val;

  void incrementAdditionalWeight(double amount) =>
      additionalWeight = additionalWeight + amount;

  bool hasAdditionalWeight() => _additionalWeight != null;

  // "weightLifted" field.
  double? _weightLifted;
  double get weightLifted => _weightLifted ?? 0.0;
  set weightLifted(double? val) => _weightLifted = val;

  void incrementWeightLifted(double amount) =>
      weightLifted = weightLifted + amount;

  bool hasWeightLifted() => _weightLifted != null;

  static ExerciseFormDataStruct fromMap(Map<String, dynamic> data) =>
      ExerciseFormDataStruct(
        repetitions: castToType<int>(data['repetitions']),
        setCount: castToType<int>(data['setCount']),
        weightUnit: data['weightUnit'] as String?,
        timeDuration: castToType<int>(data['timeDuration']),
        distanceCovered: castToType<int>(data['distanceCovered']),
        additionalWeight: castToType<double>(data['additionalWeight']),
        weightLifted: castToType<double>(data['weightLifted']),
      );

  static ExerciseFormDataStruct? maybeFromMap(dynamic data) => data is Map
      ? ExerciseFormDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'repetitions': _repetitions,
        'setCount': _setCount,
        'weightUnit': _weightUnit,
        'timeDuration': _timeDuration,
        'distanceCovered': _distanceCovered,
        'additionalWeight': _additionalWeight,
        'weightLifted': _weightLifted,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'repetitions': serializeParam(
          _repetitions,
          ParamType.int,
        ),
        'setCount': serializeParam(
          _setCount,
          ParamType.int,
        ),
        'weightUnit': serializeParam(
          _weightUnit,
          ParamType.String,
        ),
        'timeDuration': serializeParam(
          _timeDuration,
          ParamType.int,
        ),
        'distanceCovered': serializeParam(
          _distanceCovered,
          ParamType.int,
        ),
        'additionalWeight': serializeParam(
          _additionalWeight,
          ParamType.double,
        ),
        'weightLifted': serializeParam(
          _weightLifted,
          ParamType.double,
        ),
      }.withoutNulls;

  static ExerciseFormDataStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ExerciseFormDataStruct(
        repetitions: deserializeParam(
          data['repetitions'],
          ParamType.int,
          false,
        ),
        setCount: deserializeParam(
          data['setCount'],
          ParamType.int,
          false,
        ),
        weightUnit: deserializeParam(
          data['weightUnit'],
          ParamType.String,
          false,
        ),
        timeDuration: deserializeParam(
          data['timeDuration'],
          ParamType.int,
          false,
        ),
        distanceCovered: deserializeParam(
          data['distanceCovered'],
          ParamType.int,
          false,
        ),
        additionalWeight: deserializeParam(
          data['additionalWeight'],
          ParamType.double,
          false,
        ),
        weightLifted: deserializeParam(
          data['weightLifted'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'ExerciseFormDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ExerciseFormDataStruct &&
        repetitions == other.repetitions &&
        setCount == other.setCount &&
        weightUnit == other.weightUnit &&
        timeDuration == other.timeDuration &&
        distanceCovered == other.distanceCovered &&
        additionalWeight == other.additionalWeight &&
        weightLifted == other.weightLifted;
  }

  @override
  int get hashCode => const ListEquality().hash([
        repetitions,
        setCount,
        weightUnit,
        timeDuration,
        distanceCovered,
        additionalWeight,
        weightLifted
      ]);
}

ExerciseFormDataStruct createExerciseFormDataStruct({
  int? repetitions,
  int? setCount,
  String? weightUnit,
  int? timeDuration,
  int? distanceCovered,
  double? additionalWeight,
  double? weightLifted,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ExerciseFormDataStruct(
      repetitions: repetitions,
      setCount: setCount,
      weightUnit: weightUnit,
      timeDuration: timeDuration,
      distanceCovered: distanceCovered,
      additionalWeight: additionalWeight,
      weightLifted: weightLifted,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ExerciseFormDataStruct? updateExerciseFormDataStruct(
  ExerciseFormDataStruct? exerciseFormData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    exerciseFormData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addExerciseFormDataStructData(
  Map<String, dynamic> firestoreData,
  ExerciseFormDataStruct? exerciseFormData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (exerciseFormData == null) {
    return;
  }
  if (exerciseFormData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && exerciseFormData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final exerciseFormDataData =
      getExerciseFormDataFirestoreData(exerciseFormData, forFieldValue);
  final nestedData =
      exerciseFormDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = exerciseFormData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getExerciseFormDataFirestoreData(
  ExerciseFormDataStruct? exerciseFormData, [
  bool forFieldValue = false,
]) {
  if (exerciseFormData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(exerciseFormData.toMap());

  // Add any Firestore field values
  exerciseFormData.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getExerciseFormDataListFirestoreData(
  List<ExerciseFormDataStruct>? exerciseFormDatas,
) =>
    exerciseFormDatas
        ?.map((e) => getExerciseFormDataFirestoreData(e, true))
        .toList() ??
    [];
