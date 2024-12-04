// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class MusclesAppStateStruct extends FFFirebaseStruct {
  MusclesAppStateStruct({
    double? calibration,
    String? name,
    String? code,
    String? imageUrl,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _calibration = calibration,
        _name = name,
        _code = code,
        _imageUrl = imageUrl,
        super(firestoreUtilData);

  // "calibration" field.
  double? _calibration;
  double get calibration => _calibration ?? 0.0;
  set calibration(double? val) => _calibration = val;

  void incrementCalibration(double amount) =>
      calibration = calibration + amount;

  bool hasCalibration() => _calibration != null;

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

  // "imageUrl" field.
  String? _imageUrl;
  String get imageUrl => _imageUrl ?? '';
  set imageUrl(String? val) => _imageUrl = val;

  bool hasImageUrl() => _imageUrl != null;

  static MusclesAppStateStruct fromMap(Map<String, dynamic> data) =>
      MusclesAppStateStruct(
        calibration: castToType<double>(data['calibration']),
        name: data['name'] as String?,
        code: data['code'] as String?,
        imageUrl: data['imageUrl'] as String?,
      );

  static MusclesAppStateStruct? maybeFromMap(dynamic data) => data is Map
      ? MusclesAppStateStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'calibration': _calibration,
        'name': _name,
        'code': _code,
        'imageUrl': _imageUrl,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'calibration': serializeParam(
          _calibration,
          ParamType.double,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'code': serializeParam(
          _code,
          ParamType.String,
        ),
        'imageUrl': serializeParam(
          _imageUrl,
          ParamType.String,
        ),
      }.withoutNulls;

  static MusclesAppStateStruct fromSerializableMap(Map<String, dynamic> data) =>
      MusclesAppStateStruct(
        calibration: deserializeParam(
          data['calibration'],
          ParamType.double,
          false,
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
        imageUrl: deserializeParam(
          data['imageUrl'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'MusclesAppStateStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MusclesAppStateStruct &&
        calibration == other.calibration &&
        name == other.name &&
        code == other.code &&
        imageUrl == other.imageUrl;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([calibration, name, code, imageUrl]);
}

MusclesAppStateStruct createMusclesAppStateStruct({
  double? calibration,
  String? name,
  String? code,
  String? imageUrl,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MusclesAppStateStruct(
      calibration: calibration,
      name: name,
      code: code,
      imageUrl: imageUrl,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

MusclesAppStateStruct? updateMusclesAppStateStruct(
  MusclesAppStateStruct? musclesAppState, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    musclesAppState
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addMusclesAppStateStructData(
  Map<String, dynamic> firestoreData,
  MusclesAppStateStruct? musclesAppState,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (musclesAppState == null) {
    return;
  }
  if (musclesAppState.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && musclesAppState.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final musclesAppStateData =
      getMusclesAppStateFirestoreData(musclesAppState, forFieldValue);
  final nestedData =
      musclesAppStateData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = musclesAppState.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getMusclesAppStateFirestoreData(
  MusclesAppStateStruct? musclesAppState, [
  bool forFieldValue = false,
]) {
  if (musclesAppState == null) {
    return {};
  }
  final firestoreData = mapToFirestore(musclesAppState.toMap());

  // Add any Firestore field values
  musclesAppState.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMusclesAppStateListFirestoreData(
  List<MusclesAppStateStruct>? musclesAppStates,
) =>
    musclesAppStates
        ?.map((e) => getMusclesAppStateFirestoreData(e, true))
        .toList() ??
    [];
