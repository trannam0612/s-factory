import 'package:s_factory/common/extensions/string_extension.dart';
import 'package:s_factory/domain/entities/product/report_detail_entity.dart';
import 'package:s_factory/domain/entities/product/standard_product_entity.dart';
import 'package:s_factory/presentation/model/auth/user_model.dart';
import 'package:s_factory/presentation/model/product_type_model.dart';
import 'package:s_factory/presentation/model/standard_product_model.dart';
import 'package:s_factory/presentation/screens/report/report_bloc/report_bloc.dart';

class ReportDetailModel {
  ReportDetailModel({
    this.id,
    this.code,
    this.poCode,
    this.uniqueCodes,
    this.sampleSerials,
    this.createdAt,
    this.ngCount,
    this.providerCode,
    this.refDocument,
    this.note,
    this.productionAt,
    this.productionCount,
    this.startNo,
    this.endNo,
    this.owner,
    this.status,
    this.stampType,
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

  final POStatus? status;

  final String? stampType;

  final UserModel? owner;

  final ProductTypeModel? productType;

  List<StandardProductModel>? detailStandards;

  List<StandardProductModel>? overviewStandards;

  factory ReportDetailModel.fromEntity({
    ReportDetailEntity? entity,
  }) {
    return ReportDetailModel(
      id: entity?.id,
      code: entity?.code,
      poCode: entity?.poCode,
      createdAt: entity?.createdAt,
      providerCode: entity?.providerCode,
      ngCount: entity?.ngCount,
      refDocument: entity?.refDocument,
      note: entity?.note,
      uniqueCodes: entity?.uniqueCodes,
      sampleSerials: entity?.sampleSerials,
      productionAt: entity?.productionAt,
      productionCount: entity?.productionCount,
      startNo: entity?.startNo,
      endNo: entity?.endNo,
      status: entity?.status?.getPOStatus(),
      stampType: entity?.stampType,
      owner: UserModel.fromEntity(entity: entity?.owner),
      productType: ProductTypeModel.fromEntity(entity: entity?.productType),
      detailStandards: entity?.detailStandards
          ?.map((StandardProductEntity e) => StandardProductModel.fromEntity(
                entity: e,
              ))
          .toList(),
      overviewStandards: entity?.overviewStandards
          ?.map((StandardProductEntity e) => StandardProductModel.fromEntity(
                entity: e,
              ))
          .toList(),
    );
  }
}
