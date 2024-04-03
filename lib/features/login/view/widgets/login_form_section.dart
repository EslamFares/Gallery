import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:gallery_app/core/func/get_device_type.dart';
import 'package:gallery_app/core/utils/app_text_styles.dart';
import 'package:gallery_app/core/utils/spacing_extensions.dart';
import 'package:gallery_app/features/login/view/widgets/login_form.dart';

class LoginFormSection extends StatelessWidget {
  const LoginFormSection({super.key});

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
          Text(
            'My\n Gallery',
            textAlign: TextAlign.center,
            style: AppTextStyles.font40DarkW900
                .copyWith(fontSize: isTablet() ? 60 : 40),
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
                child: const LoginForm(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
