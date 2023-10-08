import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProductsRecord extends FirestoreRecord {
  ProductsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "Price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  // "Condition" field.
  String? _condition;
  String get condition => _condition ?? '';
  bool hasCondition() => _condition != null;

  // "Kiemelt" field.
  bool? _kiemelt;
  bool get kiemelt => _kiemelt ?? false;
  bool hasKiemelt() => _kiemelt != null;

  // "FirstProductImage" field.
  String? _firstProductImage;
  String get firstProductImage => _firstProductImage ?? '';
  bool hasFirstProductImage() => _firstProductImage != null;

  // "SecondProductImage" field.
  String? _secondProductImage;
  String get secondProductImage => _secondProductImage ?? '';
  bool hasSecondProductImage() => _secondProductImage != null;

  // "ThirdProductImage" field.
  String? _thirdProductImage;
  String get thirdProductImage => _thirdProductImage ?? '';
  bool hasThirdProductImage() => _thirdProductImage != null;

  // "Brand" field.
  String? _brand;
  String get brand => _brand ?? '';
  bool hasBrand() => _brand != null;

  // "Category" field.
  List<String>? _category;
  List<String> get category => _category ?? const [];
  bool hasCategory() => _category != null;

  // "ID" field.
  int? _id;
  int get id => _id ?? 0;
  bool hasId() => _id != null;

  // "Video" field.
  String? _video;
  String get video => _video ?? '';
  bool hasVideo() => _video != null;

  void _initializeFields() {
    _name = snapshotData['Name'] as String?;
    _price = castToType<double>(snapshotData['Price']);
    _condition = snapshotData['Condition'] as String?;
    _kiemelt = snapshotData['Kiemelt'] as bool?;
    _firstProductImage = snapshotData['FirstProductImage'] as String?;
    _secondProductImage = snapshotData['SecondProductImage'] as String?;
    _thirdProductImage = snapshotData['ThirdProductImage'] as String?;
    _brand = snapshotData['Brand'] as String?;
    _category = getDataList(snapshotData['Category']);
    _id = castToType<int>(snapshotData['ID']);
    _video = snapshotData['Video'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Products');

  static Stream<ProductsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProductsRecord.fromSnapshot(s));

  static Future<ProductsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProductsRecord.fromSnapshot(s));

  static ProductsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProductsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProductsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProductsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProductsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProductsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProductsRecordData({
  String? name,
  double? price,
  String? condition,
  bool? kiemelt,
  String? firstProductImage,
  String? secondProductImage,
  String? thirdProductImage,
  String? brand,
  int? id,
  String? video,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Name': name,
      'Price': price,
      'Condition': condition,
      'Kiemelt': kiemelt,
      'FirstProductImage': firstProductImage,
      'SecondProductImage': secondProductImage,
      'ThirdProductImage': thirdProductImage,
      'Brand': brand,
      'ID': id,
      'Video': video,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProductsRecordDocumentEquality implements Equality<ProductsRecord> {
  const ProductsRecordDocumentEquality();

  @override
  bool equals(ProductsRecord? e1, ProductsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.price == e2?.price &&
        e1?.condition == e2?.condition &&
        e1?.kiemelt == e2?.kiemelt &&
        e1?.firstProductImage == e2?.firstProductImage &&
        e1?.secondProductImage == e2?.secondProductImage &&
        e1?.thirdProductImage == e2?.thirdProductImage &&
        e1?.brand == e2?.brand &&
        listEquality.equals(e1?.category, e2?.category) &&
        e1?.id == e2?.id &&
        e1?.video == e2?.video;
  }

  @override
  int hash(ProductsRecord? e) => const ListEquality().hash([
        e?.name,
        e?.price,
        e?.condition,
        e?.kiemelt,
        e?.firstProductImage,
        e?.secondProductImage,
        e?.thirdProductImage,
        e?.brand,
        e?.category,
        e?.id,
        e?.video
      ]);

  @override
  bool isValidKey(Object? o) => o is ProductsRecord;
}
