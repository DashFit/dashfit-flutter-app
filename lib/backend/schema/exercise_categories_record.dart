import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ExerciseCategoriesRecord extends FirestoreRecord {
  ExerciseCategoriesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "imgUrl" field.
  String? _imgUrl;
  String get imgUrl => _imgUrl ?? '';
  bool hasImgUrl() => _imgUrl != null;

  // "code" field.
  String? _code;
  String get code => _code ?? '';
  bool hasCode() => _code != null;

  // "priority" field.
  int? _priority;
  int get priority => _priority ?? 0;
  bool hasPriority() => _priority != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _imgUrl = snapshotData['imgUrl'] as String?;
    _code = snapshotData['code'] as String?;
    _priority = castToType<int>(snapshotData['priority']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('exerciseCategories');

  static Stream<ExerciseCategoriesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ExerciseCategoriesRecord.fromSnapshot(s));

  static Future<ExerciseCategoriesRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => ExerciseCategoriesRecord.fromSnapshot(s));

  static ExerciseCategoriesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ExerciseCategoriesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ExerciseCategoriesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ExerciseCategoriesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ExerciseCategoriesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ExerciseCategoriesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createExerciseCategoriesRecordData({
  String? name,
  String? imgUrl,
  String? code,
  int? priority,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'imgUrl': imgUrl,
      'code': code,
      'priority': priority,
    }.withoutNulls,
  );

  return firestoreData;
}

class ExerciseCategoriesRecordDocumentEquality
    implements Equality<ExerciseCategoriesRecord> {
  const ExerciseCategoriesRecordDocumentEquality();

  @override
  bool equals(ExerciseCategoriesRecord? e1, ExerciseCategoriesRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.imgUrl == e2?.imgUrl &&
        e1?.code == e2?.code &&
        e1?.priority == e2?.priority;
  }

  @override
  int hash(ExerciseCategoriesRecord? e) =>
      const ListEquality().hash([e?.name, e?.imgUrl, e?.code, e?.priority]);

  @override
  bool isValidKey(Object? o) => o is ExerciseCategoriesRecord;
}
