import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:s_factory/common/configs/logger_config.dart';
import 'package:s_factory/common/constant/enum.dart';
import 'package:s_factory/common/di/app_injector.dart';
import 'package:s_factory/extended_text_theme.dart';
import 'package:s_factory/presentation/app/app_bloc.dart';
import 'package:s_factory/presentation/app/app_event.dart';
import 'package:s_factory/presentation/data/product_report_data.dart';
import 'package:s_factory/presentation/screens/report/components/input_edit_value_widget.dart';
import 'package:s_factory/presentation/screens/report/report_bloc/report_bloc.dart';
import 'package:s_factory/presentation/services/navigation_service.dart';
import 'package:s_factory/presentation/utils/color_constant.dart';

class TableReportDetailWidget extends StatefulWidget {
  TableReportDetailWidget({
    super.key,
  });

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

  DataRow _resultsAPI(index, StandardProductReportData data) {
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
          (int index) => _buildValueTableWidget(
            context,
            isPass: listStandardValue[index].isPass,
            value: listStandardValue[index].value.toString(),
            bgColor: ColorConstant.kWhite,
            onTap: () {
              getIt<NavigationService>().openBottomSheet(
                widget: InputEditValueWidget(
                  value: listStandardValue[index].getValue,
                  onTapConfirm: (String? p0, ReportStandardResult? result) {
                    logi(message: 'message:$p0-----$result');
                    // _reportBloc.add(UpdateValueProductEvent(
                    //   value: listStandardValue[index].getValue,
                    //   standardId: data.id,
                    //   serial: listStandardValue[index].serial,
                    //   result: result,
                    // ));
                  },
                ),
              );
            },
          ),
        ),
        _buildValueTableWidget(
          context,
          value: data.result == true ? 'PASS' : 'FAIL',
          bgColor: ColorConstant.kSupportInfo,
          isPass: data.result,
        ),
        _buildValueTableWidget(
          context,
          value: data.tool ?? '',
          bgColor: ColorConstant.kSupportInfo,
        ),
      ],
    );
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
              previous.updateValueState != current.updateValueState,
          listener: (BuildContext context, ReportState state) {
            switch (state.updateValueState) {
              case LoadState.loading:
                context.read<AppBloc>().add(OnShowLoadingEvent());

                break;
              case LoadState.failure:
                context.read<AppBloc>().add(OnHideLoadingEvent());
                getIt<NavigationService>().pop();
                // getIt<NavigationService>().openDialog(
                //   title: 'Lỗi',
                //   content: state.message,
                // );
                break;
              case LoadState.success:
                context.read<AppBloc>().add(OnHideLoadingEvent());
                getIt<NavigationService>().pop();

                // getIt<NavigationService>().navigateToAndRemoveUntil(
                //     HomeScreen.pathRoute, (Route<dynamic> route) => false);

                break;
              default:
            }
          },
          builder: (BuildContext context, ReportState state) {
            final List<StandardProductReportData> listProduct =
                state.listProduct ?? <StandardProductReportData>[];
            final List<String> listSerial = state.listSerial ?? <String>[];
            logi(message: 'listProduct:${listProduct.length}');
            return DataTable(
              headingRowColor: MaterialStateColor.resolveWith(
                (Set<MaterialState> states) => ColorConstant.kSupportInfo,
              ),
              dataRowColor: MaterialStateProperty.all(Colors.green),
              columnSpacing: 0,
              horizontalMargin: 0,
              columns: <DataColumn>[
                _buildTitleTableWidget(context, value: 'STT'),
                _buildTitleTableWidget(context, value: 'Hạng mục kiểm tra'),
                _buildTitleTableWidget(context, value: 'Tiêu chuẩn'),
                ...List<DataColumn>.generate(listSerial.length, ((int index) {
                  return _buildTitleTableWidget(context,
                      value: 'M-${index + 1}');
                })),
                _buildTitleTableWidget(context, value: 'Kết quả'),
                _buildTitleTableWidget(context, value: 'Công cụ đo'),
              ],
              rows: List<DataRow>.generate(
                listProduct.length,
                (int index) => _resultsAPI(
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
    bool? isPass,
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
                    color: isPass != null
                        ? isPass == false
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
        onTap: onTap,
      );
  // InkWell(
  //   onTap: onTap,
  //   child: Container(
  //     padding: const EdgeInsets.all(15.0),
  //     color: bgColor ?? ColorConstant.kWhite,
  //     child: Text(
  //       value,
  //       style: WowTextTheme.ts14w400(context).copyWith(
  //           color: isPass == null
  //               ? isPass == null
  //                   ? null
  //                   : ColorConstant.kSupportError2
  //               : ColorConstant.kSupportSuccess),
  //       textAlign: TextAlign.start,
  //       maxLines: 2,
  //       overflow: TextOverflow.ellipsis,
  //     ),
  //   ),
  // );
}
