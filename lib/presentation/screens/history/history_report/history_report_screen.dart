import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:s_factory/presentation/model/item_history_report_model.dart';
import 'package:s_factory/presentation/screens/history/history_report/components/info_overview_history_report_widget.dart';
import 'package:s_factory/presentation/screens/history/history_report/components/list_inpection_report_widget.dart';
import 'package:s_factory/presentation/utils/assets.dart';
import 'package:s_factory/presentation/utils/color_constant.dart';
import 'package:s_factory/presentation/widgets/s_appbar_widget.dart';
import 'package:s_factory/presentation/widgets/s_cricel_avatar_widget.dart';
import 'package:s_factory/presentation/widgets/s_scaffold_widget.dart';

class HistoryReportScreen extends StatelessWidget {
  HistoryReportScreen({
    super.key,
    required this.item,
  });
  static const String pathRoute = 'historyReportRoute';

  final ItemHistoryReportModel item;

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
        action: <Widget>[
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
                children: <Widget>[
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          InfoOverviewHistoryReportWidget(
            item: item,
          ),
          SizedBox(
            height: 32.h,
          ),
          ListInpectionReportWidget()
        ],
      ),
    );
  }
}
