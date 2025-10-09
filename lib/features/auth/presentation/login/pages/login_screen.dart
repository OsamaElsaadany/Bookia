import 'dart:developer';

import 'package:bookia/components/appBar/app_bar_with_back.dart';
import 'package:bookia/components/buttons/main_button.dart';
import 'package:bookia/components/inputs/custom_text_field.dart';
import 'package:bookia/core/constants/app_colors.dart';
import 'package:bookia/core/constants/app_images.dart';
import 'package:bookia/core/functions/dialogs.dart';
import 'package:bookia/core/routes/navigation.dart';
import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:bookia/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:bookia/features/auth/presentation/cubit/auth_state.dart';
import 'package:bookia/features/auth/presentation/login/widgets/social_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithBack(),
      body: BuildLoginBody(context),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Don’t have an account?'),
          TextButton(
            child: Text('Register Now'),
            onPressed: () {
              pushrplc(context, Routes.signup);
            },
          ),
        ],
      ),
    );
  }

  Widget BuildLoginBody(BuildContext context) {
    var cubit = context.read<AuthCubit>();
    return BlocListener<AuthCubit, AuthState>(
      listener: (cntext, state) {
        if (state is AuthLoadingState) {
          showLoadingDialog(context);
        } else if (state is AuthSuccessState) {
          pop(context);
          log('success');
        } else if (state is AuthErrorState) {
          pop(context);
          showErrorDialog(context, state.errorMessage);
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(22.0),
        child: SingleChildScrollView(
          child: Form(
            key: cubit.formkey,
            child: Column(
              children: [
                Text(
                  'Welcome back! Glad to see you, Again!',
                  style: TextStyles.textsize30(),
                ),
                SizedBox(height: 30),
                CustomTextField(
                  controller: cubit.emailcontroller,
                  hint: 'Enter your email',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'email is reqiured';
                    } else if (!RegExp(
                      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                    ).hasMatch(value)) {
                      return 'invalid email format';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                CustomTextField(
                  controller: cubit.passwordcontroller,
                  hint: 'Enter your password',
                  validator: (value){
                    if (value == null || value.isEmpty) {
                      return 'password is reqiured';
                    } else if (value.length < 6) {
                      return 'password must be at least 6 characters';
                    }
                    return null;
                  },
                  suffixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [SvgPicture.asset(AppImages.eyeSvg)],
                  ),
                ),
                SizedBox(height: 5),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    style: TextButton.styleFrom(padding: EdgeInsets.all(0)),
                    onPressed: () {
                      pushto(context, Routes.forgetpassword);
                    },
                    child: Text(
                      'Forgot Password?',
                      style: TextStyles.textsize14(
                        color: AppColors.darkgraycolor,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                MainButton(h: 55, title: 'Login', ontap: () {
                  if(cubit.formkey.currentState!.validate()){
                    cubit.login();
                  }
                }),
                SizedBox(height: 30),
                socialLogin(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
