import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:s_factory/common/configs/logger_config.dart';
import 'package:s_factory/common/constant/enum.dart';
import 'package:s_factory/common/di/app_injector.dart';
import 'package:s_factory/common/extensions/string_extension.dart';
import 'package:s_factory/extended_text_theme.dart';
import 'package:s_factory/presentation/app/app_bloc.dart';
import 'package:s_factory/presentation/app/app_event.dart';
import 'package:s_factory/presentation/data/product_report_data.dart';
import 'package:s_factory/presentation/screens/history/report_detail/components/table_detail_report_detail_widget.dart';
import 'package:s_factory/presentation/screens/report/components/bottom_sheet_components/bs_edit_detail_product_widget.dart';
import 'package:s_factory/presentation/screens/report/components/bottom_sheet_components/bs_select_standard_status_widget.dart';
import 'package:s_factory/presentation/screens/report/report_bloc/report_bloc.dart';
import 'package:s_factory/presentation/services/navigation_service.dart';
import 'package:s_factory/presentation/utils/color_constant.dart';

class TableReportDetailWidget extends StatefulWidget {
  const TableReportDetailWidget({
    super.key,
    this.listSerial,
  });

  final List<String>? listSerial;

  @override
  State<TableReportDetailWidget> createState() =>
      _TableReportDetailWidgetState();
}

