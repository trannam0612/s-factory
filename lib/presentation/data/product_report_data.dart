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
    this.note,
    this.ngCount,
    this.result = ReportStandardResult.pass,
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
  final String? note;
  final String? ngCount;
  final ReportStandardResult? result;
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
    String? note,
    String? ngCount,
    ReportStandardResult? result,
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
      note: note ?? this.note,
      ngCount: ngCount ?? this.ngCount,
      listStandardValue: listStandardValue ?? this.listStandardValue,
    );
  }
}

class StandardValueData {
  StandardValueData({
    this.serial,
    this.value,
    this.result,
    this.ngCount,
    this.note,
  });

  final String? serial;
  final double? value;
  final ReportStandardResult? result;
  final int? ngCount;
  final String? note;

  bool get isPass => result == ReportStandardResult.pass;
  String get getValue => value != null
      ? value.toString()
      : result == ReportStandardResult.pass
          ? ReportStandardResult.pass.value ?? ''
          : ReportStandardResult.fail.value ?? '';

  StandardValueData copyWith({
    String? serial,
    double? value,
    String? note,
    int? ngCount,
    ReportStandardResult? result,
  }) {
    return StandardValueData(
      serial: serial ?? this.serial,
      value: value ?? this.value,
      result: result ?? this.result,
      note: note ?? this.note,
      ngCount: ngCount ?? this.ngCount,
    );
  }
}
