// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class MusclesPercentageStruct extends FFFirebaseStruct {
  MusclesPercentageStruct({
    String? name,
    double? value,
    String? code,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _value = value,
        _code = code,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "value" field.
  double? _value;
  double get value => _value ?? 0.0;
  set value(double? val) => _value = val;

  void incrementValue(double amount) => value = value + amount;

  bool hasValue() => _value != null;

  // "code" field.
  String? _code;
  String get code => _code ?? '';
  set code(String? val) => _code = val;

  bool hasCode() => _code != null;

  static MusclesPercentageStruct fromMap(Map<String, dynamic> data) =>
      MusclesPercentageStruct(
        name: data['name'] as String?,
        value: castToType<double>(data['value']),
        code: data['code'] as String?,
      );

  static MusclesPercentageStruct? maybeFromMap(dynamic data) => data is Map
      ? MusclesPercentageStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'value': _value,
        'code': _code,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'value': serializeParam(
          _value,
          ParamType.double,
        ),
        'code': serializeParam(
          _code,
          ParamType.String,
        ),
      }.withoutNulls;

  static MusclesPercentageStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      MusclesPercentageStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        value: deserializeParam(
          data['value'],
          ParamType.double,
          false,
        ),
        code: deserializeParam(
          data['code'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'MusclesPercentageStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MusclesPercentageStruct &&
        name == other.name &&
        value == other.value &&
        code == other.code;
  }

  @override
  int get hashCode => const ListEquality().hash([name, value, code]);
}

MusclesPercentageStruct createMusclesPercentageStruct({
  String? name,
  double? value,
  String? code,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MusclesPercentageStruct(
      name: name,
      value: value,
      code: code,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

MusclesPercentageStruct? updateMusclesPercentageStruct(
  MusclesPercentageStruct? musclesPercentage, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    musclesPercentage
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addMusclesPercentageStructData(
  Map<String, dynamic> firestoreData,
  MusclesPercentageStruct? musclesPercentage,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (musclesPercentage == null) {
    return;
  }
  if (musclesPercentage.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && musclesPercentage.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final musclesPercentageData =
      getMusclesPercentageFirestoreData(musclesPercentage, forFieldValue);
  final nestedData =
      musclesPercentageData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = musclesPercentage.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getMusclesPercentageFirestoreData(
  MusclesPercentageStruct? musclesPercentage, [
  bool forFieldValue = false,
]) {
  if (musclesPercentage == null) {
    return {};
  }
  final firestoreData = mapToFirestore(musclesPercentage.toMap());

  // Add any Firestore field values
  musclesPercentage.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMusclesPercentageListFirestoreData(
  List<MusclesPercentageStruct>? musclesPercentages,
) =>
    musclesPercentages
        ?.map((e) => getMusclesPercentageFirestoreData(e, true))
        .toList() ??
    [];
