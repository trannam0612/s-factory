import 'package:json_annotation/json_annotation.dart';
import 'package:s_factory/data/datasource/remote/responses/product/standard_product_response.dart';

part 'product_type_response.g.dart';

@JsonSerializable()
class ProductTypeResponse {
  ProductTypeResponse({
    this.id,
    this.code,
    this.name,
    this.unitCode,
    this.unitName,
    this.standardImageUrls,
    this.detailStandards,
    this.overviewStandards,
  });

  factory ProductTypeResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductTypeResponseFromJson(json);
  @JsonKey(name: 'id')
  String? id;
  @JsonKey(name: 'code')
  String? code;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'unitCode')
  final String? unitCode;
  @JsonKey(name: 'unitName')
  final String? unitName;
  @JsonKey(name: 'standardImageUrls')
  final List<String>? standardImageUrls;
  @JsonKey(name: 'detailStandards')
  final List<StandardProductResponse>? detailStandards;
  @JsonKey(name: 'overviewStandards')
  final List<StandardProductResponse>? overviewStandards;

  Map<String, dynamic> toJson() => _$ProductTypeResponseToJson(this);
}
