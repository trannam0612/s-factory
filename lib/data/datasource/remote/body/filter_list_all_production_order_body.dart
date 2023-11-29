import 'package:json_annotation/json_annotation.dart';

part 'filter_list_all_production_order_body.g.dart';

@JsonSerializable()
class FilterListAllProductionOrderBody {
  FilterListAllProductionOrderBody({
    this.poIkeyword,
    this.page,
    this.size,
  });

  factory FilterListAllProductionOrderBody.fromJson(
          Map<String, dynamic> json) =>
      _$FilterListAllProductionOrderBodyFromJson(json);
  @JsonKey(name: 'keyword')
  final String? poIkeyword;
  @JsonKey(name: 'page')
  final int? page;
  @JsonKey(name: 'size')
  final int? size;

  Map<String, dynamic> toJson() =>
      _$FilterListAllProductionOrderBodyToJson(this);
}
