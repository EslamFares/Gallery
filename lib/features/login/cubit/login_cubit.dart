import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  bool ispassword = true;
  changePasswordState() {
    ispassword = !ispassword;
    emit(ChangePasswordState());
  }

  login() async {
    if (loginFormKey.currentState!.validate()) {
      emit(LoginLoadingState());
      final response = await userRepo.signIn(
          email: emailController.text, password: passwordController.text);
      response.fold(
          (errorModel) => emit(LoginFailureState(errorMsg: errorModel)), (r) {
        user = r;
        emit(LoginSucessState());
      });
    }
  }
}
