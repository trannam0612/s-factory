import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:s_factory/extended_text_theme.dart';
import 'package:s_factory/presentation/screens/history/list_report_history_po/bloc/list_report_history_po_bloc.dart';
import 'package:s_factory/presentation/utils/assets.dart';
import 'package:s_factory/presentation/utils/color_constant.dart';
import 'package:s_factory/presentation/widgets/s_button_widget.dart';
import 'package:s_factory/presentation/widgets/s_text_field_widget.dart';

class InputSearchReportHistoryPOWidget extends StatefulWidget {
  const InputSearchReportHistoryPOWidget({super.key});

  @override
  State<InputSearchReportHistoryPOWidget> createState() =>
      _InputSearchReportHistoryPOWidgetState();
}

class _InputSearchReportHistoryPOWidgetState
    extends State<InputSearchReportHistoryPOWidget> {
  late ListReportHistoryPOBloc _bloc;
  late TextEditingController _txtKeyword;
  @override
  void initState() {
    super.initState();
    _bloc = context.read();
    _txtKeyword = TextEditingController();
  }

  @override
  void dispose() {
    _txtKeyword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 145.w),
      child: Row(
        children: [
          Expanded(
            child: STextFieldWidget(
              maxLength: 5,
              controller: _txtKeyword,
              hintText: 'Nhập mã báo cáo',
              iconPath: SvgPaths.isSearch,
              customBorder: OutlineInputBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                    8.w,
                  ),
                  bottomLeft: Radius.circular(
                    8.w,
                  ),
                ),
                borderSide: const BorderSide(
                  color: ColorConstant.kNeuTral02,
                ), // BorderSide
              ),
            ),
          ),
          SButtonWidget(
            text: 'Tìm kiếm',
            margin: EdgeInsets.zero,
            onClick: () {
              _bloc.add(
                  GetListReportHistoryPOEvent(reportCode: _txtKeyword.text));
            },
            customBorderRadius: const BorderRadius.only(
              topRight: Radius.circular(
                8,
              ),
              bottomRight: Radius.circular(
                8,
              ),
            ),
            bgColor: ColorConstant.kPrimary01,
            textStyle: WowTextTheme.ts20w600(context)
                .copyWith(color: ColorConstant.kWhite),
          )
        ],
      ),
    );
  }
}
