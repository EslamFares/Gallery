import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_app/core/dependency_injection/get_it_stetup.dart';
import 'package:gallery_app/core/func/mybloc_observer.dart';
import 'package:gallery_app/features/login/cubit/login_cubit.dart';
import 'package:gallery_app/features/login/view/login_view.dart';

import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  setupGetIt();
  Bloc.observer = MyBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gallery',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:
          // BlocProvider(
          //   create: (context) => getIt<HomeCubit>()..getMYGalleryData(),
          //   child: const HomeView(),
          // ),
          //==========
          BlocProvider(
        create: (context) => getIt<LoginCubit>(),
        child: const LoginView(),
      ),
    );
  }
}
