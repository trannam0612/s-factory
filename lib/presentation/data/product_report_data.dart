import 'package:s_factory/presentation/model/standard_product_model.dart';

class ProductReportData {
  ProductReportData({
    this.serial,
    this.listStandard,
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

  final String? serial;
  final List<StandardProductModel>? listStandard;

  ProductReportData copyWith({
    String? serial,
    List<StandardProductModel>? listStandard,
  }) {
    return ProductReportData(
      serial: serial ?? this.serial,
      listStandard: listStandard ?? this.listStandard,
    );
  }
}
