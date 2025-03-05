// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class WorkoutTypeStruct extends FFFirebaseStruct {
  WorkoutTypeStruct({
    String? name,
    double? weightage,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _weightage = weightage,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "weightage" field.
  double? _weightage;
  double get weightage => _weightage ?? 0.0;
  set weightage(double? val) => _weightage = val;

  void incrementWeightage(double amount) => weightage = weightage + amount;

  bool hasWeightage() => _weightage != null;

  static WorkoutTypeStruct fromMap(Map<String, dynamic> data) =>
      WorkoutTypeStruct(
        name: data['name'] as String?,
        weightage: castToType<double>(data['weightage']),
      );

  static WorkoutTypeStruct? maybeFromMap(dynamic data) => data is Map
      ? WorkoutTypeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'weightage': _weightage,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'weightage': serializeParam(
          _weightage,
          ParamType.double,
        ),
      }.withoutNulls;

  static WorkoutTypeStruct fromSerializableMap(Map<String, dynamic> data) =>
      WorkoutTypeStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        weightage: deserializeParam(
          data['weightage'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'WorkoutTypeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is WorkoutTypeStruct &&
        name == other.name &&
        weightage == other.weightage;
  }

  @override
  int get hashCode => const ListEquality().hash([name, weightage]);
}

WorkoutTypeStruct createWorkoutTypeStruct({
  String? name,
  double? weightage,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    WorkoutTypeStruct(
      name: name,
      weightage: weightage,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

WorkoutTypeStruct? updateWorkoutTypeStruct(
  WorkoutTypeStruct? workoutType, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    workoutType
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addWorkoutTypeStructData(
  Map<String, dynamic> firestoreData,
  WorkoutTypeStruct? workoutType,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (workoutType == null) {
    return;
  }
  if (workoutType.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && workoutType.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final workoutTypeData =
      getWorkoutTypeFirestoreData(workoutType, forFieldValue);
  final nestedData =
      workoutTypeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = workoutType.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getWorkoutTypeFirestoreData(
  WorkoutTypeStruct? workoutType, [
  bool forFieldValue = false,
]) {
  if (workoutType == null) {
    return {};
  }
  final firestoreData = mapToFirestore(workoutType.toMap());

  // Add any Firestore field values
  workoutType.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getWorkoutTypeListFirestoreData(
  List<WorkoutTypeStruct>? workoutTypes,
) =>
    workoutTypes?.map((e) => getWorkoutTypeFirestoreData(e, true)).toList() ??
    [];
