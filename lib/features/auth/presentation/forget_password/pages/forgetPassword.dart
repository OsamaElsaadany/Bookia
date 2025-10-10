import 'dart:developer';

import 'package:bookia/components/appBar/app_bar_with_back.dart';
import 'package:bookia/components/buttons/main_button.dart';
import 'package:bookia/components/inputs/custom_text_field.dart';
import 'package:bookia/core/constants/app_colors.dart';
import 'package:bookia/core/functions/dialogs.dart';
import 'package:bookia/core/routes/navigation.dart';
import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:bookia/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:bookia/features/auth/presentation/cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Forgetpassword extends StatelessWidget {
  const Forgetpassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithBack(),
      body: BuildLoginBody(context),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Remember Password?'),
          TextButton(
            child: Text('Login'),
            onPressed: () {
              pushrplc(context, Routes.login);
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
          pushandrm(context, Routes.otpverfication);
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Forgot Password?', style: TextStyles.textsize30()),
                SizedBox(height: 10),
                Text(
                  'Don\'t worry! It occurs. Please enter the email address linked with your account.',
                  style: TextStyles.textsize16(color: AppColors.graycolor),
                ),
                SizedBox(height: 30),
                CustomTextField(
                  controller: cubit.emailcontroller,
                  hint: 'Enter your email',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!RegExp(
                      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                    ).hasMatch(value)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),

                SizedBox(height: 40),
                MainButton(
                  h: 55,
                  title: 'Send Code',
                  ontap: () {
                    if (cubit.formkey.currentState!.validate()) {
                      cubit.sendForgetPassword();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
