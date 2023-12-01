import 'package:s_factory/common/extensions/string_extension.dart';
import 'package:s_factory/domain/entities/product/standard_product_entity.dart';
import 'package:s_factory/presentation/screens/report/report_bloc/report_bloc.dart';

class StandardProductModel {
  factory StandardProductModel.fromEntity({
    StandardProductEntity? entity,
  }) {
    return StandardProductModel(
      id: entity?.id,
      name: entity?.name,
      standard: entity?.standard,
      description: entity?.description,
      tool: entity?.tool,
      note: entity?.note,
      type: entity?.type,
      version: entity?.version,
      reviewType: entity?.reviewType,
      result: entity?.result?.getReportStandardResult(),
      ngCount: entity?.ngCount,
      sample: entity?.sample
          ?.map((SampleStandardEntity e) =>
              SampleStandardModel.fromEntity(entity: e))
          .toList(),
    );
  }
  StandardProductModel({
    this.id,
    this.name,
    this.standard,
    this.description,
    this.tool,
    this.type,
    this.version,
    this.reviewType,
    this.value = 0.0,
    this.sample,
    this.ngCount,
    this.note,
    this.result,
  });
  final String? id;
  final String? name;
  final String? standard;
  final String? description;
  final String? tool;
  final String? type;
  final String? version;
  final String? reviewType;
  final String? note;
  final int? ngCount;
  final ReportStandardResult? result;
  final List<SampleStandardModel>? sample;
  final double value;

  StandardProductModel copyWith({
    String? id,
    String? name,
    String? standard,
    String? description,
    String? tool,
    String? type,
    String? version,
    String? reviewType,
    required double value,
  }) =>
      StandardProductModel(
        id: id ?? this.id,
        name: name ?? this.name,
        standard: standard ?? this.standard,
        description: description ?? this.description,
        tool: tool ?? this.tool,
        type: type ?? this.type,
        version: version ?? this.version,
        reviewType: reviewType ?? this.reviewType,
        value: value,
      );
}

class SampleStandardModel {
  factory SampleStandardModel.fromEntity({SampleStandardEntity? entity}) {
    return SampleStandardModel(
      id: entity?.id,
      name: entity?.name,
      standard: entity?.standard,
      description: entity?.description,
      tool: entity?.tool,
      type: entity?.type,
      version: entity?.version,
      reviewType: entity?.reviewType,
      note: entity?.note,
      result: entity?.result?.getReportStandardResult(),
      value: entity?.value,
    );
  }
  SampleStandardModel({
    this.id,
    this.name,
    this.standard,
    this.description,
    this.tool,
    this.type,
    this.version,
    this.reviewType,
    this.note,
    this.result,
    this.value,
  });

  final String? id;

  final String? name;

  final String? standard;

  final String? description;

  final String? tool;

  final String? type;

  final String? version;

  final String? note;

  final String? reviewType;

  final num? value;

  final ReportStandardResult? result;
}
