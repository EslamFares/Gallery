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
          decoration: AppDecorations.loginPinkContainerBoxDecoration,
          child: Container(
            decoration: AppDecorations.loginWhiteContainerBoxDecoration,
            child: const HomeViewBody(),
          ),
        ),
      ),
    );
  }
}

//  ClipPath(
//             clipper: BezierClipper(),
//             child: Container(
//               color: Colors.red,
//               height: 200,
//             ),
//           ),
// class BezierClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     Path path = Path();
//     path.lineTo(0, size.height - 80);
//     path.quadraticBezierTo(
//       size.width / 2,
//       size.height,
//       size.width,
//       size.height - 80,
//     );
//     path.lineTo(size.width, 0);
//     path.close();
//     return path;
//   }

//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
//     // TODO: implement shouldReclip
//     throw UnimplementedError();
//   }
// }
