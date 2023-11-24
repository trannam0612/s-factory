import 'package:s_factory/data/datasource/remote/responses/product/check_serial_response.dart';
import 'package:s_factory/domain/entities/product/product_type_entity.dart';
import 'package:s_factory/domain/entities/product/production_order_entity.dart';

class CheckSerialEntity {
  CheckSerialEntity({
    this.id,
    this.uniqueCode,
    this.no,
    this.productionAt,
    this.batchName,
    this.productionOrder,
    this.productType,
  });

  factory CheckSerialEntity.fromResponse(
      {CheckSerialResponse? checkSerialResponse}) {
    return CheckSerialEntity(
      id: checkSerialResponse?.id,
      uniqueCode: checkSerialResponse?.uniqueCode,
      no: checkSerialResponse?.no,
      productionAt: checkSerialResponse?.productionAt,
      batchName: checkSerialResponse?.batchName,
      productionOrder: ProductionOrderEntity.fromResponse(
        response: checkSerialResponse?.productionOrder,
      ),
      productType: ProductTypeEntity.fromResponse(
        response: checkSerialResponse?.productType,
      ),
    );
  }

  String? id;

  String? uniqueCode;

  int? no;

  int? productionAt;

  String? batchName;

  ProductionOrderEntity? productionOrder;

  ProductTypeEntity? productType;
}
