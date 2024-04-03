import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gallery_app/core/utils/app_assets.dart';
import 'package:gallery_app/core/utils/app_colors.dart';
import 'package:gallery_app/core/utils/app_text_styles.dart';
import 'package:gallery_app/core/utils/spacing_extensions.dart';
import 'package:gallery_app/features/home/cubit/home_cubit.dart';
import 'package:gallery_app/features/home/view/widgets/custom_filled_button.dart';
import 'package:image_picker/image_picker.dart';

Future<dynamic> uploadDilogView(BuildContext context, HomeCubit homeCubit) {
  return showDialog(
    context: context,
    barrierColor: Colors.transparent,
    builder: (context) => Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      // shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.circular(15.0)),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 3.0,
          sigmaY: 3.0,
        ),
        child: Container(
            width: context.width * .7,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: Colors.white70,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomFilledButton(
                    height: 65,
                    witdh: context.width * .5,
                    imgHeight: 60,
                    imgWidth: 60,
                    bgColor: AppColors.pink,
                    text: "Gellary",
                    textStyle: AppTextStyles.font25BlackBold,
                    imgPath: AppAssets.homeGallerytIcon,
                    onTap: () async {
                      final ImagePicker picker = ImagePicker();
                      final XFile? image =
                          await picker.pickImage(source: ImageSource.gallery);
                      if (image != null) {
                        homeCubit.upLaodImage(image);
                      }
                    }),
                CustomFilledButton(
                    height: 65,
                    witdh: context.width * .5,
                    imgHeight: 60,
                    imgWidth: 60,
                    bgColor: AppColors.blueLight,
                    text: "Camera",
                    textStyle: AppTextStyles.font25BlackBold,
                    imgPath: AppAssets.homeCameraIcon,
                    onTap: () async {
                      final ImagePicker picker = ImagePicker();
                      final XFile? image =
                          await picker.pickImage(source: ImageSource.camera);
                      if (image != null) {
                        homeCubit.upLaodImage(image);
                      }
                    }),
              ],
            )),
      ),
    ),
  );
}
