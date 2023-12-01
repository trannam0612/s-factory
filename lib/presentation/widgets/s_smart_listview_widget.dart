import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:s_factory/common/configs/logger_config.dart';

class SSmartListViewWidget<T> extends StatefulWidget {
  const SSmartListViewWidget({
    super.key,
    required this.items,
    required this.itemBuilder,
    required this.onLoadMore,
    required this.onRefresh,
    this.separatorBuilder,
    this.padding,
    this.isShowLoading,
  });
  final List<T> items;
  final Function(BuildContext, T data) itemBuilder;
  final Function()? onLoadMore;
  final Function()? onRefresh;
  final Widget? separatorBuilder;
  final EdgeInsets? padding;
  final bool? isShowLoading;

  @override
  State<SSmartListViewWidget<T>> createState() =>
      _SSmartListViewWidgetState<T>();
}

class _SSmartListViewWidgetState<T> extends State<SSmartListViewWidget<T>> {
  // late ScrollController _controller;

  late RefreshController _refreshController;
  @override
  void initState() {
    super.initState();
    _refreshController = RefreshController();
    // _controller = ScrollController();
    // _controller.addListener(_scrollListener);
    logi(message: 'initState SmartListView');
  }

  @override
  void dispose() {
    super.dispose();
    // _controller.removeListener(_scrollListener);
    // _controller.dispose();
    _refreshController.dispose();
  }

  Future<void> _onRefresh() async {
    await widget.onRefresh?.call();

    _refreshController.refreshCompleted();
  }

  void _onLoadMore() async {
    print('on load more');
    try {
      await widget.onLoadMore?.call();
      _refreshController.loadComplete();
      _refreshController.refreshCompleted();
    } catch (e) {
      logi(message: 'e.toString():${e.toString()}');
    }
  }

  // void _scrollListener() {
  //   logi(
  //       message:
  //           '_controller.position.extentAfter:${_controller.position.pixels}');
  //   if (_controller.position.pixels < 200) {
  //     if (widget.isShowLoading == false) {
  //       logi(message: 'controller.onRefresh');
  //       widget.onRefresh?.call();
  //     }
  //   }
  //   if (_controller.position.extentAfter < 0) {
  //     if (widget.isShowLoading == false) {
  //       widget.onLoadMore?.call();
  //       logi(message: 'controller.onLoadMore');
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SmartRefresher(
        enablePullUp: true,
        header: const WaterDropHeader(
          complete: Text('Tải lại thành công'),
        ),
        footer: CustomFooter(
          builder: (BuildContext context, LoadStatus? mode) {
            Widget body;
            if (mode == LoadStatus.idle) {
              body = const Text('Kéo để tải thêm');
            } else if (mode == LoadStatus.loading) {
              body = const CupertinoActivityIndicator();
            } else if (mode == LoadStatus.failed) {
              body = const Text('Tải thêm thất lại! Thử lại!');
            } else if (mode == LoadStatus.canLoading) {
              body = const Text('release to load more');
            } else {
              body = const Text('No more Data');
            }
            return Container(
              height: 55.0,
              child: Center(child: body),
            );
          },
        ),
        controller: _refreshController,
        onRefresh: _onRefresh,
        onLoading: _onLoadMore,
        child: ListView.separated(
          separatorBuilder: (BuildContext context, int index) =>
              widget.separatorBuilder ?? const SizedBox.shrink(),
          padding: widget.padding,
          itemBuilder: (BuildContext context, int index) {
            return widget.itemBuilder(context, widget.items[index]);
          },
          itemCount: widget.items.length,
        ),
      ),
    );

    // Column(
    //   children: <Widget>[
    //     if (widget.isShowLoading == true)
    //       const Center(
    //         child: CupertinoActivityIndicator(),
    //       ),
    //     Expanded(
    //       child: ListView.separated(
    //           padding: widget.padding ?? EdgeInsets.zero,
    //           controller: _controller,
    //           physics: const BouncingScrollPhysics(),
    //           separatorBuilder: (BuildContext context, int index) =>
    //               widget.separatorBuilder ??
    //               const Divider(
    //                 color: ColorConstant.kBackgroundColor,
    //                 height: 1,
    //                 thickness: 0.5,
    //               ),
    //           itemCount: widget.items.length,
    //           itemBuilder: (BuildContext context, int index) {
    //             return widget.itemBuilder(context, widget.items[index]);
    //           }),
    //     ),
    //     if (widget.isShowLoading == true)
    //       const Center(
    //         child: CupertinoActivityIndicator(),
    //       ),
    //   ],
    // );
  }
}
