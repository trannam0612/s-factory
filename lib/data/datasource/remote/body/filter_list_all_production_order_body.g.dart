// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_list_all_production_order_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilterListAllProductionOrderBody _$FilterListAllProductionOrderBodyFromJson(
        Map<String, dynamic> json) =>
    FilterListAllProductionOrderBody(
      poIkeywordd: json['keyword'] as String?,
      page: json['page'] as int?,
      size: json['size'] as int?,
    );

Map<String, dynamic> _$FilterListAllProductionOrderBodyToJson(
        FilterListAllProductionOrderBody instance) =>
    <String, dynamic>{
      'keyword': instance.poIkeywordd,
      'page': instance.page,
      'size': instance.size,
    };
