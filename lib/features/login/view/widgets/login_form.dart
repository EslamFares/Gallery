import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_app/core/dependency_injection/get_it_stetup.dart';
import 'package:gallery_app/core/func/get_device_type.dart';
import 'package:gallery_app/core/utils/app_text_styles.dart';
import 'package:gallery_app/core/utils/navigate_extensions.dart';
import 'package:gallery_app/core/utils/spacing_extensions.dart';
import 'package:gallery_app/core/widgets/custom_btn.dart';
import 'package:gallery_app/core/widgets/global_text_form.dart';
import 'package:gallery_app/features/home/cubit/home_cubit.dart';
import 'package:gallery_app/features/login/cubit/login_cubit.dart';
import 'package:gallery_app/features/login/cubit/login_state.dart';

import '../../../home/view/home_view.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSucessState) {
          context.pushAndRemoveUntil(BlocProvider(
            create: (context) => getIt<HomeCubit>()..getMYGalleryData(),
            child: const HomeView(),
          ));
        }
        if (state is LoginFailureState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Check you Email or Password"),
            ),
          );
        }
      },
      builder: (context, state) {
        LoginCubit cubit = LoginCubit.get(context);
        return Padding(
          padding: EdgeInsets.all(isTablet() ? 50 : 0),
          child: Column(
            children: [
              const Text(
                'LOG IN',
                style: AppTextStyles.font25BlackBold,
              ),
              Form(
                key: cubit.loginFormKey,
                child: Column(
                  children: [
                    GlobalTextForm(
                        textController: cubit.emailController,
                        hintText: "User Name"),
                    verticalSpace(isTablet() ? 50 : 0),
                    GlobalTextForm(
                        textController: cubit.passwordController,
                        isPass: cubit.ispassword,
                        showEndButton: true,
                        onTapShow: () {
                          cubit.changePasswordState();
                        },
                        hintText: "password"),
                    verticalSpace(isTablet() ? 100 : 50),
                    CustomBtn(
                      onTap: () {
                        cubit.login();
                      },
                      text: "SUBMIT",
                      cutmChild: state is LoginLoadingState
                          ? const Center(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            )
                          : null,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
