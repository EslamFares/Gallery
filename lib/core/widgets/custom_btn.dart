import 'package:flutter/material.dart';
import 'package:gallery_app/core/utils/spacing_extensions.dart';

import '../utils/app_colors.dart';

class CustomBtn extends StatelessWidget {
  const CustomBtn(
      {super.key, required this.onTap, this.text, this.color, this.cutmChild});
  final Color? color;
  final String? text;
  final VoidCallback onTap;
  final Widget? cutmChild;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width * .9,
      height: 45,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            backgroundColor: color ?? AppColors.blue),
        child: cutmChild ??
            Text(
              text ?? 'Next',
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
      ),
    );
  }
}
