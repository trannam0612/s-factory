import 'package:json_annotation/json_annotation.dart';

part 'standard_product_response.g.dart';

@JsonSerializable()
class StandardProductResponse {
  @JsonKey(name: "id")
  final String? id;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "standard")
  final String? standard;
  @JsonKey(name: "description")
  final String? description;
  @JsonKey(name: "tool")
  final String? tool;
  @JsonKey(name: "type")
  final String? type;
  @JsonKey(name: "version")
  final String? version;
  @JsonKey(name: "reviewType")
  final String? reviewType;

  StandardProductResponse({
    this.id,
    this.name,
    this.standard,
    this.description,
    this.tool,
    this.type,
    this.version,
    this.reviewType,
  });

  factory StandardProductResponse.fromJson(Map<String, dynamic> json) =>
      _$StandardProductResponseFromJson(json);

  Map<String, dynamic> toJson() => _$StandardProductResponseToJson(this);
}

@JsonSerializable()
class SampleStandardResponse {
  @JsonKey(name: "id")
  final String? id;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "standard")
  final String? standard;
  @JsonKey(name: "description")
  final String? description;
  @JsonKey(name: "tool")
  final String? tool;
  @JsonKey(name: "type")
  final String? type;
  @JsonKey(name: "version")
  final String? version;
  @JsonKey(name: "reviewType")
  final String? reviewType;

  SampleStandardResponse({
    this.id,
    this.name,
    this.standard,
    this.description,
    this.tool,
    this.type,
    this.version,
    this.reviewType,
  });

  factory SampleStandardResponse.fromJson(Map<String, dynamic> json) =>
      _$SampleStandardResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SampleStandardResponseToJson(this);
}
