import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:s_factory/extended_text_theme.dart';
import 'package:s_factory/presentation/model/item_inpection_report_model%20.dart';
import 'package:s_factory/presentation/utils/color_constant.dart';

class InfoDetailReportWidget extends StatelessWidget {
  const InfoDetailReportWidget({super.key, required this.item});
  final ItemInpectionReportModel item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: ColorConstant.kNeuTral02,
          ),
        ),
        padding: EdgeInsets.only(left: 44.w),
        child: IntrinsicHeight(
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTitleInfoWidget(
                      context,
                      title: 'Người tạo',
                      value: item.createBy,
                    ),
                    SizedBox(
                      width: 24.w,
                    ),
                    _buildTitleInfoWidget(
                      context,
                      title: 'Ngày tạo',
                      value: item.createAt,
                    ),
                    SizedBox(
                      width: 24.w,
                    ),
                    _buildTitleInfoWidget(
                      context,
                      title: 'Nhà cung cấp',
                      value: item.supplier,
                    ),
                    SizedBox(
                      width: 24.w,
                    ),
                    _buildTitleInfoWidget(
                      context,
                      title: 'Tài liệu tham chiếu',
                      value: item.documentName,
                    ),
                    SizedBox(
                      width: 24.w,
                    ),
                    _buildTitleInfoWidget(
                      context,
                      title: 'Số mẫu',
                      value: item.numberModel,
                    ),
                    SizedBox(
                      width: 24.w,
                    ),
                    _buildTitleInfoWidget(
                      context,
                      title: 'NG',
                      value: item.nG,
                    ),
                    SizedBox(
                      width: 24.w,
                    ),
                    _buildTitleInfoWidget(
                      context,
                      title: 'Ghi chú',
                      value: item.note,
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 67.w),
                decoration: BoxDecoration(
                    color: ColorConstant.kSupportSuccess.withOpacity(
                      0.1,
                    ),
                    border: Border(
                        left: BorderSide(color: ColorConstant.kNeuTral02))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Kết quả:',
                      style: WowTextTheme.ts20w600(context),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Text(
                      'PASS',
                      style: WowTextTheme.ts20w600(context).copyWith(
                        color: ColorConstant.kSupportSuccess,
                        fontSize: 45,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  RichText _buildTitleInfoWidget(
    BuildContext context, {
    String? title,
    String? value,
    Color? colorValue,
  }) {
    return RichText(
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(children: <InlineSpan>[
          TextSpan(
            text: '$title: ',
            style: WowTextTheme.ts16w400(context),
          ),
          TextSpan(
            text: value,
            style: WowTextTheme.ts16w600(context).copyWith(
              color: colorValue,
            ),
          )
        ]));
  }
}
