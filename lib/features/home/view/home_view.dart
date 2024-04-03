import 'package:flutter/material.dart';
import 'package:gallery_app/core/utils/app_decorations.dart';
import 'package:gallery_app/core/utils/spacing_extensions.dart';

import 'widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: context.height,
          width: context.width,
          decoration: AppDecorations.homePinkContainerBoxDecoration,
          child: Container(
            decoration: AppDecorations.loginWhiteContainerBoxDecoration,
            child: const HomeViewBody(),
          ),
        ),
      ),
    );
  }
}
