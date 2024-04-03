import 'package:flutter/material.dart';
import 'package:gallery_app/core/utils/app_colors.dart';
import 'package:gallery_app/core/utils/app_text_styles.dart';
import 'package:gallery_app/core/utils/spacing_extensions.dart';

class CustomFilledButton extends StatelessWidget {
  const CustomFilledButton({
    super.key,
    this.bgColor,
    required this.text,
    required this.imgPath,
    required this.onTap,
    this.witdh,
    this.height,
    this.textStyle,
    this.imgHeight,
    this.imgWidth,
    this.raduis,
  });
  final double? witdh;
  final double? height;
  final Color? bgColor;
  final String text;
  final String imgPath;
  final Function onTap;
  final TextStyle? textStyle;
  final double? imgHeight;
  final double? imgWidth;
  final double? raduis;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: witdh ?? context.width * .35,
      height: height ?? 45,
      child: FilledButton(
        onPressed: () {
          onTap();
        },
        style: FilledButton.styleFrom(
            backgroundColor: bgColor ?? AppColors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(raduis ?? 10))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
                width: imgWidth ?? 40,
                height: imgHeight ?? 35,
                child: Image.asset(imgPath)),
            Text(
              text,
              style: textStyle ?? AppTextStyles.font16DarkW500,
            ),
          ],
        ),
      ),
    );
  }
}
