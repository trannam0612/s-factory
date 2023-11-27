import 'package:s_factory/presentation/screens/report/report_bloc/report_bloc.dart';

class StandardProductReportData {
  StandardProductReportData({
    this.id,
    this.name,
    this.standard,
    this.description,
    this.tool,
    this.type,
    this.version,
    this.reviewType,
    this.listStandardValue,
    this.result = true,
  });

  // factory ProductTypeModel.fromEntity({ProductTypeEntity? entity}) {
  //   return ProductTypeModel(
  //     id: entity?.id,
  //     code: entity?.code,
  //     name: entity?.name,
  //     unitCode: entity?.unitCode,
  //     unitName: entity?.unitName,
  //     standardImageUrls: entity?.standardImageUrls,
  //     detailStandards: entity?.detailStandards
  //         ?.map(
  //           (StandardProductEntity e) => StandardProductModel.fromEntity(
  //             entity: e,
  //           ),
  //         )
  //         .toList(),
  //     overviewStandards: entity?.overviewStandards
  //         ?.map(
  //           (StandardProductEntity e) => StandardProductModel.fromEntity(
  //             entity: e,
  //           ),
  //         )
  //         .toList(),
  //   );
  // }
  final String? id;
  final String? name;
  final String? standard;
  final String? description;
  final String? tool;
  final String? type;
  final String? version;
  final String? reviewType;
  final bool? result;
  final List<StandardValueData>? listStandardValue;

  StandardProductReportData copyWith({
    String? id,
    String? name,
    String? standard,
    String? description,
    String? tool,
    String? type,
    String? version,
    String? reviewType,
    bool? result,
    List<StandardValueData>? listStandardValue,
  }) {
    return StandardProductReportData(
      id: id ?? this.id,
      name: name ?? this.name,
      standard: standard ?? this.standard,
      description: description ?? this.description,
      tool: tool ?? this.tool,
      type: type ?? this.type,
      version: version ?? this.version,
      reviewType: reviewType ?? this.reviewType,
      result: result ?? this.result,
      listStandardValue: listStandardValue ?? this.listStandardValue,
    );
  }
}

class StandardValueData {
  StandardValueData({
    this.serial,
    this.value,
    this.result = ReportStandardResult.pass,
  });

  final String? serial;
  final dynamic value;
  final ReportStandardResult? result;

  bool get isPass => result == ReportStandardResult.pass;
  String get getValue => value != null
      ? value.toString()
      : result == ReportStandardResult.pass
          ? ReportStandardResult.pass.value ?? ''
          : ReportStandardResult.fail.value ?? '';

  StandardValueData copyWith({
    String? serial,
    dynamic value,
    ReportStandardResult? result,
  }) {
    return StandardValueData(
      serial: serial ?? this.serial,
      value: value ?? this.value,
      result: result ?? this.result,
    );
  }
}
