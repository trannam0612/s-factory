import 'package:s_factory/data/datasource/remote/responses/product/report_detail_response.dart';
import 'package:s_factory/data/mapper/base_mapper.dart';
import 'package:s_factory/domain/entities/product/report_detail_entity.dart';

class ReportDetailResponseMapper
    extends BaseMapper<ReportDetailEntity, ReportDetailResponse> {
  @override
  ReportDetailEntity call(ReportDetailResponse? response) {
    return ReportDetailEntity.fromResponse(
      response: response,
    );
  }
}
