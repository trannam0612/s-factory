import 'package:s_factory/domain/entities/product/standard_product_entity.dart';

class StandardProductModel {
  factory StandardProductModel.fromEntity({
    StandardProductEntity? entity,
  }) {
    return StandardProductModel(
      id: entity?.id,
      name: entity?.name,
      standard: entity?.standard,
      description: entity?.description,
      tool: entity?.tool,
      type: entity?.type,
      version: entity?.version,
      reviewType: entity?.reviewType,
    );
  }
  StandardProductModel({
    this.id,
    this.name,
    this.standard,
    this.description,
    this.tool,
    this.type,
    this.version,
    this.reviewType,
    this.value = 0.0,
  });
  final String? id;
  final String? name;
  final String? standard;
  final String? description;
  final String? tool;
  final String? type;
  final String? version;
  final String? reviewType;
  final double value;

  StandardProductModel copyWith({
    String? id,
    String? name,
    String? standard,
    String? description,
    String? tool,
    String? type,
    String? version,
    String? reviewType,
    required double value,
  }) =>
      StandardProductModel(
        id: id ?? this.id,
        name: name ?? this.name,
        standard: standard ?? this.standard,
        description: description ?? this.description,
        tool: tool ?? this.tool,
        type: type ?? this.type,
        version: version ?? this.version,
        reviewType: reviewType ?? this.reviewType,
        value: value,
      );
}
