import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:s_factory/extended_text_theme.dart';
import 'package:s_factory/presentation/model/item_product_model.dart';
import 'package:s_factory/presentation/screens/home/blocs/home_bloc/home_bloc.dart';
import 'package:s_factory/presentation/utils/assets.dart';
import 'package:s_factory/presentation/utils/color_constant.dart';

class ProductModelWidget extends StatelessWidget {
  const ProductModelWidget({
    super.key,
    this.item,
  });
  final ProductModel? item;

  @override
  Widget build(BuildContext context) {
    final HomeBloc _homeBloc = context.read();
    return Container(
        padding: EdgeInsets.all(24.w),
        decoration: BoxDecoration(
          border: Border.all(
            color: ColorConstant.kNeuTral02,
          ),
          color: ColorConstant.kWhite,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  _buidlItemTitleWidget(
                    context,
                    title: 'Tên sản phẩm',
                    value: item?.productName,
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  _buidlItemTitleWidget(
                    context,
                    title: 'Mã sản phẩm',
                    value: item?.productTypeCode,
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  _buidlItemTitleWidget(
                    context,
                    title: 'Serial',
                    value: item?.uniqueCode,
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  _buidlItemTitleWidget(
                    context,
                    title: 'PO',
                    value: item?.poCode,
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  _buidlItemTitleWidget(
                    context,
                    title: 'Lot',
                    value: item?.lot.toString(),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                _homeBloc.add(RemoveProductModelEvent(
                  itemProductModel: item,
                ));
              },
              child: Container(
                padding: EdgeInsets.all(26.w),
                decoration: const BoxDecoration(
                  color: ColorConstant.kSupportError,
                ),
                child: SvgPicture.asset(SvgPaths.icClose),
              ),
            )
          ],
        ));
  }

  Row _buidlItemTitleWidget(
    BuildContext context, {
    required String title,
    String? value,
  }) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Text(
            title,
            maxLines: 1,
            style: WowTextTheme.ts16w600(context).copyWith(
              color: ColorConstant.kTextColor2,
            ),
          ),
        ),
        SizedBox(
          width: 12.w,
        ),
        Expanded(
          flex: 6,
          child: Text(
            value ?? '',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: WowTextTheme.ts16w600(context),
          ),
        ),
      ],
    );
  }
}
