import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ExerciseScoresDataRecord extends FirestoreRecord {
  ExerciseScoresDataRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "totalScore" field.
  double? _totalScore;
  double get totalScore => _totalScore ?? 0.0;
  bool hasTotalScore() => _totalScore != null;

  // "formData" field.
  ExerciseFormDataStruct? _formData;
  ExerciseFormDataStruct get formData => _formData ?? ExerciseFormDataStruct();
  bool hasFormData() => _formData != null;

  // "muscles" field.
  List<MusclesStruct>? _muscles;
  List<MusclesStruct> get muscles => _muscles ?? const [];
  bool hasMuscles() => _muscles != null;

  // "imageUrl" field.
  String? _imageUrl;
  String get imageUrl => _imageUrl ?? '';
  bool hasImageUrl() => _imageUrl != null;

  // "exercisesReference" field.
  DocumentReference? _exercisesReference;
  DocumentReference? get exercisesReference => _exercisesReference;
  bool hasExercisesReference() => _exercisesReference != null;

  // "workoutType" field.
  String? _workoutType;
  String get workoutType => _workoutType ?? '';
  bool hasWorkoutType() => _workoutType != null;

  // "timeStamp" field.
  DateTime? _timeStamp;
  DateTime? get timeStamp => _timeStamp;
  bool hasTimeStamp() => _timeStamp != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _date = snapshotData['date'] as DateTime?;
    _name = snapshotData['name'] as String?;
    _totalScore = castToType<double>(snapshotData['totalScore']);
    _formData = ExerciseFormDataStruct.maybeFromMap(snapshotData['formData']);
    _muscles = getStructList(
      snapshotData['muscles'],
      MusclesStruct.fromMap,
    );
    _imageUrl = snapshotData['imageUrl'] as String?;
    _exercisesReference =
        snapshotData['exercisesReference'] as DocumentReference?;
    _workoutType = snapshotData['workoutType'] as String?;
    _timeStamp = snapshotData['timeStamp'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('exerciseScoresData')
          : FirebaseFirestore.instance.collectionGroup('exerciseScoresData');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('exerciseScoresData').doc(id);

  static Stream<ExerciseScoresDataRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ExerciseScoresDataRecord.fromSnapshot(s));

  static Future<ExerciseScoresDataRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => ExerciseScoresDataRecord.fromSnapshot(s));

  static ExerciseScoresDataRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ExerciseScoresDataRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ExerciseScoresDataRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ExerciseScoresDataRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ExerciseScoresDataRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ExerciseScoresDataRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createExerciseScoresDataRecordData({
  DateTime? date,
  String? name,
  double? totalScore,
  ExerciseFormDataStruct? formData,
  String? imageUrl,
  DocumentReference? exercisesReference,
  String? workoutType,
  DateTime? timeStamp,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'date': date,
      'name': name,
      'totalScore': totalScore,
      'formData': ExerciseFormDataStruct().toMap(),
      'imageUrl': imageUrl,
      'exercisesReference': exercisesReference,
      'workoutType': workoutType,
      'timeStamp': timeStamp,
    }.withoutNulls,
  );

  // Handle nested data for "formData" field.
  addExerciseFormDataStructData(firestoreData, formData, 'formData');

  return firestoreData;
}

class ExerciseScoresDataRecordDocumentEquality
    implements Equality<ExerciseScoresDataRecord> {
  const ExerciseScoresDataRecordDocumentEquality();

  @override
  bool equals(ExerciseScoresDataRecord? e1, ExerciseScoresDataRecord? e2) {
    const listEquality = ListEquality();
    return e1?.date == e2?.date &&
        e1?.name == e2?.name &&
        e1?.totalScore == e2?.totalScore &&
        e1?.formData == e2?.formData &&
        listEquality.equals(e1?.muscles, e2?.muscles) &&
        e1?.imageUrl == e2?.imageUrl &&
        e1?.exercisesReference == e2?.exercisesReference &&
        e1?.workoutType == e2?.workoutType &&
        e1?.timeStamp == e2?.timeStamp;
  }

  @override
  int hash(ExerciseScoresDataRecord? e) => const ListEquality().hash([
        e?.date,
        e?.name,
        e?.totalScore,
        e?.formData,
        e?.muscles,
        e?.imageUrl,
        e?.exercisesReference,
        e?.workoutType,
        e?.timeStamp
      ]);

  @override
  bool isValidKey(Object? o) => o is ExerciseScoresDataRecord;
}
