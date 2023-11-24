import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:s_factory/presentation/screens/history/list_history_report/components/input_search_widget.dart';
import 'package:s_factory/presentation/screens/history/list_history_report/components/list_result_report_widget.dart';
import 'package:s_factory/presentation/utils/assets.dart';
import 'package:s_factory/presentation/utils/color_constant.dart';
import 'package:s_factory/presentation/widgets/s_appbar_widget.dart';
import 'package:s_factory/presentation/widgets/s_back_button_widget%20.dart';
import 'package:s_factory/presentation/widgets/s_cricel_avatar_widget.dart';
import 'package:s_factory/presentation/widgets/s_scaffold_widget.dart';

class ListHistoryReportScreen extends StatelessWidget {
  const ListHistoryReportScreen({super.key});
  static const String pathRoute = 'listHistoryReportRoute';

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
      body: Column(
        children: <Widget>[
          Container(
            color: ColorConstant.kSupportInfo,
            padding: EdgeInsets.symmetric(vertical: 36.h, horizontal: 16.w),
            child: Column(
              children: [
                const SBackButtonWidget(
                  title: 'Lịch sử báo cáo',
                ),
                SizedBox(
                  height: 24.h,
                ),
                const InputSearchWidget()
              ],
            ),
          ),
          ListResultReportWidget()
        ],
      ),
    );
  }
}
