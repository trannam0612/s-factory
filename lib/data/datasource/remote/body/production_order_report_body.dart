import 'package:json_annotation/json_annotation.dart';

part 'production_order_report_body.g.dart';

@JsonSerializable()
class POReportArgs {
  POReportArgs({
    this.poId,
    this.providerCode,
    this.refDocument,
    this.sampleSerials,
    this.note,
    this.ngCount,
    this.poStatus,
    this.standards,
  });

  factory POReportArgs.fromJson(Map<String, dynamic> json) =>
      _$POReportArgsFromJson(json);
  @JsonKey(name: 'poId')
  final String? poId;
  @JsonKey(name: 'providerCode')
  final String? providerCode;
  @JsonKey(name: 'refDocument')
  final String? refDocument;
  @JsonKey(name: 'sampleSerials')
  final List<String>? sampleSerials;
  @JsonKey(name: 'note')
  final String? note;
  @JsonKey(name: 'ngCount')
  final int? ngCount;
  @JsonKey(name: 'poStatus')
  final String? poStatus;
  @JsonKey(name: 'standards')
  final List<Standard>? standards;

  Map<String, dynamic> toJson() => _$POReportArgsToJson(this);
  POReportArgs copyWith({
    String? poId,
    String? providerCode,
    String? refDocument,
    List<String>? sampleSerials,
    String? note,
    int? ngCount,
    String? poStatus,
    List<Standard>? standards,
  }) {
    return POReportArgs(
      poId: poId ?? this.poId,
      providerCode: providerCode ?? this.providerCode,
      refDocument: refDocument ?? this.refDocument,
      sampleSerials: sampleSerials ?? this.sampleSerials,
      note: note ?? this.note,
      ngCount: ngCount ?? this.ngCount,
      poStatus: poStatus ?? this.poStatus,
      standards: standards ?? this.standards,
    );
  }
}

@JsonSerializable()
class Standard {
  Standard({
    this.standardId,
    this.sampleStandards,
    this.result,
    this.ngCount,
    this.note,
  });

  factory Standard.fromJson(Map<String, dynamic> json) =>
      _$StandardFromJson(json);
  @JsonKey(name: 'standardId')
  final String? standardId;
  @JsonKey(name: 'sampleStandards')
  final List<SampleStandard>? sampleStandards;
  @JsonKey(name: 'result')
  final String? result;
  @JsonKey(name: 'ngCount')
  final int? ngCount;
  @JsonKey(name: 'note')
  final String? note;

  Map<String, dynamic> toJson() => _$StandardToJson(this);
}

@JsonSerializable()
class SampleStandard {
  SampleStandard({
    this.serial,
    this.result,
    this.value,
    this.note,
  });

  factory SampleStandard.fromJson(Map<String, dynamic> json) =>
      _$SampleStandardFromJson(json);
  @JsonKey(name: 'serial')
  final String? serial;
  @JsonKey(name: 'result')
  final String? result;
  @JsonKey(name: 'value')
  final double? value;
  @JsonKey(name: 'note')
  final String? note;

  Map<String, dynamic> toJson() => _$SampleStandardToJson(this);
}
