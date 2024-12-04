// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ExerciseCategoriesStruct extends FFFirebaseStruct {
  ExerciseCategoriesStruct({
    String? name,
    String? imgUrl,
    String? code,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _imgUrl = imgUrl,
        _code = code,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "imgUrl" field.
  String? _imgUrl;
  String get imgUrl => _imgUrl ?? '';
  set imgUrl(String? val) => _imgUrl = val;

  bool hasImgUrl() => _imgUrl != null;

  // "code" field.
  String? _code;
  String get code => _code ?? '';
  set code(String? val) => _code = val;

  bool hasCode() => _code != null;

  static ExerciseCategoriesStruct fromMap(Map<String, dynamic> data) =>
      ExerciseCategoriesStruct(
        name: data['name'] as String?,
        imgUrl: data['imgUrl'] as String?,
        code: data['code'] as String?,
      );

  static ExerciseCategoriesStruct? maybeFromMap(dynamic data) => data is Map
      ? ExerciseCategoriesStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'imgUrl': _imgUrl,
        'code': _code,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'imgUrl': serializeParam(
          _imgUrl,
          ParamType.String,
        ),
        'code': serializeParam(
          _code,
          ParamType.String,
        ),
      }.withoutNulls;

  static ExerciseCategoriesStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ExerciseCategoriesStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        imgUrl: deserializeParam(
          data['imgUrl'],
          ParamType.String,
          false,
        ),
        code: deserializeParam(
          data['code'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ExerciseCategoriesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ExerciseCategoriesStruct &&
        name == other.name &&
        imgUrl == other.imgUrl &&
        code == other.code;
  }

  @override
  int get hashCode => const ListEquality().hash([name, imgUrl, code]);
}

ExerciseCategoriesStruct createExerciseCategoriesStruct({
  String? name,
  String? imgUrl,
  String? code,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ExerciseCategoriesStruct(
      name: name,
      imgUrl: imgUrl,
      code: code,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ExerciseCategoriesStruct? updateExerciseCategoriesStruct(
  ExerciseCategoriesStruct? exerciseCategories, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    exerciseCategories
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addExerciseCategoriesStructData(
  Map<String, dynamic> firestoreData,
  ExerciseCategoriesStruct? exerciseCategories,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (exerciseCategories == null) {
    return;
  }
  if (exerciseCategories.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && exerciseCategories.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final exerciseCategoriesData =
      getExerciseCategoriesFirestoreData(exerciseCategories, forFieldValue);
  final nestedData =
      exerciseCategoriesData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      exerciseCategories.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getExerciseCategoriesFirestoreData(
  ExerciseCategoriesStruct? exerciseCategories, [
  bool forFieldValue = false,
]) {
  if (exerciseCategories == null) {
    return {};
  }
  final firestoreData = mapToFirestore(exerciseCategories.toMap());

  // Add any Firestore field values
  exerciseCategories.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getExerciseCategoriesListFirestoreData(
  List<ExerciseCategoriesStruct>? exerciseCategoriess,
) =>
    exerciseCategoriess
        ?.map((e) => getExerciseCategoriesFirestoreData(e, true))
        .toList() ??
    [];
