import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_app/core/dependency_injection/get_it_stetup.dart';
import 'package:gallery_app/core/utils/navigate_extensions.dart';
import 'package:gallery_app/core/utils/spacing_extensions.dart';
import 'package:gallery_app/core/widgets/custom_btn.dart';
import 'package:gallery_app/core/widgets/global_text_form.dart';
import 'package:gallery_app/features/home/cubit/home_cubit.dart';
import 'package:gallery_app/features/login/cubit/login_cubit.dart';
import 'package:gallery_app/features/login/cubit/login_state.dart';

import '../../../home/view/home_view.dart';

class LoginFormView extends StatelessWidget {
  const LoginFormView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: context.width,
            height: context.height * .2,
          ),
          const Text(
            'My\n Gallery',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 20.0,
                sigmaY: 20.0,
              ),
              child: Container(
                width: context.width * .8,
                height: context.height * .5,
                padding: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white.withOpacity(0.3)),

                // color: Colors.amber,
                child: Column(
                  children: [
                    const Text(
                      'LOG IN',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    BlocConsumer<LoginCubit, LoginState>(
                      listener: (context, state) {
                        if (state is LoginSucessState) {
                          context.pushAndRemoveUntil(BlocProvider(
                            create: (context) => getIt<HomeCubit>(),
                            child: const HomeView(),
                          ));
                        }
                      },
                      builder: (context, state) {
                        LoginCubit cubit = LoginCubit.get(context);
                        return Column(
                          children: [
                            GlobalTextForm(
                                textController: cubit.emailController,
                                hintText: "User Name"),
                            GlobalTextForm(
                                textController: cubit.passwordController,
                                hintText: "password"),
                            verticalSpace(50),
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
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
