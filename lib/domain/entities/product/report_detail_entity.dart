import 'package:s_factory/data/datasource/remote/responses/product/report_detail_response.dart';
import 'package:s_factory/domain/entities/auth/user_entity.dart';
import 'package:s_factory/domain/entities/product/product_type_entity.dart';
import 'package:s_factory/domain/entities/product/standard_product_entity.dart';

class ReportDetailEntity {
  ReportDetailEntity({
    this.id,
    this.code,
    this.poCode,
    this.uniqueCodes,
    this.sampleSerials,
    this.productionAt,
    this.productionCount,
    this.ngCount,
    this.startNo,
    this.providerCode,
    this.refDocument,
    this.note,
    this.createdAt,
    this.endNo,
    this.status,
    this.stampType,
    this.owner,
    this.productType,
    this.detailStandards,
    this.overviewStandards,
  });

  String? id;

  String? code;

  String? poCode;

  int? createdAt;

  String? providerCode;

  String? refDocument;

  int? ngCount;

  String? note;

  List<String>? uniqueCodes;

  List<String>? sampleSerials;

  final int? productionAt;

  final int? productionCount;

  final int? startNo;

  final int? endNo;

  final String? status;

  final String? stampType;

  final ProductTypeEntity? productType;

  final UserEntity? owner;

  List<StandardProductEntity>? detailStandards;

  List<StandardProductEntity>? overviewStandards;

  factory ReportDetailEntity.fromResponse({
    ReportDetailResponse? response,
  }) {
    return ReportDetailEntity(
      id: response?.id,
      code: response?.code,
      poCode: response?.poCode,
      refDocument: response?.refDocument,
      note: response?.note,
      uniqueCodes: response?.uniqueCodes,
      sampleSerials: response?.sampleSerials,
      ngCount: response?.ngCount,
      productionAt: response?.productionAt,
      productionCount: response?.productionCount,
      startNo: response?.startNo,
      endNo: response?.endNo,
      status: response?.status,
      createdAt: response?.createdAt,
      providerCode: response?.providerCode,
      stampType: response?.stampType,
      owner: UserEntity.fromResponse(response: response?.owner),
      productType:
          ProductTypeEntity.fromResponse(response: response?.productType),
      // owner: response?.owner,
      detailStandards: response?.detailStandards
          ?.map((e) => StandardProductEntity.fromResponse(
                response: e,
              ))
          .toList(),
      overviewStandards: response?.overviewStandards
          ?.map((e) => StandardProductEntity.fromResponse(
                response: e,
              ))
          .toList(),
    );
  }
}
