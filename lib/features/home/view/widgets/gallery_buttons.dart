import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_app/core/dependency_injection/get_it_stetup.dart';
import 'package:gallery_app/core/utils/app_assets.dart';
import 'package:gallery_app/core/utils/navigate_extensions.dart';
import 'package:gallery_app/core/widgets/ios_show_dialog.dart';
import 'package:gallery_app/features/home/cubit/home_cubit.dart';
import 'package:gallery_app/features/home/cubit/home_state.dart';
import 'package:gallery_app/features/home/view/widgets/custom_filled_button.dart';
import 'package:gallery_app/features/home/view/widgets/upload_dilog_view.dart';
import 'package:gallery_app/features/login/cubit/login_cubit.dart';
import 'package:gallery_app/features/login/view/login_view.dart';

import '../../../../core/func/get_device_type.dart';

class GalleryButtons extends StatelessWidget {
  const GalleryButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (BuildContext context, HomeState state) {
        if (state is UploadImgSucsessState) {
          Navigator.pop(context);
          HomeCubit.get(context).getMYGalleryData();
        }
        if (state is UploadImgFailedState) {
          Navigator.pop(context);
          iosShowDialog(
              context: context,
              title: "Failed",
              subTitle: "check your connection",
              onConfirm: () {});
        }
      },
      builder: (context, state) {
        HomeCubit homeCubit = HomeCubit.get(context);
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomFilledButton(
                  text: "Log out",
                  height: isTablet() ? 60 : null,
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
                  height: isTablet() ? 60 : null,
                  imgPath: AppAssets.homeuploadtIcon,
                  onTap: () {
                    uploadDilogView(context, homeCubit);
                  }),
            ],
          ),
        );
      },
    );
  }
}
