import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  // bool _isShowingDialog = false;

  Future<void> navigateTo(String routeName) {
    return navigatorKey.currentState!.pushNamed(routeName);
  }

  Future<void> navigateToWithArgs({
    required String routeName,
    Object? args,
  }) {
    return navigatorKey.currentState!.pushNamed(
      routeName,
      arguments: args,
    );
  }

  Future<void> navigateToAndRemoveUntil(
    String routeName,
    RoutePredicate predicate, {
    Object? args,
  }) {
    return navigatorKey.currentState!.pushNamedAndRemoveUntil(
      routeName,
      predicate,
      arguments: args,
    );
  }

  void pop() {
    return navigatorKey.currentState!.pop();
  }

  void popUntil(String routeName) {
    return navigatorKey.currentState!.popUntil(ModalRoute.withName(routeName));
  }

  Future<void> openDialog({String? title, String? content}) async {
    // if(!_isShowingDialog){
    //   _isShowingDialog = true;
    showDialog(
      context: navigatorKey.currentContext!,
      builder: (_) => AlertDialog(
        title: Text(
          title ?? '',
          style: const TextStyle(fontSize: 16),
        ),
        content: SingleChildScrollView(
          child: Text(
            content ?? '',
            style: const TextStyle(fontSize: 14),
          ),
        ),
      ),
    ).then((dynamic value) {
      // _isShowingDialog = false;
    });
  }

  Future<void> openDialogLoading() async {
    // if(!_isShowingDialog){
    //   _isShowingDialog = true;
    showDialog(
      context: navigatorKey.currentContext!,
      barrierDismissible: false,
      builder: (_) => Center(
        child: CupertinoActivityIndicator(
          radius: 50.w,
        ),
      ),
    );
  }

  Future<void> openBottomSheet({Widget? widget, Color? bgColor}) async {
    // if(!_isShowingDialog){
    //   _isShowingDialog = true;
    showModalBottomSheet(
            barrierColor: bgColor,
            backgroundColor: Colors.transparent,
            context: navigatorKey.currentContext!,
            builder: (_) => widget ?? const SizedBox.shrink(),
            elevation: 0.0)
        .then((dynamic value) {
      // _isShowingDialog = false;
    });
  }

  void showNoInternetDialog() {
    // showUnknownErrorPopUp(navigatorKey.currentContext!);
  }
}
