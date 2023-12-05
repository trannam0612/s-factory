import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:s_factory/common/di/app_injector.dart';
import 'package:s_factory/extended_text_theme.dart';
import 'package:s_factory/presentation/services/navigation_service.dart';
import 'package:s_factory/presentation/utils/assets.dart';

class SBackButtonWidget extends StatelessWidget {
  const SBackButtonWidget({super.key, this.onTap, this.title});
  final Function()? onTap;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ??
          () {
            getIt<NavigationService>().pop();
          },
      child: Row(
        children: <Widget>[
          SvgPicture.asset(
            SvgPaths.icArrowLeft,
          ),
          if (title != null)
            SizedBox(
              width: 8.w,
            ),
          if (title != null)
            Flexible(
              child: Text(
                title ?? '',
                style: WowTextTheme.ts24w600(context),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            )
        ],
      ),
    );
  }
}
