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
      emit(AuthErrorState('Registration failed'));
    }
  }
}
