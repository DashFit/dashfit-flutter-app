import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MusclesRecord extends FirestoreRecord {
  MusclesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "calibration" field.
  double? _calibration;
  double get calibration => _calibration ?? 0.0;
  bool hasCalibration() => _calibration != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "code" field.
  String? _code;
  String get code => _code ?? '';
  bool hasCode() => _code != null;

  // "imageUrl" field.
  String? _imageUrl;
  String get imageUrl => _imageUrl ?? '';
  bool hasImageUrl() => _imageUrl != null;

  void _initializeFields() {
    _calibration = castToType<double>(snapshotData['calibration']);
    _name = snapshotData['name'] as String?;
    _code = snapshotData['code'] as String?;
    _imageUrl = snapshotData['imageUrl'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('muscles');

  static Stream<MusclesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MusclesRecord.fromSnapshot(s));

  static Future<MusclesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MusclesRecord.fromSnapshot(s));

  static MusclesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MusclesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MusclesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MusclesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MusclesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MusclesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMusclesRecordData({
  double? calibration,
  String? name,
  String? code,
  String? imageUrl,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'calibration': calibration,
      'name': name,
      'code': code,
      'imageUrl': imageUrl,
    }.withoutNulls,
  );

  return firestoreData;
}

class MusclesRecordDocumentEquality implements Equality<MusclesRecord> {
  const MusclesRecordDocumentEquality();

  @override
  bool equals(MusclesRecord? e1, MusclesRecord? e2) {
    return e1?.calibration == e2?.calibration &&
        e1?.name == e2?.name &&
        e1?.code == e2?.code &&
        e1?.imageUrl == e2?.imageUrl;
  }

  @override
  int hash(MusclesRecord? e) => const ListEquality()
      .hash([e?.calibration, e?.name, e?.code, e?.imageUrl]);

  @override
  bool isValidKey(Object? o) => o is MusclesRecord;
}
