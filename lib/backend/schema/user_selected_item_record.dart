import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserSelectedItemRecord extends FirestoreRecord {
  UserSelectedItemRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "ProductName" field.
  String? _productName;
  String get productName => _productName ?? '';
  bool hasProductName() => _productName != null;

  // "ProductImage" field.
  String? _productImage;
  String get productImage => _productImage ?? '';
  bool hasProductImage() => _productImage != null;

  // "UserReference" field.
  DocumentReference? _userReference;
  DocumentReference? get userReference => _userReference;
  bool hasUserReference() => _userReference != null;

  void _initializeFields() {
    _productName = snapshotData['ProductName'] as String?;
    _productImage = snapshotData['ProductImage'] as String?;
    _userReference = snapshotData['UserReference'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('UserSelectedItem');

  static Stream<UserSelectedItemRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserSelectedItemRecord.fromSnapshot(s));

  static Future<UserSelectedItemRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => UserSelectedItemRecord.fromSnapshot(s));

  static UserSelectedItemRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserSelectedItemRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserSelectedItemRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserSelectedItemRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserSelectedItemRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserSelectedItemRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserSelectedItemRecordData({
  String? productName,
  String? productImage,
  DocumentReference? userReference,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'ProductName': productName,
      'ProductImage': productImage,
      'UserReference': userReference,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserSelectedItemRecordDocumentEquality
    implements Equality<UserSelectedItemRecord> {
  const UserSelectedItemRecordDocumentEquality();

  @override
  bool equals(UserSelectedItemRecord? e1, UserSelectedItemRecord? e2) {
    return e1?.productName == e2?.productName &&
        e1?.productImage == e2?.productImage &&
        e1?.userReference == e2?.userReference;
  }

  @override
  int hash(UserSelectedItemRecord? e) => const ListEquality()
      .hash([e?.productName, e?.productImage, e?.userReference]);

  @override
  bool isValidKey(Object? o) => o is UserSelectedItemRecord;
}
