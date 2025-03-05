import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GoersDataRecord extends FirestoreRecord {
  GoersDataRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "updated_at" field.
  DateTime? _updatedAt;
  DateTime? get updatedAt => _updatedAt;
  bool hasUpdatedAt() => _updatedAt != null;

  // "userDataReference" field.
  DocumentReference? _userDataReference;
  DocumentReference? get userDataReference => _userDataReference;
  bool hasUserDataReference() => _userDataReference != null;

  // "gender" field.
  String? _gender;
  String get gender => _gender ?? '';
  bool hasGender() => _gender != null;

  // "weight" field.
  double? _weight;
  double get weight => _weight ?? 0.0;
  bool hasWeight() => _weight != null;

  // "height" field.
  HeightStruct? _height;
  HeightStruct get height => _height ?? HeightStruct();
  bool hasHeight() => _height != null;

  // "phoneNumber" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "feet" field.
  String? _feet;
  String get feet => _feet ?? '';
  bool hasFeet() => _feet != null;

  // "inch" field.
  String? _inch;
  String get inch => _inch ?? '';
  bool hasInch() => _inch != null;

  // "age" field.
  String? _age;
  String get age => _age ?? '';
  bool hasAge() => _age != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _updatedAt = snapshotData['updated_at'] as DateTime?;
    _userDataReference =
        snapshotData['userDataReference'] as DocumentReference?;
    _gender = snapshotData['gender'] as String?;
    _weight = castToType<double>(snapshotData['weight']);
    _height = HeightStruct.maybeFromMap(snapshotData['height']);
    _phoneNumber = snapshotData['phoneNumber'] as String?;
    _feet = snapshotData['feet'] as String?;
    _inch = snapshotData['inch'] as String?;
    _age = snapshotData['age'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('goersData')
          : FirebaseFirestore.instance.collectionGroup('goersData');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('goersData').doc(id);

  static Stream<GoersDataRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GoersDataRecord.fromSnapshot(s));

  static Future<GoersDataRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => GoersDataRecord.fromSnapshot(s));

  static GoersDataRecord fromSnapshot(DocumentSnapshot snapshot) =>
      GoersDataRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GoersDataRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GoersDataRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GoersDataRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GoersDataRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGoersDataRecordData({
  String? name,
  String? photoUrl,
  DateTime? updatedAt,
  DocumentReference? userDataReference,
  String? gender,
  double? weight,
  HeightStruct? height,
  String? phoneNumber,
  String? feet,
  String? inch,
  String? age,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'photo_url': photoUrl,
      'updated_at': updatedAt,
      'userDataReference': userDataReference,
      'gender': gender,
      'weight': weight,
      'height': HeightStruct().toMap(),
      'phoneNumber': phoneNumber,
      'feet': feet,
      'inch': inch,
      'age': age,
    }.withoutNulls,
  );

  // Handle nested data for "height" field.
  addHeightStructData(firestoreData, height, 'height');

  return firestoreData;
}

class GoersDataRecordDocumentEquality implements Equality<GoersDataRecord> {
  const GoersDataRecordDocumentEquality();

  @override
  bool equals(GoersDataRecord? e1, GoersDataRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.updatedAt == e2?.updatedAt &&
        e1?.userDataReference == e2?.userDataReference &&
        e1?.gender == e2?.gender &&
        e1?.weight == e2?.weight &&
        e1?.height == e2?.height &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.feet == e2?.feet &&
        e1?.inch == e2?.inch &&
        e1?.age == e2?.age;
  }

  @override
  int hash(GoersDataRecord? e) => const ListEquality().hash([
        e?.name,
        e?.photoUrl,
        e?.updatedAt,
        e?.userDataReference,
        e?.gender,
        e?.weight,
        e?.height,
        e?.phoneNumber,
        e?.feet,
        e?.inch,
        e?.age
      ]);

  @override
  bool isValidKey(Object? o) => o is GoersDataRecord;
}
