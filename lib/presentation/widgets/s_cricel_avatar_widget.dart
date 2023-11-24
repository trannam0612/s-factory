import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class SCricleAvatarWidget extends StatelessWidget {
  const SCricleAvatarWidget({
    super.key,
    required this.size,
    required this.urlImage,
  });
  final String urlImage;
  final double size;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(size / 1),
      child: CachedNetworkImage(
        imageUrl: urlImage,
        width: size,
        height: size,
      ),
    );
  }
}
