import 'package:s_factory/data/datasource/remote/responses/product/production_order_report_response.dart';

class ProductionOrderReportEntity {
  ProductionOrderReportEntity({
    this.id,
    this.code,
    this.poCode,
    this.uniqueCodes,
    this.productionAt,
    this.productionCount,
    this.startNo,
    this.endNo,
    this.status,
    this.stampType,
    this.providerCode,
    this.refDocument,
    this.sampleCount,
    this.note,
    this.ngCount,
  });

  factory ProductionOrderReportEntity.fromResponse(
      {ProductionOrderReportResponse? response}) {
    return ProductionOrderReportEntity(
      id: response?.id,
      code: response?.code,
      poCode: response?.poCode,
      uniqueCodes: response?.uniqueCodes,
      productionAt: response?.productionAt,
      productionCount: response?.productionCount,
      startNo: response?.startNo,
      endNo: response?.endNo,
      status: response?.status,
      stampType: response?.stampType,
      providerCode: response?.providerCode,
      refDocument: response?.refDocument,
      sampleCount: response?.sampleCount,
      note: response?.note,
      ngCount: response?.ngCount,
    );
  }
  String? id;

  String? code;

  String? poCode;

  List<String>? uniqueCodes;

  int? productionAt;

  int? productionCount;

  int? startNo;

  int? endNo;

  String? status;

  String? stampType;

  String? providerCode;

  String? refDocument;

  int? sampleCount;

  String? note;

  int? ngCount;
}
