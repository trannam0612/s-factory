import 'package:json_annotation/json_annotation.dart';
import 'package:s_factory/data/datasource/remote/responses/auth_response/user_response.dart';
import 'package:s_factory/data/datasource/remote/responses/product/product_type_response.dart';
import 'package:s_factory/data/datasource/remote/responses/product/standard_product_response.dart';
import 'package:s_factory/data/datasource/remote/responses/test_base_response.dart';

part 'report_detail_response.g.dart';

@JsonSerializable()
class ReportDetailResponse extends BaseResponse2 {
  ReportDetailResponse({
    this.id,
    this.code,
    this.poCode,
    this.createdAt,
    this.uniqueCodes,
    this.productionAt,
    this.productionCount,
    this.startNo,
    this.endNo,
    this.owner,
    // this.owner,
    this.status,
    this.stampType,
    this.productType,
    this.detailStandards,
    this.overviewStandards,
  });
  @JsonKey(name: 'id')
  String? id;
  @JsonKey(name: 'code')
  String? code;
  @JsonKey(name: 'poCode')
  String? poCode;
  @JsonKey(name: 'createdAt')
  int? createdAt;

  @JsonKey(name: 'providerCode')
  String? providerCode;

  @JsonKey(name: 'refDocument')
  String? refDocument;
  @JsonKey(name: 'ngCount')
  int? ngCount;
  @JsonKey(name: 'note')
  String? note;

  @JsonKey(name: 'uniqueCodes')
  List<String>? uniqueCodes;
  @JsonKey(name: 'sampleSerials')
  List<String>? sampleSerials;

  @JsonKey(name: 'productionAt')
  final int? productionAt;
  @JsonKey(name: 'productionCount')
  final int? productionCount;
  @JsonKey(name: 'startNo')
  final int? startNo;
  @JsonKey(name: 'endNo')
  final int? endNo;
  // @JsonKey(name: 'owner')
  // final String? owner;
  @JsonKey(name: 'status')
  final String? status;
  @JsonKey(name: 'stampType')
  final String? stampType;
  @JsonKey(name: 'productType')
  final ProductTypeResponse? productType;
  @JsonKey(name: 'owner')
  final UserResponse? owner;
  @JsonKey(name: 'detailStandards')
  List<StandardProductResponse>? detailStandards;
  @JsonKey(name: 'overviewStandards')
  List<StandardProductResponse>? overviewStandards;

  factory ReportDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$ReportDetailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ReportDetailResponseToJson(this);

  @override
  T fromJson<T extends BaseResponse2>(Map<String, dynamic> json) {
    return ReportDetailResponse.fromJson(json) as T;
  }
}
