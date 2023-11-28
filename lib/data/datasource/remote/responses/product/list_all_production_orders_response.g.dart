// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_all_production_orders_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListAllProductionOrdersResponse _$ListAllProductionOrdersResponseFromJson(
        Map<String, dynamic> json) =>
    ListAllProductionOrdersResponse(
      total: json['total'] as int?,
      count: json['count'] as int?,
      productionOrders: (json['productionOrders'] as List<dynamic>?)
          ?.map((e) =>
              ProductionOrderResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListAllProductionOrdersResponseToJson(
        ListAllProductionOrdersResponse instance) =>
    <String, dynamic>{
      'total': instance.total,
      'count': instance.count,
      'productionOrders': instance.productionOrders,
    };
