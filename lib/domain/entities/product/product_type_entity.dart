import 'package:s_factory/data/datasource/remote/responses/product/product_type_response.dart';
import 'package:s_factory/data/datasource/remote/responses/product/standard_product_response.dart';
import 'package:s_factory/domain/entities/product/standard_product_entity.dart';

class ProductTypeEntity {
  ProductTypeEntity({
    this.id,
    this.code,
    this.name,
    this.unitCode,
    this.unitName,
    this.standardImageUrls,
    this.detailStandards,
    this.overviewStandards,
  });

  factory ProductTypeEntity.fromResponse({ProductTypeResponse? response}) {
    return ProductTypeEntity(
      id: response?.id,
      code: response?.code,
      name: response?.name,
      unitCode: response?.unitCode,
      unitName: response?.unitName,
      standardImageUrls: response?.standardImageUrls,
      detailStandards: response?.detailStandards
          ?.map(
            (StandardProductResponse e) => StandardProductEntity.fromResponse(
              response: e,
            ),
          )
          .toList(),
      overviewStandards: response?.overviewStandards
          ?.map(
            (StandardProductResponse e) => StandardProductEntity.fromResponse(
              response: e,
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
  List<StandardProductEntity>? detailStandards;
  List<StandardProductEntity>? overviewStandards;
}
