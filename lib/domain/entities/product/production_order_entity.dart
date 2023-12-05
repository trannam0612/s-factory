import 'package:s_factory/data/datasource/remote/responses/product/production_order_response.dart';
import 'package:s_factory/domain/entities/product/product_type_entity.dart';

class ProductionOrderEntity {
  ProductionOrderEntity({
    this.id,
    this.code,
    this.poCode,
    this.uniqueCodes,
    this.productType,
    this.productionAt,
    this.productionCount,
    this.startNo,
    this.endNo,
    this.status,
    this.stampType,
    this.uniqueCodeCount,
  });

  factory ProductionOrderEntity.fromResponse(
      {ProductionOrderResponse? response}) {
    return ProductionOrderEntity(
      id: response?.id,
      code: response?.code,
      poCode: response?.poCode,
      uniqueCodes: response?.uniqueCodes,
      productionAt: response?.productionAt,
      productionCount: response?.productionCount,
      startNo: response?.startNo,
      endNo: response?.endNo,
      status: response?.status,
      stampType: response?.stampType,
      uniqueCodeCount: response?.uniqueCodeCount,
      productType: ProductTypeEntity.fromResponse(
        response: response?.productType,
      ),
    );
  }
  String? id;

  String? code;

  String? poCode;

  int? productionAt;

  int? productionCount;

  int? startNo;

  int? endNo;

  int? uniqueCodeCount;

  String? status;

  String? stampType;

  List<String>? uniqueCodes;

  ProductTypeEntity? productType;
}
