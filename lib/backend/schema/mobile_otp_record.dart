import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MobileOtpRecord extends FirestoreRecord {
  MobileOtpRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "mobileNumber" field.
  String? _mobileNumber;
  String get mobileNumber => _mobileNumber ?? '';
  bool hasMobileNumber() => _mobileNumber != null;

  // "otp" field.
  int? _otp;
  int get otp => _otp ?? 0;
  bool hasOtp() => _otp != null;

  // "expiryDate" field.
  DateTime? _expiryDate;
  DateTime? get expiryDate => _expiryDate;
  bool hasExpiryDate() => _expiryDate != null;

  void _initializeFields() {
    _mobileNumber = snapshotData['mobileNumber'] as String?;
    _otp = castToType<int>(snapshotData['otp']);
    _expiryDate = snapshotData['expiryDate'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('mobileOtp');

  static Stream<MobileOtpRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MobileOtpRecord.fromSnapshot(s));

  static Future<MobileOtpRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MobileOtpRecord.fromSnapshot(s));

  static MobileOtpRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MobileOtpRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MobileOtpRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MobileOtpRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MobileOtpRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MobileOtpRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMobileOtpRecordData({
  String? mobileNumber,
  int? otp,
  DateTime? expiryDate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'mobileNumber': mobileNumber,
      'otp': otp,
      'expiryDate': expiryDate,
    }.withoutNulls,
  );

  return firestoreData;
}

class MobileOtpRecordDocumentEquality implements Equality<MobileOtpRecord> {
  const MobileOtpRecordDocumentEquality();

  @override
  bool equals(MobileOtpRecord? e1, MobileOtpRecord? e2) {
    return e1?.mobileNumber == e2?.mobileNumber &&
        e1?.otp == e2?.otp &&
        e1?.expiryDate == e2?.expiryDate;
  }

  @override
  int hash(MobileOtpRecord? e) =>
      const ListEquality().hash([e?.mobileNumber, e?.otp, e?.expiryDate]);

  @override
  bool isValidKey(Object? o) => o is MobileOtpRecord;
}
