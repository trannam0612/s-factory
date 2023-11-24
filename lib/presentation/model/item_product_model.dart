import 'package:s_factory/domain/entities/product/check_serial_entity.dart';

class ProductModel {
  factory ProductModel.fromEntity({CheckSerialEntity? checkSerialEntity}) {
    return ProductModel(
      id: checkSerialEntity?.id,
      uniqueCode: checkSerialEntity?.uniqueCode,
      no: checkSerialEntity?.no,
      productionAt: checkSerialEntity?.productionAt,
      batchName: checkSerialEntity?.batchName,
      poCode: checkSerialEntity?.productionOrder?.poCode,
      poId: checkSerialEntity?.productionOrder?.id,
      lot: checkSerialEntity?.productionOrder?.uniqueCodes?.length,
      productName: checkSerialEntity?.productType?.name,
    );
  }
  ProductModel({
    this.id,
    this.uniqueCode,
    this.no,
    this.productionAt,
    this.batchName,
    this.productName,
    this.poCode,
    this.poId,
    this.lot,
  });
  String? id;
  String? uniqueCode;
  int? no;
  int? productionAt;
  String? batchName;
  String? productName;
  String? poCode;
  String? poId;
  int? lot;

  ProductModel copyWith({
    String? id,
    String? uniqueCode,
    int? no,
    int? productionAt,
    String? batchName,
    String? productName,
    String? poCode,
    String? poId,
    int? lot,
  }) =>
      ProductModel(
        id: id ?? this.id,
        uniqueCode: uniqueCode ?? this.uniqueCode,
        no: no ?? this.no,
        productionAt: productionAt ?? this.productionAt,
        batchName: batchName ?? this.batchName,
        productName: productName ?? this.productName,
        poCode: poCode ?? this.poCode,
        poId: poId ?? this.poId,
        lot: lot ?? this.lot,
      );
}

// class ProductType {
//   ProductType({
//     this.id,
//     this.code,
//     this.name,
//   });
//   String? id;
//   String? code;
//   String? name;

//   ProductType copyWith({
//     String? id,
//     String? code,
//     String? name,
//   }) =>
//       ProductType(
//         id: id ?? this.id,
//         code: code ?? this.code,
//         name: name ?? this.name,
//       );
// }

// class ProductionOrder {
//   ProductionOrder({
//     this.id,
//     this.code,
//     this.poCode,
//     this.uniqueCodes,
//   });
//   String? id;
//   String? code;
//   String? poCode;
//   List<String>? uniqueCodes;

//   ProductionOrder copyWith({
//     String? id,
//     String? code,
//     String? poCode,
//     List<String>? uniqueCodes,
//   }) =>
//       ProductionOrder(
//         id: id ?? this.id,
//         code: code ?? this.code,
//         poCode: poCode ?? this.poCode,
//         uniqueCodes: uniqueCodes ?? this.uniqueCodes,
//       );
// }
