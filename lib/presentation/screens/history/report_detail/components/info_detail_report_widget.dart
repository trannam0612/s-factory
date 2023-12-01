import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:s_factory/extended_text_theme.dart';
import 'package:s_factory/presentation/model/auth/user_model.dart';
import 'package:s_factory/presentation/screens/history/report_detail/bloc/report_detail_bloc.dart';
import 'package:s_factory/presentation/screens/report/report_bloc/report_bloc.dart';
import 'package:s_factory/presentation/utils/color_constant.dart';
import 'package:s_factory/presentation/utils/strings_constant.dart';

class InfoDetailReportWidget extends StatelessWidget {
  const InfoDetailReportWidget({
    super.key,
  });

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
                    BlocBuilder<ReportDetailBloc, ReportDetailState>(
                      builder: (BuildContext context, ReportDetailState state) {
                        final UserModel? owner = state.reportDetailModel?.owner;
                        return _buildTitleInfoWidget(
                          context,
                          title: 'Người tạo',
                          value: owner?.fullName,
                        );
                      },
                    ),
                    SizedBox(
                      width: 24.w,
                    ),
                    BlocBuilder<ReportDetailBloc, ReportDetailState>(
                      builder: (BuildContext context, ReportDetailState state) {
                        final int? createdAt =
                            state.reportDetailModel?.createdAt;
                        return _buildTitleInfoWidget(
                          context,
                          title: 'Ngày tạo',
                          value: createdAt.toString(),
                        );
                      },
                    ),
                    SizedBox(
                      width: 24.w,
                    ),
                    BlocBuilder<ReportDetailBloc, ReportDetailState>(
                      builder: (BuildContext context, ReportDetailState state) {
                        final String providerCode =
                            state.reportDetailModel?.providerCode ??
                                kUndefinedString;
                        return _buildTitleInfoWidget(
                          context,
                          title: 'Nhà cung cấp',
                          value: providerCode,
                        );
                      },
                    ),
                    SizedBox(
                      width: 24.w,
                    ),
                    BlocBuilder<ReportDetailBloc, ReportDetailState>(
                      builder: (BuildContext context, ReportDetailState state) {
                        final String refDocument =
                            state.reportDetailModel?.refDocument ??
                                kUndefinedString;
                        return _buildTitleInfoWidget(
                          context,
                          title: 'Tài liệu tham chiếu',
                          value: refDocument,
                        );
                      },
                    ),
                    SizedBox(
                      width: 24.w,
                    ),
                    BlocBuilder<ReportDetailBloc, ReportDetailState>(
                      builder: (BuildContext context, ReportDetailState state) {
                        final String totalModel =
                            (state.reportDetailModel?.sampleSerials?.length ??
                                    0)
                                .toString();
                        return _buildTitleInfoWidget(
                          context,
                          title: 'Số mẫu',
                          value: totalModel,
                        );
                      },
                    ),
                    SizedBox(
                      width: 24.w,
                    ),
                    BlocBuilder<ReportDetailBloc, ReportDetailState>(
                      builder: (BuildContext context, ReportDetailState state) {
                        final int ngCount =
                            state.reportDetailModel?.ngCount ?? 0;
                        return _buildTitleInfoWidget(
                          context,
                          title: 'NG',
                          value: ngCount.toString(),
                        );
                      },
                    ),
                    SizedBox(
                      width: 24.w,
                    ),
                    BlocBuilder<ReportDetailBloc, ReportDetailState>(
                      builder: (BuildContext context, ReportDetailState state) {
                        final String note =
                            state.reportDetailModel?.note ?? kUndefinedString;
                        return _buildTitleInfoWidget(
                          context,
                          title: 'Ghi chú',
                          value: note,
                        );
                      },
                    ),
                  ],
                ),
              ),
              BlocBuilder<ReportDetailBloc, ReportDetailState>(
                builder: (BuildContext context, ReportDetailState state) {
                  final POStatus? status = state.reportDetailModel?.status;
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 67.w),
                    decoration: BoxDecoration(
                        color: status?.color?.withOpacity(
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
                          status?.title ?? '',
                          style: WowTextTheme.ts20w600(context).copyWith(
                            color: status?.color,
                            fontSize: 45,
                          ),
                        )
                      ],
                    ),
                  );
                },
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
