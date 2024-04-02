import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_app/core/network/api/endpoints.dart';
import 'package:gallery_app/features/login/cubit/login_state.dart';
import 'package:gallery_app/features/login/rope/login_repo.dart';

import '../model/login_user_data_Model/login_user_data.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.userRepo) : super(LoginInitial());
  static LoginCubit get(context) => BlocProvider.of(context);
  final LoginRepo userRepo;

  //============================
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey();
  LoginUserDataModel? user;

  login() async {
    emit(LoginLoadingState());
    final response = await userRepo.signIn(
        email: emailController.text.isNotEmpty
            ? emailController.text
            : ApiConst.email,
        password: passwordController.text.isNotEmpty
            ? passwordController.text
            : ApiConst.password);
    response.fold(
        (errorModel) =>
            emit(LoginFailureState(errorMsg: errorModel.errorMessage)), (r) {
      user = r;
      emit(LoginSucessState());
    });
  }
}
