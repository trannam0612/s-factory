import 'package:s_factory/domain/entities/product/production_order_entity.dart';
import 'package:s_factory/presentation/model/product_type_model.dart';

class ProductionOrderModel {
  factory ProductionOrderModel.fromEntity({ProductionOrderEntity? entity}) {
    return ProductionOrderModel(
      id: entity?.id,
      code: entity?.code,
      poCode: entity?.poCode,
      lot: entity?.uniqueCodes?.length ?? 0,
      uniqueCodes: entity?.uniqueCodes,
      unitCode: entity?.productType?.unitCode,
      unitName: entity?.productType?.name,
      standardImageUrls: entity?.productType?.standardImageUrls,
      productType: ProductTypeModel.fromEntity(entity: entity?.productType),
    );
  }
  ProductionOrderModel({
    this.id,
    this.code,
    this.poCode,
    this.lot,
    this.uniqueCodes,
    this.name,
    this.unitCode,
    this.unitName,
    this.standardImageUrls,
    this.productType,
  });

  String get nameAndCode => '$unitCode - $unitName';
  String? get urlImage =>
      standardImageUrls?.isNotEmpty == true ? standardImageUrls?.first : null;

  String? id;

  String? code;

  String? poCode;

  int? lot;

  List<String>? uniqueCodes;

  String? name;

  String? unitCode;

  dynamic unitName;

  List<String>? standardImageUrls;

  ProductTypeModel? productType;
}
