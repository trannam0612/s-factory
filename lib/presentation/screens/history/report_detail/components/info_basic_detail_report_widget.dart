import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:s_factory/extended_text_theme.dart';
import 'package:s_factory/presentation/model/list_report_history_po_model.dart';
import 'package:s_factory/presentation/screens/history/report_detail/bloc/report_detail_bloc.dart';
import 'package:s_factory/presentation/widgets/s_back_button_widget%20.dart';

class InfoBasicReportWidget extends StatelessWidget {
  const InfoBasicReportWidget({
    super.key,
    this.poReportModel,
  });
  final POReportModel? poReportModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        BlocBuilder<ReportDetailBloc, ReportDetailState>(
          builder: (BuildContext context, ReportDetailState state) {
            final String? nameProduct =
                state.reportDetailModel?.productType?.name;
            final String? po = state.reportDetailModel?.poCode;
            return SBackButtonWidget(
              title: '$po - $nameProduct',
            );
          },
        ),
        SizedBox(
          height: 10.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 60.w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: BlocBuilder<ReportDetailBloc, ReportDetailState>(
                  builder: (BuildContext context, ReportDetailState state) {
                    final String? po = state.reportDetailModel?.poCode;

                    return _buildTitleInfoWidget(
                      context,
                      title: 'PO',
                      value: po,
                    );
                  },
                ),
              ),
              SizedBox(
                width: 24.w,
              ),
              BlocBuilder<ReportDetailBloc, ReportDetailState>(
                builder: (BuildContext context, ReportDetailState state) {
                  final int? lot = state.reportDetailModel?.productionCount;
                  return _buildTitleInfoWidget(
                    context,
                    title: 'Lot',
                    value: lot.toString(),
                  );
                },
              ),
              // SizedBox(
              //   width: 24.w,
              // ),
              // _buildTitleInfoWidget(
              //   context,
              //   title: 'AQL',
              //   value: item.status,
              //   colorValue: ColorConstant.kSupportSuccess,
              // ),
              SizedBox(
                width: 24.w,
              ),
              BlocBuilder<ReportDetailBloc, ReportDetailState>(
                builder: (BuildContext context, ReportDetailState state) {
                  final String? code = state.reportDetailModel?.code;
                  return _buildTitleInfoWidget(
                    context,
                    title: 'Mã số',
                    value: code,
                  );
                },
              ),
              // SizedBox(
              //   width: 24.w,
              // ),
              // Container(
              //   padding: EdgeInsets.all(8.w),
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(4.w),
              //     color: ColorConstant.kSupportSuccess.withOpacity(0.1),
              //   ),
              //   child: Text(
              //     item.status ?? '',
              //     style: WowTextTheme.ts12w600(context).copyWith(
              //       color: ColorConstant.kSupportSuccess,
              //     ),
              //   ),
              // ),
            ],
          ),
        )
      ],
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
