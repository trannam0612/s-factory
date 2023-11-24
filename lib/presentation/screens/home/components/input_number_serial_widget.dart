import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:s_factory/common/constant/enum.dart';
import 'package:s_factory/extended_text_theme.dart';
import 'package:s_factory/presentation/screens/home/blocs/home_bloc/home_bloc.dart';
import 'package:s_factory/presentation/utils/color_constant.dart';
import 'package:s_factory/presentation/widgets/s_button_widget.dart';
import 'package:s_factory/presentation/widgets/s_text_field_widget.dart';

class InputNumberSerialWidget extends StatefulWidget {
  InputNumberSerialWidget({
    super.key,
  });

  @override
  State<InputNumberSerialWidget> createState() =>
      _InputNumberSerialWidgetState();
}

class _InputNumberSerialWidgetState extends State<InputNumberSerialWidget> {
  late TextEditingController _txtSerial;
  late HomeBloc _homeBloc;
  @override
  void initState() {
    super.initState();
    _txtSerial = TextEditingController(text: 'SNKK66U6S6H4');
    _homeBloc = context.read();
  }

  @override
  void dispose() {
    super.dispose();
    _txtSerial.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state.checkSerialState == LoadState.success) {
          _txtSerial.clear();
        }
      },
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: const BoxDecoration(
          color: ColorConstant.kPrimary02,
        ),
        child: Row(
          children: [
            Expanded(
              child: STextFieldWidget(
                controller: _txtSerial,
                hintText: 'Nhập mã serial',
                customBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                      8,
                    ),
                    bottomLeft: Radius.circular(
                      8,
                    ),
                  ),
                  borderSide: BorderSide(
                    color: ColorConstant.kNeuTral02,
                  ), // BorderSide
                ),
              ),
            ),
            SButtonWidget(
              text: 'Xác nhận',
              margin: EdgeInsets.zero,
              onClick: () {
                _homeBloc.add(CheckSerialEvent(
                  serial: _txtSerial.text,
                ));
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
      ),
    );
  }
}
