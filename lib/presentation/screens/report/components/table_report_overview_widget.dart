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
import 'package:s_factory/presentation/model/standard_product_model.dart';
import 'package:s_factory/presentation/screens/report/components/bottom_sheet_components/bs_edit_overview_product_widget.dart';
import 'package:s_factory/presentation/screens/report/report_bloc/report_bloc.dart';
import 'package:s_factory/presentation/services/navigation_service.dart';
import 'package:s_factory/presentation/utils/color_constant.dart';
import 'package:s_factory/presentation/utils/style_constant.dart';

class TableReportOverviewWidget extends StatefulWidget {
  TableReportOverviewWidget({
    super.key,
    required this.listStandard,
  });
  final List<StandardProductModel> listStandard;

  @override
  State<TableReportOverviewWidget> createState() =>
      _TableReportOverviewWidgetState();
}

class _TableReportOverviewWidgetState extends State<TableReportOverviewWidget> {
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
      // padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
          // scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          child: BlocConsumer<ReportBloc, ReportState>(
            listenWhen: (ReportState previous, ReportState current) =>
                previous.updateDataOverViewState !=
                current.updateDataOverViewState,
            listener: (BuildContext context, ReportState state) {
              switch (state.updateDataOverViewState) {
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
              final List<StandardProductReportData> listProductOverView =
                  state.listProductOverView ?? <StandardProductReportData>[];
              final List<String> listSerial = state.listSerial ?? <String>[];
              logi(message: 'listProduct:${listProductOverView.length}');
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: DataTable(
                  headingRowColor: MaterialStateColor.resolveWith(
                    (Set<MaterialState> states) => ColorConstant.kSupportInfo,
                  ),
                  dataRowColor: MaterialStateProperty.all(Colors.green),
                  columnSpacing: 0,
                  horizontalMargin: 0,
                  border: TableBorder.all(
                    color: ColorConstant.kNeuTral02,
                  ),
                  dataRowMaxHeight: listProductOverView
                          .any((StandardProductReportData element) =>
                              (element.standard?.isCountLine(
                                    fontSize: 14,
                                    lineHeight: StyleConstant.kLineHeight2214,
                                    containerWidth: 200.w,
                                  ) ??
                                  0) >=
                              3)
                      ? 125.h
                      : 60.h,
                  columns: <DataColumn>[
                    // _buildTitleTableWidget(context, value: 'STT'),
                    _buildTitleTableWidget(context, value: 'Hạng mục kiểm tra'),
                    _buildTitleTableWidget(context, value: 'Tiêu chuẩn'),
                    _buildTitleTableWidget(context, value: 'Mẫu NG'),
                    _buildTitleTableWidget(context, value: 'Ghi chú'),
                    _buildTitleTableWidget(context, value: 'Kết quả'),
                    _buildTitleTableWidget(context, value: 'Công cụ đo'),
                  ],
                  rows: List<DataRow>.generate(
                    listProductOverView.length,
                    (int index) => _buildDataRow(
                      index,
                      listProductOverView[index],
                    ),
                  ),
                ),
              );
            },
          )),
    );
  }

  DataRow _buildDataRow(int index, StandardProductReportData data) {
    return DataRow(
      color: MaterialStateColor.resolveWith(
        (Set<MaterialState> states) => ColorConstant.kSupportInfo,
      ),
      cells: <DataCell>[
        // _buildValueTableWidget(
        //   context,
        //   value: '${data.type}0${index + 1}',
        //   bgColor: ColorConstant.kSupportInfo,
        // ),
        _buildValueTableWidget(
          context,
          value: data.name.clearSpace() ?? '',
          bgColor: ColorConstant.kSupportInfo,
        ),
        _buildValueTableWidget(
          context,
          value: data.standard.clearSpace() ?? '',
          bgColor: ColorConstant.kSupportInfo,
          width: 600.w,
        ),
        _buildValueTableWidget(
          context,
          value: data.ngCount ?? '',
          bgColor: ColorConstant.kWhite,
          onTap: () {
            getIt<NavigationService>().openBottomSheet(
                widget: BSEditOverviewProductWidget(
              note: data.note ?? '',
              currentStatus: data.result,
              onTapConfirm:
                  (String? ngCount, String? note, ReportStandardResult? p0) {
                _reportBloc.add(UpdateValueProductOverViewEvent(
                  standardId: data.id,
                  status: p0,
                  note: note ?? '',
                  ngCount: ngCount,
                ));
              },
              ngCount: data.ngCount ?? '',
            ));
          },
        ),
        _buildValueTableWidget(
          context,
          value: data.note ?? '',
          bgColor: ColorConstant.kWhite,
          width: 400.w,
          onTap: () {
            getIt<NavigationService>().openBottomSheet(
                widget: BSEditOverviewProductWidget(
              note: data.note ?? '',
              currentStatus: data.result ?? ReportStandardResult.pass,
              onTapConfirm:
                  (String? ngCount, String? note, ReportStandardResult? p0) {
                _reportBloc.add(UpdateValueProductOverViewEvent(
                  standardId: data.id,
                  status: p0,
                  note: note ?? '',
                  ngCount: ngCount,
                ));
              },
              ngCount: data.ngCount ?? '0',
            ));
          },
        ),
        _buildPOStatusCellWidget(
          context,
          value: data.result?.value ?? '',
          bgColor: ColorConstant.kWhite,
          isPass: data.result,
          onTap: () {
            getIt<NavigationService>().openBottomSheet(
                widget: BSEditOverviewProductWidget(
              note: data.note ?? '',
              currentStatus: data.result ?? ReportStandardResult.pass,
              onTapConfirm:
                  (String? ngCount, String? note, ReportStandardResult? p0) {
                _reportBloc.add(UpdateValueProductOverViewEvent(
                  standardId: data.id,
                  status: p0,
                  note: note,
                  ngCount: ngCount,
                ));
              },
              ngCount: data.ngCount ?? '0',
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
          width: 200.w,
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
    Function()? onTap,
    double? width,
  }) =>
      DataCell(
        Container(
          width: width,
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
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
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
