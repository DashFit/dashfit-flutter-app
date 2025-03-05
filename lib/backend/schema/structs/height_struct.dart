// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class HeightStruct extends FFFirebaseStruct {
  HeightStruct({
    String? name,
    String? value,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _value = value,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "value" field.
  String? _value;
  String get value => _value ?? '';
  set value(String? val) => _value = val;

  bool hasValue() => _value != null;

  static HeightStruct fromMap(Map<String, dynamic> data) => HeightStruct(
        name: data['name'] as String?,
        value: data['value'] as String?,
      );

  static HeightStruct? maybeFromMap(dynamic data) =>
      data is Map ? HeightStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'value': _value,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'value': serializeParam(
          _value,
          ParamType.String,
        ),
      }.withoutNulls;

  static HeightStruct fromSerializableMap(Map<String, dynamic> data) =>
      HeightStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        value: deserializeParam(
          data['value'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'HeightStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is HeightStruct && name == other.name && value == other.value;
  }

  @override
  int get hashCode => const ListEquality().hash([name, value]);
}

HeightStruct createHeightStruct({
  String? name,
  String? value,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    HeightStruct(
      name: name,
      value: value,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

HeightStruct? updateHeightStruct(
  HeightStruct? height, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    height
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addHeightStructData(
  Map<String, dynamic> firestoreData,
  HeightStruct? height,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (height == null) {
    return;
  }
  if (height.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && height.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final heightData = getHeightFirestoreData(height, forFieldValue);
  final nestedData = heightData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = height.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getHeightFirestoreData(
  HeightStruct? height, [
  bool forFieldValue = false,
]) {
  if (height == null) {
    return {};
  }
  final firestoreData = mapToFirestore(height.toMap());

  // Add any Firestore field values
  height.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getHeightListFirestoreData(
  List<HeightStruct>? heights,
) =>
    heights?.map((e) => getHeightFirestoreData(e, true)).toList() ?? [];
