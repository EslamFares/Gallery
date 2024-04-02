import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_app/features/home/cubit/home_cubit.dart';
import 'package:gallery_app/features/home/cubit/home_state.dart';
import 'package:gallery_app/features/login/cubit/login_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    LoginCubit loginCubit = LoginCubit.get(context);
    String token = loginCubit.user!.token!;
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        HomeCubit homeCubit = HomeCubit.get(context);
        return Scaffold(
          body: Center(
              child: TextButton(
                  onPressed: () {
                    homeCubit.getMYGalleryData();
                  },
                  child: const Text('ok'))),
        );
      },
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
