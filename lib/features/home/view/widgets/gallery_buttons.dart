import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_app/core/cash/getstorage_helper.dart';
import 'package:gallery_app/core/dependency_injection/get_it_stetup.dart';
import 'package:gallery_app/core/network/api/endpoints.dart';
import 'package:gallery_app/core/network/functions/upload_image_to_api.dart';
import 'package:gallery_app/core/utils/app_assets.dart';
import 'package:gallery_app/core/utils/app_colors.dart';
import 'package:gallery_app/core/utils/app_text_styles.dart';
import 'package:gallery_app/core/utils/navigate_extensions.dart';
import 'package:gallery_app/core/utils/spacing_extensions.dart';
import 'package:gallery_app/core/widgets/ios_show_dialog.dart';
import 'package:gallery_app/features/home/cubit/home_cubit.dart';
import 'package:gallery_app/features/home/cubit/home_state.dart';
import 'package:gallery_app/features/home/view/widgets/custom_filled_button.dart';
import 'package:gallery_app/features/login/cubit/login_cubit.dart';
import 'package:gallery_app/features/login/view/login_view.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';

class GalleryButtons extends StatelessWidget {
  const GalleryButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        HomeCubit homeCubit = HomeCubit.get(context);
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomFilledButton(
                  text: "Log out",
                  imgPath: AppAssets.homelogoutIcon,
                  onTap: () {
                    iosShowDialog(
                        context: context,
                        title: 'LogOut',
                        subTitle: 'are you sure you want to log out?',
                        onConfirm: () {
                          context.pushAndRemoveUntil(BlocProvider(
                            create: (context) => getIt<LoginCubit>(),
                            child: const LoginView(),
                          ));
                        });
                  }),
              CustomFilledButton(
                  text: "upload",
                  imgPath: AppAssets.homeuploadtIcon,
                  onTap: () {
                    showDialog(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
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
                                        final ImagePicker picker =
                                            ImagePicker();
                                        final XFile? image =
                                            await picker.pickImage(
                                                source: ImageSource.gallery);
                                        if (image != null) {
                                          // File file = File(image.path);
                                          try {
                                            String filename =
                                                image.path.split('/').last;
                                            FormData formData =
                                                FormData.fromMap({
                                              "img":
                                                  await MultipartFile.fromFile(
                                                      image.path,
                                                      filename: filename,
                                                      contentType: MediaType(
                                                          'image', 'png')),
                                            });
                                            Response responser = await Dio().post(
                                                "https://flutter.prominaagency.com/api/upload",
                                                data: formData,
                                                options: Options(
                                                  headers: {
                                                    "Authorization":
                                                        "Bearer ${GetStorageHelper.readData('userToken')}",
                                                    "Connection": "keep-alive",
                                                    "Accept": "*/*",
                                                    "Accept-Encoding":
                                                        "gzip, deflate, br",
                                                    "Content-Type":
                                                        "multipart/form-data;"
                                                  },
                                                ));
                                            debugPrint('responser: $responser');
                                          } catch (e) {
                                            print("erooooooor====>$e");
                                          }
                                        }

                                        // final XFile? photo = await picker.pickImage(
                                        //     source: ImageSource.camera);
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
                                      onTap: () {}),
                                ],
                              )),
                        ),
                      ),
                    );
                  }),
            ],
          ),
        );
      },
    );
  }
}
