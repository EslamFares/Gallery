import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../utils/app_colors.dart';

class CustomNetWorkImg extends StatelessWidget {
  const CustomNetWorkImg(this.imgUrl,
      {super.key,
      this.aspectRatio,
      this.raduisNum,
      this.customRaduis,
      this.fit,
      this.elevation});
  final String imgUrl;
  final double? aspectRatio;
  final double? raduisNum;
  final double? elevation;
  final BorderRadius? customRaduis;
  final BoxFit? fit;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: aspectRatio ?? .65,
      child: Material(
        color: AppColors.white,
        borderRadius: customRaduis ?? BorderRadius.circular(raduisNum ?? 14),
        elevation: elevation ?? 3,
        child: ClipRRect(
          borderRadius: customRaduis ?? BorderRadius.circular(raduisNum ?? 14),
          child: CachedNetworkImage(
            imageUrl: imgUrl,
            fit: fit ?? BoxFit.cover,
            placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(color: AppColors.grayLight)),
            errorWidget: (context, url, error) =>
                const Icon(FontAwesomeIcons.image),
          ),
        ),
      ),
    );
  }
}
