// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class DocumentStructureStruct extends FFFirebaseStruct {
  DocumentStructureStruct({
    String? name,
    String? age,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _age = age,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "age" field.
  String? _age;
  String get age => _age ?? '';
  set age(String? val) => _age = val;

  bool hasAge() => _age != null;

  static DocumentStructureStruct fromMap(Map<String, dynamic> data) =>
      DocumentStructureStruct(
        name: data['name'] as String?,
        age: data['age'] as String?,
      );

  static DocumentStructureStruct? maybeFromMap(dynamic data) => data is Map
      ? DocumentStructureStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'age': _age,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'age': serializeParam(
          _age,
          ParamType.String,
        ),
      }.withoutNulls;

  static DocumentStructureStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      DocumentStructureStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        age: deserializeParam(
          data['age'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'DocumentStructureStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DocumentStructureStruct &&
        name == other.name &&
        age == other.age;
  }

  @override
  int get hashCode => const ListEquality().hash([name, age]);
}

DocumentStructureStruct createDocumentStructureStruct({
  String? name,
  String? age,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DocumentStructureStruct(
      name: name,
      age: age,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DocumentStructureStruct? updateDocumentStructureStruct(
  DocumentStructureStruct? documentStructure, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    documentStructure
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDocumentStructureStructData(
  Map<String, dynamic> firestoreData,
  DocumentStructureStruct? documentStructure,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (documentStructure == null) {
    return;
  }
  if (documentStructure.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && documentStructure.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final documentStructureData =
      getDocumentStructureFirestoreData(documentStructure, forFieldValue);
  final nestedData =
      documentStructureData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = documentStructure.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDocumentStructureFirestoreData(
  DocumentStructureStruct? documentStructure, [
  bool forFieldValue = false,
]) {
  if (documentStructure == null) {
    return {};
  }
  final firestoreData = mapToFirestore(documentStructure.toMap());

  // Add any Firestore field values
  documentStructure.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDocumentStructureListFirestoreData(
  List<DocumentStructureStruct>? documentStructures,
) =>
    documentStructures
        ?.map((e) => getDocumentStructureFirestoreData(e, true))
        .toList() ??
    [];
