import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_app/core/utils/app_assets.dart';
import 'package:gallery_app/core/utils/app_text_styles.dart';
import 'package:gallery_app/core/widgets/custom_network_img.dart';
import 'package:gallery_app/features/home/cubit/home_cubit.dart';
import 'package:gallery_app/features/home/cubit/home_state.dart';
import 'package:gallery_app/features/home/view/widgets/gallery_buttons.dart';
import 'package:gallery_app/features/home/view/widgets/gallery_grid_view.dart';
import 'package:gallery_app/features/home/view/widgets/rps_custom_painter.dart';

class GalleryShowView extends StatelessWidget {
  const GalleryShowView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        HomeCubit homeCubit = HomeCubit.get(context);
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Text("Welcome\n${homeCubit.userName}",
                      style: AppTextStyles.font32BlackBold),
                ),
                SizedBox(
                  height: 120,
                  width: 200,
                  child: CustomPaint(
                    size: Size(
                        150,
                        (150 * 0.5833333333333334)
                            .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                    painter: RPSCustomPainter(),
                    child: const Stack(
                      children: [
                        Positioned(
                          top: 18,
                          right: 37,
                          child: SizedBox(
                            height: 50,
                            width: 50,
                            child: CustomNetWorkImg(
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
            ),
            const GalleryButtons(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: GalleryGridView(homeCubit: homeCubit),
              ),
            )
          ],
        );
      },
    );
  }
}
