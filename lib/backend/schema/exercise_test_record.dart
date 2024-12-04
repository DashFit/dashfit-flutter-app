import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ExerciseTestRecord extends FirestoreRecord {
  ExerciseTestRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "category" field.
  List<String>? _category;
  List<String> get category => _category ?? const [];
  bool hasCategory() => _category != null;

  // "imageUrl" field.
  String? _imageUrl;
  String get imageUrl => _imageUrl ?? '';
  bool hasImageUrl() => _imageUrl != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "workoutType" field.
  WorkoutTypeStruct? _workoutType;
  WorkoutTypeStruct get workoutType => _workoutType ?? WorkoutTypeStruct();
  bool hasWorkoutType() => _workoutType != null;

  // "musclePercentage" field.
  List<MusclesPercentageStruct>? _musclePercentage;
  List<MusclesPercentageStruct> get musclePercentage =>
      _musclePercentage ?? const [];
  bool hasMusclePercentage() => _musclePercentage != null;

  // "code" field.
  String? _code;
  String get code => _code ?? '';
  bool hasCode() => _code != null;

  // "difficultyMultiplier" field.
  double? _difficultyMultiplier;
  double get difficultyMultiplier => _difficultyMultiplier ?? 0.0;
  bool hasDifficultyMultiplier() => _difficultyMultiplier != null;

  void _initializeFields() {
    _category = getDataList(snapshotData['category']);
    _imageUrl = snapshotData['imageUrl'] as String?;
    _name = snapshotData['name'] as String?;
    _workoutType = WorkoutTypeStruct.maybeFromMap(snapshotData['workoutType']);
    _musclePercentage = getStructList(
      snapshotData['musclePercentage'],
      MusclesPercentageStruct.fromMap,
    );
    _code = snapshotData['code'] as String?;
    _difficultyMultiplier =
        castToType<double>(snapshotData['difficultyMultiplier']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('exerciseTest');

  static Stream<ExerciseTestRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ExerciseTestRecord.fromSnapshot(s));

  static Future<ExerciseTestRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ExerciseTestRecord.fromSnapshot(s));

  static ExerciseTestRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ExerciseTestRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ExerciseTestRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ExerciseTestRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ExerciseTestRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ExerciseTestRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createExerciseTestRecordData({
  String? imageUrl,
  String? name,
  WorkoutTypeStruct? workoutType,
  String? code,
  double? difficultyMultiplier,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'imageUrl': imageUrl,
      'name': name,
      'workoutType': WorkoutTypeStruct().toMap(),
      'code': code,
      'difficultyMultiplier': difficultyMultiplier,
    }.withoutNulls,
  );

  // Handle nested data for "workoutType" field.
  addWorkoutTypeStructData(firestoreData, workoutType, 'workoutType');

  return firestoreData;
}

class ExerciseTestRecordDocumentEquality
    implements Equality<ExerciseTestRecord> {
  const ExerciseTestRecordDocumentEquality();

  @override
  bool equals(ExerciseTestRecord? e1, ExerciseTestRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.category, e2?.category) &&
        e1?.imageUrl == e2?.imageUrl &&
        e1?.name == e2?.name &&
        e1?.workoutType == e2?.workoutType &&
        listEquality.equals(e1?.musclePercentage, e2?.musclePercentage) &&
        e1?.code == e2?.code &&
        e1?.difficultyMultiplier == e2?.difficultyMultiplier;
  }

  @override
  int hash(ExerciseTestRecord? e) => const ListEquality().hash([
        e?.category,
        e?.imageUrl,
        e?.name,
        e?.workoutType,
        e?.musclePercentage,
        e?.code,
        e?.difficultyMultiplier
      ]);

  @override
  bool isValidKey(Object? o) => o is ExerciseTestRecord;
}
