import 'package:json_annotation/json_annotation.dart';

part 'filter_list_report_po_body.g.dart';

@JsonSerializable()
class POReportFilterBody {
  POReportFilterBody({
    this.poIkeyword,
    this.page,
    this.size,
    this.poId,
  });

  factory POReportFilterBody.fromJson(Map<String, dynamic> json) =>
      _$POReportFilterBodyFromJson(json);
  @JsonKey(name: 'keyword')
  final String? poIkeyword;
  @JsonKey(name: 'page')
  final int? page;
  @JsonKey(name: 'size')
  final int? size;
  @JsonKey(name: 'poId')
  final String? poId;

  Map<String, dynamic> toJson() => _$POReportFilterBodyToJson(this);
}
