import 'package:json_annotation/json_annotation.dart';

part 'standard_product_response.g.dart';

@JsonSerializable()
class StandardProductResponse {
  StandardProductResponse({
    this.id,
    this.name,
    this.standard,
    this.description,
    this.tool,
    this.type,
    this.version,
    this.reviewType,
    this.samples,
    this.ngCount,
    this.result,
    this.note,
  });

  factory StandardProductResponse.fromJson(Map<String, dynamic> json) =>
      _$StandardProductResponseFromJson(json);
  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'standard')
  final String? standard;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'tool')
  final String? tool;
  @JsonKey(name: 'type')
  final String? type;
  @JsonKey(name: 'version')
  final String? version;
  @JsonKey(name: 'reviewType')
  final String? reviewType;
  @JsonKey(name: 'ngCount')
  final int? ngCount;
  @JsonKey(name: 'note')
  final String? note;
  @JsonKey(name: 'result')
  final String? result;
  @JsonKey(name: 'samples')
  final List<SampleStandardResponse>? samples;

  Map<String, dynamic> toJson() => _$StandardProductResponseToJson(this);
}

@JsonSerializable()
class SampleStandardResponse {
  SampleStandardResponse({
    this.id,
    this.name,
    this.standard,
    this.description,
    this.tool,
    this.type,
    this.version,
    this.reviewType,
    this.note,
    this.result,
    this.value,
  });

  factory SampleStandardResponse.fromJson(Map<String, dynamic> json) =>
      _$SampleStandardResponseFromJson(json);
  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'standard')
  final String? standard;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'tool')
  final String? tool;
  @JsonKey(name: 'type')
  final String? type;
  @JsonKey(name: 'version')
  final String? version;
  @JsonKey(name: 'reviewType')
  final String? reviewType;
  @JsonKey(name: 'note')
  final String? note;
  @JsonKey(name: 'value')
  final num? value;
  @JsonKey(name: 'result')
  final String? result;

  Map<String, dynamic> toJson() => _$SampleStandardResponseToJson(this);
}
