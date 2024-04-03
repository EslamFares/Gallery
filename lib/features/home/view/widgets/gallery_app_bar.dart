import 'package:flutter/material.dart';
import 'package:gallery_app/core/func/get_device_type.dart';
import 'package:gallery_app/core/utils/app_assets.dart';
import 'package:gallery_app/core/utils/app_text_styles.dart';
import 'package:gallery_app/core/widgets/custom_network_img.dart';
import 'package:gallery_app/features/home/view/widgets/rps_custom_painter.dart';

class GalleryAppBar extends StatelessWidget {
  const GalleryAppBar({
    super.key,
    required this.name,
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Text("Welcome\n$name",
              style: AppTextStyles.font32BlackBold.copyWith(
                  fontSize: MediaQuery.of(context).size.width > 400 ? 50 : 32)),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.width > 400 ? 250 : 120,
          width: MediaQuery.of(context).size.width > 400 ? 330 : 200,
          child: CustomPaint(
            size: Size(
                150,
                (150 * 0.5833333333333334)
                    .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
            painter: RPSCustomPainter(),
            child: Stack(
              children: [
                Positioned(
                  top: 18,
                  right: 37,
                  child: SizedBox(
                    height: isTablet() ? 100 : 50,
                    width: isTablet() ? 100 : 50,
                    child: const CustomNetWorkImg(
                      AppAssets.person,
                      raduisNum: 50,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
