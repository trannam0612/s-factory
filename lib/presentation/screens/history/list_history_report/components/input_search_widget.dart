import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:s_factory/extended_text_theme.dart';
import 'package:s_factory/presentation/screens/history/list_history_report/bloc/list_report_history_bloc.dart';
import 'package:s_factory/presentation/utils/assets.dart';
import 'package:s_factory/presentation/utils/color_constant.dart';
import 'package:s_factory/presentation/widgets/s_button_widget.dart';
import 'package:s_factory/presentation/widgets/s_text_field_widget.dart';

class InputSearchWidget extends StatefulWidget {
  const InputSearchWidget({super.key});

  @override
  State<InputSearchWidget> createState() => _InputSearchWidgetState();
}

class _InputSearchWidgetState extends State<InputSearchWidget> {
  late ListReportHistoryBloc _historyBloc;
  late TextEditingController _txtKeyword;
  @override
  void initState() {
    super.initState();
    _historyBloc = context.read();
    _txtKeyword = TextEditingController();
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
              hintText: 'Tìm kiếm theo mã PO',
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
              _historyBloc
                  .add(GetListReportHistoryEvent(pOCode: _txtKeyword.text));
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
