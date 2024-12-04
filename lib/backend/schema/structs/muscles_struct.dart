// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class MusclesStruct extends FFFirebaseStruct {
  MusclesStruct({
    String? name,
    String? code,
    double? value,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _code = code,
        _value = value,
        super(firestoreUtilData);

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

  // "value" field.
  double? _value;
  double get value => _value ?? 0.0;
  set value(double? val) => _value = val;

  void incrementValue(double amount) => value = value + amount;

  bool hasValue() => _value != null;

  static MusclesStruct fromMap(Map<String, dynamic> data) => MusclesStruct(
        name: data['name'] as String?,
        code: data['code'] as String?,
        value: castToType<double>(data['value']),
      );

  static MusclesStruct? maybeFromMap(dynamic data) =>
      data is Map ? MusclesStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'code': _code,
        'value': _value,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'code': serializeParam(
          _code,
          ParamType.String,
        ),
        'value': serializeParam(
          _value,
          ParamType.double,
        ),
      }.withoutNulls;

  static MusclesStruct fromSerializableMap(Map<String, dynamic> data) =>
      MusclesStruct(
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
        value: deserializeParam(
          data['value'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'MusclesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MusclesStruct &&
        name == other.name &&
        code == other.code &&
        value == other.value;
  }

  @override
  int get hashCode => const ListEquality().hash([name, code, value]);
}

MusclesStruct createMusclesStruct({
  String? name,
  String? code,
  double? value,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MusclesStruct(
      name: name,
      code: code,
      value: value,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

MusclesStruct? updateMusclesStruct(
  MusclesStruct? muscles, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    muscles
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addMusclesStructData(
  Map<String, dynamic> firestoreData,
  MusclesStruct? muscles,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (muscles == null) {
    return;
  }
  if (muscles.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && muscles.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final musclesData = getMusclesFirestoreData(muscles, forFieldValue);
  final nestedData = musclesData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = muscles.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getMusclesFirestoreData(
  MusclesStruct? muscles, [
  bool forFieldValue = false,
]) {
  if (muscles == null) {
    return {};
  }
  final firestoreData = mapToFirestore(muscles.toMap());

  // Add any Firestore field values
  muscles.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMusclesListFirestoreData(
  List<MusclesStruct>? muscless,
) =>
    muscless?.map((e) => getMusclesFirestoreData(e, true)).toList() ?? [];
