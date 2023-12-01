import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:s_factory/common/extensions/string_extension.dart';
import 'package:s_factory/extended_text_theme.dart';
import 'package:s_factory/presentation/model/production_order_model.dart';

class TechnicalDrawingWidget extends StatelessWidget {
  const TechnicalDrawingWidget({
    super.key,
    this.productionOrder,
  });
  final ProductionOrderModel? productionOrder;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: productionOrder?.urlImage ?? '',
      fit: BoxFit.contain,
      width: double.infinity,
      height: 500.h,
      placeholder: (BuildContext context, String url) {
        return Center(
          child: CupertinoActivityIndicator(
            radius: 30.w,
          ),
        );
      },
      errorWidget: (BuildContext context, String url, Object error) {
        if (url.isNullOrEmpty) {
          return Center(
            child: Text(
              'URL empty',
              style: WowTextTheme.ts16w600(context),
              textAlign: TextAlign.center,
            ),
          );
        }
        return Center(
          child: Text(
            "Can't load $url. \n Error: $error",
            style: WowTextTheme.ts16w600(context),
            textAlign: TextAlign.center,
          ),
        );
      },
    );
  }
}
