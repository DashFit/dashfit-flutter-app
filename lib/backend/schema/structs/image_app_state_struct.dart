// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ImageAppStateStruct extends FFFirebaseStruct {
  ImageAppStateStruct({
    String? baseUrl,
    String? path,
    String? suffix,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _baseUrl = baseUrl,
        _path = path,
        _suffix = suffix,
        super(firestoreUtilData);

  // "base_url" field.
  String? _baseUrl;
  String get baseUrl => _baseUrl ?? '';
  set baseUrl(String? val) => _baseUrl = val;

  bool hasBaseUrl() => _baseUrl != null;

  // "path" field.
  String? _path;
  String get path => _path ?? '';
  set path(String? val) => _path = val;

  bool hasPath() => _path != null;

  // "suffix" field.
  String? _suffix;
  String get suffix => _suffix ?? '';
  set suffix(String? val) => _suffix = val;

  bool hasSuffix() => _suffix != null;

  static ImageAppStateStruct fromMap(Map<String, dynamic> data) =>
      ImageAppStateStruct(
        baseUrl: data['base_url'] as String?,
        path: data['path'] as String?,
        suffix: data['suffix'] as String?,
      );

  static ImageAppStateStruct? maybeFromMap(dynamic data) => data is Map
      ? ImageAppStateStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'base_url': _baseUrl,
        'path': _path,
        'suffix': _suffix,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'base_url': serializeParam(
          _baseUrl,
          ParamType.String,
        ),
        'path': serializeParam(
          _path,
          ParamType.String,
        ),
        'suffix': serializeParam(
          _suffix,
          ParamType.String,
        ),
      }.withoutNulls;

  static ImageAppStateStruct fromSerializableMap(Map<String, dynamic> data) =>
      ImageAppStateStruct(
        baseUrl: deserializeParam(
          data['base_url'],
          ParamType.String,
          false,
        ),
        path: deserializeParam(
          data['path'],
          ParamType.String,
          false,
        ),
        suffix: deserializeParam(
          data['suffix'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ImageAppStateStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ImageAppStateStruct &&
        baseUrl == other.baseUrl &&
        path == other.path &&
        suffix == other.suffix;
  }

  @override
  int get hashCode => const ListEquality().hash([baseUrl, path, suffix]);
}

ImageAppStateStruct createImageAppStateStruct({
  String? baseUrl,
  String? path,
  String? suffix,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ImageAppStateStruct(
      baseUrl: baseUrl,
      path: path,
      suffix: suffix,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ImageAppStateStruct? updateImageAppStateStruct(
  ImageAppStateStruct? imageAppState, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    imageAppState
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addImageAppStateStructData(
  Map<String, dynamic> firestoreData,
  ImageAppStateStruct? imageAppState,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (imageAppState == null) {
    return;
  }
  if (imageAppState.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && imageAppState.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final imageAppStateData =
      getImageAppStateFirestoreData(imageAppState, forFieldValue);
  final nestedData =
      imageAppStateData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = imageAppState.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getImageAppStateFirestoreData(
  ImageAppStateStruct? imageAppState, [
  bool forFieldValue = false,
]) {
  if (imageAppState == null) {
    return {};
  }
  final firestoreData = mapToFirestore(imageAppState.toMap());

  // Add any Firestore field values
  imageAppState.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getImageAppStateListFirestoreData(
  List<ImageAppStateStruct>? imageAppStates,
) =>
    imageAppStates
        ?.map((e) => getImageAppStateFirestoreData(e, true))
        .toList() ??
    [];
