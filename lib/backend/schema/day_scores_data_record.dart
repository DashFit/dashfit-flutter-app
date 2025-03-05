import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DayScoresDataRecord extends FirestoreRecord {
  DayScoresDataRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "totalScore" field.
  double? _totalScore;
  double get totalScore => _totalScore ?? 0.0;
  bool hasTotalScore() => _totalScore != null;

  // "musclesScore" field.
  List<MusclesStruct>? _musclesScore;
  List<MusclesStruct> get musclesScore => _musclesScore ?? const [];
  bool hasMusclesScore() => _musclesScore != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _date = snapshotData['date'] as DateTime?;
    _totalScore = castToType<double>(snapshotData['totalScore']);
    _musclesScore = getStructList(
      snapshotData['musclesScore'],
      MusclesStruct.fromMap,
    );
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('dayScoresData')
          : FirebaseFirestore.instance.collectionGroup('dayScoresData');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('dayScoresData').doc(id);

  static Stream<DayScoresDataRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DayScoresDataRecord.fromSnapshot(s));

  static Future<DayScoresDataRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DayScoresDataRecord.fromSnapshot(s));

  static DayScoresDataRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DayScoresDataRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DayScoresDataRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DayScoresDataRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DayScoresDataRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DayScoresDataRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDayScoresDataRecordData({
  DateTime? date,
  double? totalScore,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'date': date,
      'totalScore': totalScore,
    }.withoutNulls,
  );

  return firestoreData;
}

class DayScoresDataRecordDocumentEquality
    implements Equality<DayScoresDataRecord> {
  const DayScoresDataRecordDocumentEquality();

  @override
  bool equals(DayScoresDataRecord? e1, DayScoresDataRecord? e2) {
    const listEquality = ListEquality();
    return e1?.date == e2?.date &&
        e1?.totalScore == e2?.totalScore &&
        listEquality.equals(e1?.musclesScore, e2?.musclesScore);
  }

  @override
  int hash(DayScoresDataRecord? e) =>
      const ListEquality().hash([e?.date, e?.totalScore, e?.musclesScore]);

  @override
  bool isValidKey(Object? o) => o is DayScoresDataRecord;
}
