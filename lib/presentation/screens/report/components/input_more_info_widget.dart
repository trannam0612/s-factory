import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:s_factory/common/di/app_injector.dart';
import 'package:s_factory/presentation/screens/report/components/bottom_sheet_components/bs_select_po_status_widget.dart';
import 'package:s_factory/presentation/screens/report/report_bloc/report_bloc.dart';
import 'package:s_factory/presentation/services/navigation_service.dart';
import 'package:s_factory/presentation/utils/color_constant.dart';
import 'package:s_factory/presentation/widgets/s_field_data_widget.dart';
import 'package:s_factory/presentation/widgets/s_title_text_field_widget.dart';

class InputMoreInfoWidget extends StatelessWidget {
  const InputMoreInfoWidget({
    super.key,
    required this.txtNG,
    required this.txtResult,
    required this.txtNote,
  });
  final TextEditingController txtNG;
  final TextEditingController txtResult;
  final TextEditingController txtNote;

  @override
  Widget build(BuildContext context) {
    final ReportBloc _reportBloc = context.read();

    return Column(
      children: [
        Row(
          children: [
            Flexible(
              flex: 3,
              child: WowTitleTextFieldWidget(
                title: 'NG',
                requiredField: true,
                controller: txtNG,
                validator: (String? text) {
                  if (text == null || text.isEmpty) {
                    return 'Text is empty';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(
              width: 16.w,
            ),
            Flexible(
              flex: 3,
              child: BlocBuilder<ReportBloc, ReportState>(
                builder: (BuildContext context, ReportState state) {
                  final POStatus? currentPOStatus = state.currentPOStatus;
                  return WowFieldDataWidget(
                    title: 'Kết quả',
                    requiredField: true,
                    text: currentPOStatus?.title,
                    textColor: currentPOStatus == POStatus.pass
                        ? ColorConstant.kSupportSuccess
                        : ColorConstant.kSupportError2,
                    onTap: () {
                      getIt<NavigationService>().openBottomSheet(
                          widget: BSSelectPOStatusWidget(
                        currentStatus: currentPOStatus ?? POStatus.pass,
                        onTapConfirm: (POStatus? p0) {
                          _reportBloc.add(SelectPOStatusEvent(
                            poStatus: p0,
                          ));
                          getIt<NavigationService>().pop();
                        },
                      ));
                    },
                  );
                },
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20.h,
        ),
        WowTitleTextFieldWidget(
          title: 'Ghi chú',
          hintText: 'Nhập ghi chú',
          maxLine: 5,
          controller: txtNote,
        ),
      ],
    );
  }
}
