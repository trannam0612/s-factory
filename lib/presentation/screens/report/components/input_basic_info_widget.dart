import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:s_factory/presentation/widgets/s_title_text_field_widget.dart';

class InputBasicInfoWidget extends StatelessWidget {
  const InputBasicInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Flexible(
          flex: 3,
          child: WowTitleTextFieldWidget(
            title: 'Nhà cung cấp',
            requiredField: true,
          ),
        ),
        SizedBox(
          width: 16.w,
        ),
        const Flexible(
          flex: 3,
          child: WowTitleTextFieldWidget(
            title: 'Tài liệu tham chiếu',
          ),
        ),
        SizedBox(
          width: 16.w,
        ),
        const Flexible(
          flex: 3,
          child: WowTitleTextFieldWidget(
            title: 'Số mẫu',
            requiredField: true,
          ),
        ),
      ],
    );
  }
}
