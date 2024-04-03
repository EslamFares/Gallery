import 'package:dio/dio.dart';
import 'package:gallery_app/core/network/api_service.dart';
import 'package:gallery_app/features/home/cubit/home_cubit.dart';
import 'package:gallery_app/features/home/repo/home_repo.dart';
import 'package:gallery_app/features/login/cubit/login_cubit.dart';
import 'package:gallery_app/features/login/rope/login_repo.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
Future<void> setupGetIt() async {
  /// dio $ ApiService
  Dio dio = Dio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio: dio));

//=====user===========
  ///LoginRepo
  getIt.registerLazySingleton<LoginRepo>(
      () => LoginRepo(api: getIt<ApiService>()));
  //=====Gallery===========
  ///LoginRepo
  getIt.registerLazySingleton<HomeRepo>(
      () => HomeRepo(api: getIt<ApiService>()));

  ///LoginCubit
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt<LoginRepo>()));

  ///HomeCubit
  getIt.registerLazySingleton<HomeCubit>(() => HomeCubit(getIt<HomeRepo>()));

  //=========home====
  //registerFactory ==> for more than once use
  // getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt()));
}
