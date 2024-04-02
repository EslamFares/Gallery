import 'package:flutter/material.dart';
import 'package:gallery_app/core/utils/app_assets.dart';
import 'package:gallery_app/core/utils/app_decorations.dart';
import 'package:gallery_app/core/utils/spacing_extensions.dart';

import 'widgets/login_form_view.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: AppDecorations.loginPinkContainerBoxDecoration,
          child: Container(
            decoration: AppDecorations.loginWhiteContainerBoxDecoration,
            child: Stack(
              children: [
                const Positioned(
                    top: -150,
                    left: -80,
                    width: 350,
                    height: 330,
                    child: Image(image: AssetImage(AppAssets.loginiconCamera))),
                Positioned(
                    top: context.height * .4,
                    left: context.width * .15,
                    width: 120,
                    height: 120,
                    child:
                        const Image(image: AssetImage(AppAssets.loginicon1))),
                Positioned(
                    top: context.height * .4,
                    left: context.width * .45,
                    width: 200,
                    height: 200,
                    child:
                        const Image(image: AssetImage(AppAssets.loginicon2))),
                Positioned(
                    top: context.height * .62,
                    left: context.width * .4,
                    width: 120,
                    height: 120,
                    child:
                        const Image(image: AssetImage(AppAssets.loginicon3))),
                const LoginFormView(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
