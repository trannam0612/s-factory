import 'package:s_factory/domain/entities/product/product_type_entity.dart';
import 'package:s_factory/domain/entities/product/standard_product_entity.dart';
import 'package:s_factory/presentation/model/standard_product_model.dart';

class ProductTypeModel {
  ProductTypeModel({
    this.id,
    this.code,
    this.name,
    this.unitCode,
    this.unitName,
    this.standardImageUrls,
    this.detailStandards,
    this.overviewStandards,
  });

  factory ProductTypeModel.fromEntity({ProductTypeEntity? entity}) {
    return ProductTypeModel(
      id: entity?.id,
      code: entity?.code,
      name: entity?.name,
      unitCode: entity?.unitCode,
      unitName: entity?.unitName,
      standardImageUrls: entity?.standardImageUrls,
      detailStandards: entity?.detailStandards
          ?.map(
            (StandardProductEntity e) => StandardProductModel.fromEntity(
              entity: e,
            ),
          )
          .toList(),
      overviewStandards: entity?.overviewStandards
          ?.map(
            (StandardProductEntity e) => StandardProductModel.fromEntity(
              entity: e,
            ),
          )
          .toList(),
    );
  }

  String? id;
  String? code;
  String? name;
  String? unitCode;
  String? unitName;
  List<String>? standardImageUrls;
  List<StandardProductModel>? detailStandards;
  List<StandardProductModel>? overviewStandards;
}
