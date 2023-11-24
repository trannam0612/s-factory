import 'package:s_factory/domain/entities/product/check_serial_entity.dart';
import 'package:s_factory/domain/entities/product/production_order_entity.dart';

import '../entities/data_state.dart';

abstract class ProductRepository {
  Future<DataState<CheckSerialEntity>> stampCheckUniqueCode(
    String serial,
  );

  Future<DataState<ProductionOrderEntity>> factoryProductionOrderDetail(
    String poId,
  );
}
