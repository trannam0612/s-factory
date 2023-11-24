import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:s_factory/extended_text_theme.dart';
import 'package:s_factory/presentation/model/production_order_model.dart';
import 'package:s_factory/presentation/utils/assets.dart';

class BasicInfoWidget extends StatelessWidget {
  const BasicInfoWidget({
    super.key,
    this.productionOrder,
  });
  final ProductionOrderModel? productionOrder;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            SvgPaths.icArrowLeft,
          ),
        ),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                productionOrder?.nameAndCode ?? '',
                style: WowTextTheme.ts24w600(context),
              ),
              SizedBox(
                height: 12.h,
              ),
              Row(
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          children: [],
                          text: productionOrder?.poCode ?? '',
                          style: WowTextTheme.ts16w600(context),
                        ),
                      ],
                      text: 'P0: ',
                      style: WowTextTheme.ts16w400(context),
                    ),
                  ),
                  SizedBox(
                    width: 24.w,
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: productionOrder?.lot.toString(),
                          style: WowTextTheme.ts16w600(context),
                        ),
                      ],
                      text: 'Lot: ',
                      style: WowTextTheme.ts16w400(context),
                    ),
                  ),
                  SizedBox(
                    width: 24.w,
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'S2/0.65//G2/4.0',
                          style: WowTextTheme.ts16w600(context),
                        ),
                      ],
                      text: 'AQL: ',
                      style: WowTextTheme.ts16w400(context),
                    ),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
