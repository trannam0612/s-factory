import 'package:flutter/material.dart';
import 'package:s_factory/extended_text_theme.dart';
import 'package:s_factory/presentation/utils/color_constant.dart';
import 'package:s_factory/presentation/widgets/s_back_button_widget%20.dart';

class SAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const SAppBarWidget({
    super.key,
    this.leading,
    this.backgroundColor,
    this.action,
    this.centerTitle = true,
    this.title,
    this.leadingWidth,
    this.height = kToolbarHeight,
  });
  final Widget? leading;
  final bool? centerTitle;
  final String? title;
  final double height;
  final double? leadingWidth;
  final Color? backgroundColor;
  final List<Widget>? action;

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title ?? '',
        style: WowTextTheme.ts24w600(context),
      ),
      toolbarHeight: 80,
      centerTitle: centerTitle,
      leading: leading ?? const SBackButtonWidget(),
      leadingWidth: leadingWidth,
      titleSpacing: 0,
      backgroundColor: backgroundColor ?? ColorConstant.kWhite,
      elevation: 1.0,
      actions: action,
    );
  }
}
