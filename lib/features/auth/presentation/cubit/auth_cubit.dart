import 'package:bookia/features/auth/data/models/auth_params.dart';
import 'package:bookia/features/auth/data/repo/auth_repo.dart';
import 'package:bookia/features/auth/presentation/cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitialState());

  var formkey = GlobalKey<FormState>();
  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();
  var namecontroller = TextEditingController();
  var confirmpasswordcontroller = TextEditingController();
  var otpcontroller = TextEditingController();

  register() async {
    emit(AuthLoadingState());

    var params = AuthParams(
      name: namecontroller.text,
      email: emailcontroller.text,
      password: passwordcontroller.text,
      confirmpassword: confirmpasswordcontroller.text,
    );
    var res = await AuthRepo.regester(params);
    if (res != null) {
      emit(AuthSuccessState());
    } else {
      emit(AuthErrorState(errorMessage: 'Registration failed'));
    }
  }

  login() async {
    emit(AuthLoadingState());

    var params = AuthParams(
      email: emailcontroller.text,
      password: passwordcontroller.text,
    );
    var res = await AuthRepo.login(params);
    if (res != null) {
      emit(AuthSuccessState());
    } else {
      emit(AuthErrorState(errorMessage: 'login failed'));
    }
  }

  sendForgetPassword() async {
    emit(AuthLoadingState());

    var params = AuthParams(email: emailcontroller.text);
    var res = await AuthRepo.sendForgetPassword(params);
    if (res != null) {
      emit(AuthSuccessState());
    } else {
      emit(AuthErrorState(errorMessage: 'failed to send reset email'));
    }
  }

  checkForgetPassword() async {
    emit(AuthLoadingState());

    var params = AuthParams(verifycode: otpcontroller.text, email: emailcontroller.text);
    var res = await AuthRepo.checkForgetPassword(params);
    if (res != null) {
      emit(AuthSuccessState());
    } else {
      emit(AuthErrorState(errorMessage: 'failed to verify OTP'));
    }
  }

  resetPassword() async {
    emit(AuthLoadingState());

    var params = AuthParams(
      verifycode: otpcontroller.text,
      password: passwordcontroller.text,
      confirmpassword: confirmpasswordcontroller.text,
    );
    var res = await AuthRepo.resetPassword(params);
    if (res != null) {
      emit(AuthSuccessState());
    } else {
      emit(AuthErrorState(errorMessage: 'failed to reset password'));
    }
  }
}
