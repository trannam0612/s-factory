import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TechnicalDrawingReportWidget extends StatelessWidget {
  const TechnicalDrawingReportWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: 'https://i.imgur.com/cmqcFD4.png',
      fit: BoxFit.cover,
      width: double.infinity,
      height: 500.h,
    );
  }
}
