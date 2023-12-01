import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:s_factory/common/extensions/string_extension.dart';
import 'package:s_factory/extended_text_theme.dart';
import 'package:s_factory/presentation/screens/history/report_detail/bloc/report_detail_bloc.dart';

class TechnicalDrawingReportWidget extends StatelessWidget {
  const TechnicalDrawingReportWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReportDetailBloc, ReportDetailState>(
        builder: (BuildContext context, ReportDetailState state) {
      final List<String>? listUrl =
          state.reportDetailModel?.productType?.standardImageUrls;
      final String url =
          listUrl?.isNotEmpty == true ? listUrl?.first ?? '' : '';
      return CachedNetworkImage(
        imageUrl: url,
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
    });
  }
}