class _TableReportDetailWidgetState extends State<TableReportDetailWidget> {
  late ReportBloc _reportBloc;
  @override
  void initState() {
    super.initState();
    _reportBloc = context.read();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorConstant.kWhite,
      width: double.infinity,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        child: BlocConsumer<ReportBloc, ReportState>(
          listenWhen: (ReportState previous, ReportState current) =>
              previous.updateDataDetailState != current.updateDataDetailState,
          listener: (BuildContext context, ReportState state) {
            switch (state.updateDataDetailState) {
              case LoadState.loading:
                context.read<AppBloc>().add(OnShowLoadingEvent());
                break;
              case LoadState.failure:
                context.read<AppBloc>().add(OnHideLoadingEvent());
                getIt<NavigationService>().pop();
                break;
              case LoadState.success:
                context.read<AppBloc>().add(OnHideLoadingEvent());
                getIt<NavigationService>().pop();
                break;
              default:
            }
          },
          builder: (BuildContext context, ReportState state) {
            final List<StandardProductReportData> listProduct =
                state.listProductDetail ?? <StandardProductReportData>[];
            logi(message: 'listProduct:${listProduct.length}');
            return DataTable(
              headingRowColor: MaterialStateColor.resolveWith(
                (Set<MaterialState> states) => ColorConstant.kSupportInfo,
              ),
              dataRowColor: MaterialStateProperty.all(Colors.green),
              columnSpacing: 0,
              horizontalMargin: 0,
              border: TableBorder.all(
                color: ColorConstant.kNeuTral02,
              ),
              columns: <DataColumn>[
                _buildTitleTableWidget(context, value: 'STT'),
                _buildTitleTableWidget(context, value: 'Hạng mục kiểm tra'),
                _buildTitleTableWidget(context, value: 'Tiêu chuẩn'),
                ...List<DataColumn>.generate(widget.listSerial?.length ?? 0,
                    ((int index) {
                  return _buildTitleTableWidget(context,
                      value: 'M-${index + 1}');
                })),
                _buildTitleTableWidget(context, value: 'Kết quả'),
                _buildTitleTableWidget(context, value: 'Công cụ đo'),
              ],
              rows: List<DataRow>.generate(
                listProduct.length,
                (int index) => _buildDataRow(
                  index,
                  listProduct[index],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  DataRow _buildDataRow(int index, StandardProductReportData data) {
    final List<StandardValueData> listStandardValue =
        data.listStandardValue ?? <StandardValueData>[];
    return DataRow(
      color: MaterialStateColor.resolveWith(
        (Set<MaterialState> states) => ColorConstant.kSupportInfo,
      ),
      cells: <DataCell>[
        _buildValueTableWidget(
          context,
          value: '${data.type}0${index + 1}',
          bgColor: ColorConstant.kSupportInfo,
        ),
        _buildValueTableWidget(
          context,
          value: data.name ?? '',
          bgColor: ColorConstant.kSupportInfo,
        ),
        _buildValueTableWidget(
          context,
          value: data.standard ?? '',
          bgColor: ColorConstant.kSupportInfo,
        ),
        ...List<DataCell>.generate(
          listStandardValue.length,
          (int index) {
            final String value =
                (listStandardValue[index].value ?? 0).toString();
            final ReportStandardResult? result =
                listStandardValue[index].result;

            final String? newValue = value.isNotEmpty == true
                ? value
                : value != '0.0' || value != '0'
                    ? value
                    : result?.value;
            return _buildValueTableWidget(
              context,
              isPass: listStandardValue[index].result,
              value: '$newValue',
              note: listStandardValue[index].note,
              bgColor: ColorConstant.kWhite,
              onTap: () {
                getIt<NavigationService>().openBottomSheet(
                  widget: InputEditValueWidget(
                    value: (listStandardValue[index].value ?? 0.0).toString(),
                    result: listStandardValue[index].result ??
                        ReportStandardResult.pass,
                    note: listStandardValue[index].note ?? null,
                    onTapConfirm: (
                      String? p0,
                      ReportStandardResult? result,
                      String? note,
                    ) {
                      logi(message: 'note:${note?.isEmpty}');
                      _reportBloc.add(UpdateValueProductDetailEvent(
                          value: p0,
                          standardId: data.id,
                          serial: listStandardValue[index].serial,
                          result: result,
                          note: note));
                    },
                  ),
                );
              },
            );
          },
        ),
        _buildPOStatusCellWidget(
          context,
          value: data.result?.value ?? '',
          bgColor: ColorConstant.kWhite,
          isPass: data.result,
          onTap: () {
            getIt<NavigationService>().openBottomSheet(
                widget: BSSelectStandardStatusWidget(
              currentStatus: data.result ?? ReportStandardResult.pass,
              onTapConfirm: (ReportStandardResult? p0) {
                _reportBloc.add(UpdatePOStatusEvent(
                  result: p0,
                  standardId: data.id,
                ));
              },
            ));
          },
        ),
        _buildValueTableWidget(
          context,
          value: data.tool ?? '',
          bgColor: ColorConstant.kSupportInfo,
        ),
      ],
    );
  }

  DataColumn _buildTitleTableWidget(
    BuildContext context, {
    required String value,
  }) =>
      DataColumn(
        label: Container(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          alignment: Alignment.center,
          child: Text(
            value,
            style: WowTextTheme.ts14w600(context),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      );

  DataCell _buildValueTableWidget(
    BuildContext context, {
    Color? bgColor,
    ReportStandardResult? isPass,
    required String value,
    String? note,
    Function()? onTap,
  }) =>
      DataCell(
        Tooltip(
          triggerMode: TooltipTriggerMode.longPress,
          enableFeedback: false,
          message: note ?? '',
          child: Container(
            foregroundDecoration: note?.isNotNullOrEmpty == true
                ? const BadgeDecoration(
                    badgeColor: ColorConstant.kSupportWarning,
                    badgeSize: 15,
                  )
                : null,
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            color: bgColor,
            child: SizedBox.expand(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  value,
                  style: WowTextTheme.ts14w400(context).copyWith(
                      color: isPass != null
                          ? isPass == ReportStandardResult.fail
                              ? ColorConstant.kSupportError2
                              : ColorConstant.kSupportSuccess
                          : null),
                  textAlign: TextAlign.start,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
        ),
        onTap: onTap,
      );

  DataCell _buildPOStatusCellWidget(
    BuildContext context, {
    Color? bgColor,
    ReportStandardResult? isPass,
    required String value,
    Function()? onTap,
  }) =>
      DataCell(
        Container(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          color: bgColor,
          child: SizedBox.expand(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                value,
                style: WowTextTheme.ts14w400(context).copyWith(
                    color: isPass == ReportStandardResult.fail
                        ? ColorConstant.kSupportError2
                        : ColorConstant.kSupportSuccess),
                textAlign: TextAlign.start,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ),
        onTap: onTap,
      );
}
