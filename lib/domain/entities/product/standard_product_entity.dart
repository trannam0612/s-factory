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
        ngCount: response?.ngCount,
        note: response?.note,
        result: response?.result,
        sample: response?.samples
            ?.map(
              (e) => SampleStandardEntity.fromResponse(response: e),
            )
            .toList());
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
    this.sample,
    this.ngCount,
    this.note,
    this.result,
  });
  final String? id;
  final String? name;
  final String? standard;
  final String? description;
  final String? tool;
  final String? type;
  final String? version;
  final String? reviewType;
  final String? result;
  final String? note;
  final int? ngCount;
  final List<SampleStandardEntity>? sample;

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

class SampleStandardEntity {
  factory SampleStandardEntity.fromResponse(
      {SampleStandardResponse? response}) {
    return SampleStandardEntity(
      id: response?.id,
      name: response?.name,
      standard: response?.standard,
      description: response?.description,
      tool: response?.tool,
      type: response?.type,
      version: response?.version,
      reviewType: response?.reviewType,
      note: response?.note,
      value: response?.value,
      result: response?.result,
    );
  }
  SampleStandardEntity({
    this.id,
    this.name,
    this.standard,
    this.description,
    this.tool,
    this.type,
    this.version,
    this.reviewType,
    this.note,
    this.value,
    this.result,
  });

  final String? id;

  final String? name;

  final String? standard;

  final String? description;

  final String? tool;

  final String? type;

  final String? version;

  final String? reviewType;

  final String? note;

  final num? value;

  final String? result;
}
