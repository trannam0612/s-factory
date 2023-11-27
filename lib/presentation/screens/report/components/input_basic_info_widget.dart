import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:s_factory/presentation/widgets/s_title_text_field_widget.dart';

class InputBasicInfoWidget extends StatelessWidget {
  const InputBasicInfoWidget({
    super.key,
    required this.txtProvider,
    required this.txtDocument,
    required this.txtModelNumber,
  });
  final TextEditingController txtProvider;
  final TextEditingController txtDocument;
  final TextEditingController txtModelNumber;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 3,
          child: WowTitleTextFieldWidget(
            title: 'Nhà cung cấp',
            requiredField: true,
            controller: txtProvider,
          ),
        ),
        SizedBox(
          width: 16.w,
        ),
        Flexible(
          flex: 3,
          child: WowTitleTextFieldWidget(
            title: 'Tài liệu tham chiếu',
            controller: txtDocument,
          ),
        ),
        SizedBox(
          width: 16.w,
        ),
        Flexible(
          flex: 3,
          child: WowTitleTextFieldWidget(
            title: 'Số mẫu',
            requiredField: true,
            controller: txtModelNumber,
          ),
        ),
      ],
    );
  }
}
