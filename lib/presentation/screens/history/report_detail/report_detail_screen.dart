import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:s_factory/presentation/model/item_inpection_report_model%20.dart';
import 'package:s_factory/presentation/screens/history/report_detail/components/detail_report_info_widget.dart';
import 'package:s_factory/presentation/screens/history/report_detail/components/info_basic_report_widget.dart';
import 'package:s_factory/presentation/screens/history/report_detail/components/info_detail_report_widget.dart';
import 'package:s_factory/presentation/screens/history/report_detail/components/technical_drawing_report_widget.dart';
import 'package:s_factory/presentation/utils/assets.dart';
import 'package:s_factory/presentation/utils/color_constant.dart';
import 'package:s_factory/presentation/widgets/s_appbar_widget.dart';
import 'package:s_factory/presentation/widgets/s_cricel_avatar_widget.dart';
import 'package:s_factory/presentation/widgets/s_scaffold_widget.dart';

class ReportDetailScreen extends StatelessWidget {
  const ReportDetailScreen({
    super.key,
    required this.item,
  });
  static const String pathRoute = 'reportDetailRoute';

  final ItemInpectionReportModel item;

  @override
  Widget build(BuildContext context) {
    return SScaffoldWidget(
      appBar: SAppBarWidget(
        leading: Padding(
          padding: EdgeInsets.only(left: 24.w),
          child: SvgPicture.asset(
            SvgPaths.icLogo,
          ),
        ),
        leadingWidth: 150.w,
        action: [
          Padding(
            padding: EdgeInsets.all(12.w),
            child: Container(
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  32.w,
                ),
                color: ColorConstant.kPrimary02,
              ),
              child: Row(
                children: [
                  SCricleAvatarWidget(
                    size: 32.w,
                    urlImage:
                        'https://st.quantrimang.com/photos/image/2021/08/16/Anh-vit-cute-6.jpg',
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  SvgPicture.asset(SvgPaths.icMenu)
                ],
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: <Widget>[
            InfoBasicReportWidget(
              item: item,
            ),
            SizedBox(
              height: 24.h,
            ),
            InfoDetailReportWidget(
              item: item,
            ),
            SizedBox(
              height: 32.h,
            ),
            const TechnicalDrawingReportWidget(),
            SizedBox(
              height: 32.h,
            ),
            DetailReportInfoWidget(),
            SizedBox(
              height: 32.h,
            ),
          ],
        ),
      ),
    );
  }
}
