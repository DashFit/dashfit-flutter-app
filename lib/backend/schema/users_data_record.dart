import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersDataRecord extends FirestoreRecord {
  UsersDataRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "gender" field.
  String? _gender;
  String get gender => _gender ?? '';
  bool hasGender() => _gender != null;

  // "state" field.
  String? _state;
  String get state => _state ?? '';
  bool hasState() => _state != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "trainer_id" field.
  DocumentReference? _trainerId;
  DocumentReference? get trainerId => _trainerId;
  bool hasTrainerId() => _trainerId != null;

  // "age" field.
  String? _age;
  String get age => _age ?? '';
  bool hasAge() => _age != null;

  // "weight" field.
  double? _weight;
  double get weight => _weight ?? 0.0;
  bool hasWeight() => _weight != null;

  // "userReference" field.
  DocumentReference? _userReference;
  DocumentReference? get userReference => _userReference;
  bool hasUserReference() => _userReference != null;

  // "height" field.
  HeightStruct? _height;
  HeightStruct get height => _height ?? HeightStruct();
  bool hasHeight() => _height != null;

  // "feet" field.
  String? _feet;
  String get feet => _feet ?? '';
  bool hasFeet() => _feet != null;

  // "inch" field.
  String? _inch;
  String get inch => _inch ?? '';
  bool hasInch() => _inch != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _gender = snapshotData['gender'] as String?;
    _state = snapshotData['state'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _type = snapshotData['type'] as String?;
    _trainerId = snapshotData['trainer_id'] as DocumentReference?;
    _age = snapshotData['age'] as String?;
    _weight = castToType<double>(snapshotData['weight']);
    _userReference = snapshotData['userReference'] as DocumentReference?;
    _height = HeightStruct.maybeFromMap(snapshotData['height']);
    _feet = snapshotData['feet'] as String?;
    _inch = snapshotData['inch'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('usersData');

  static Stream<UsersDataRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersDataRecord.fromSnapshot(s));

  static Future<UsersDataRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersDataRecord.fromSnapshot(s));

  static UsersDataRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UsersDataRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersDataRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersDataRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersDataRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersDataRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersDataRecordData({
  String? email,
  String? displayName,
  DateTime? createdTime,
  String? phoneNumber,
  String? gender,
  String? state,
  String? photoUrl,
  String? type,
  DocumentReference? trainerId,
  String? age,
  double? weight,
  DocumentReference? userReference,
  HeightStruct? height,
  String? feet,
  String? inch,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'gender': gender,
      'state': state,
      'photo_url': photoUrl,
      'type': type,
      'trainer_id': trainerId,
      'age': age,
      'weight': weight,
      'userReference': userReference,
      'height': HeightStruct().toMap(),
      'feet': feet,
      'inch': inch,
    }.withoutNulls,
  );

  // Handle nested data for "height" field.
  addHeightStructData(firestoreData, height, 'height');

  return firestoreData;
}

class UsersDataRecordDocumentEquality implements Equality<UsersDataRecord> {
  const UsersDataRecordDocumentEquality();

  @override
  bool equals(UsersDataRecord? e1, UsersDataRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.gender == e2?.gender &&
        e1?.state == e2?.state &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.type == e2?.type &&
        e1?.trainerId == e2?.trainerId &&
        e1?.age == e2?.age &&
        e1?.weight == e2?.weight &&
        e1?.userReference == e2?.userReference &&
        e1?.height == e2?.height &&
        e1?.feet == e2?.feet &&
        e1?.inch == e2?.inch;
  }

  @override
  int hash(UsersDataRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.createdTime,
        e?.phoneNumber,
        e?.gender,
        e?.state,
        e?.photoUrl,
        e?.type,
        e?.trainerId,
        e?.age,
        e?.weight,
        e?.userReference,
        e?.height,
        e?.feet,
        e?.inch
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersDataRecord;
}
