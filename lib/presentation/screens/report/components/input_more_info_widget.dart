import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
              ),
            ),
            SizedBox(
              width: 16.w,
            ),
            Flexible(
              flex: 3,
              child: WowTitleTextFieldWidget(
                title: 'Kết quả',
                requiredField: true,
                controller: txtResult,
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
