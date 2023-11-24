import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:s_factory/presentation/widgets/s_title_text_field_widget.dart';

class InputMoreInfoWidget extends StatelessWidget {
  const InputMoreInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Flexible(
              flex: 3,
              child: WowTitleTextFieldWidget(
                title: 'NG',
                requiredField: true,
              ),
            ),
            SizedBox(
              width: 16.w,
            ),
            const Flexible(
              flex: 3,
              child: WowTitleTextFieldWidget(
                title: 'Kết quả',
                requiredField: true,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20.h,
        ),
        const WowTitleTextFieldWidget(
          title: 'Ghi chú',
          hintText: 'Nhập ghi chú',
          maxLine: 5,
        ),
      ],
    );
  }
}
