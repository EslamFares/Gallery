import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:gallery_app/core/utils/spacing_extensions.dart';
import 'package:gallery_app/core/widgets/custom_btn.dart';
import 'package:gallery_app/core/widgets/global_text_form.dart';

class LoginFormView extends StatelessWidget {
  const LoginFormView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
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
                    Column(
                      children: [
                        GlobalTextForm(
                            textController: emailController,
                            hintText: "User Name"),
                        GlobalTextForm(
                            textController: passwordController,
                            hintText: "password"),
                        verticalSpace(50),
                        CustomBtn(onTap: () {}, text: "SUBMIT"),
                      ],
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
