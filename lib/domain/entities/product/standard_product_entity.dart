import 'package:s_factory/data/datasource/remote/responses/product/standard_product_response.dart';

class StandardProductEntity {
  factory StandardProductEntity.fromResponse(
      {StandardProductResponse? response}) {
    return StandardProductEntity(
      id: response?.id,
      name: response?.name,
      standard: response?.standard,
      description: response?.description,
      tool: response?.tool,
      type: response?.type,
      version: response?.version,
      reviewType: response?.reviewType,
    );
  }
  StandardProductEntity({
    this.id,
    this.name,
    this.standard,
    this.description,
    this.tool,
    this.type,
    this.version,
    this.reviewType,
  });
  final String? id;
  final String? name;
  final String? standard;
  final String? description;
  final String? tool;
  final String? type;
  final String? version;
  final String? reviewType;

  StandardProductEntity copyWith({
    String? id,
    String? name,
    String? standard,
    String? description,
    String? tool,
    String? type,
    String? version,
    String? reviewType,
  }) =>
      StandardProductEntity(
        id: id ?? this.id,
        name: name ?? this.name,
        standard: standard ?? this.standard,
        description: description ?? this.description,
        tool: tool ?? this.tool,
        type: type ?? this.type,
        version: version ?? this.version,
        reviewType: reviewType ?? this.reviewType,
      );
}
