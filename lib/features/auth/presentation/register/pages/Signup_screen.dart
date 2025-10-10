import 'dart:developer';

import 'package:bookia/components/appBar/app_bar_with_back.dart';
import 'package:bookia/components/buttons/main_button.dart';
import 'package:bookia/components/inputs/custom_text_field.dart';
import 'package:bookia/core/functions/dialogs.dart';
import 'package:bookia/core/routes/navigation.dart';
import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:bookia/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:bookia/features/auth/presentation/cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithBack(),
      body: BuildLoginBody(context),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Already have an account?'),
          TextButton(
            child: Text('Login Now'),
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
                  'Hello! Register to get started',
                  style: TextStyles.textsize30(),
                ),
                SizedBox(height: 30),
                CustomTextField(
                  controller: cubit.namecontroller,
                  hint: 'Username',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'name is reqiured';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 12),
                CustomTextField(
                  controller: cubit.emailcontroller,
                  hint: 'Email',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'email is reqiured';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 12),
                CustomTextField(
                  controller: cubit.passwordcontroller,
                  hint: 'Password',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password is reqiured';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 12),
                CustomTextField(
                  controller: cubit.confirmpasswordcontroller,
                  hint: 'Password',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'confirm Password is reqiured';
                    } else if (value != cubit.passwordcontroller.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 30),
                MainButton(
                  h: 55,
                  title: 'Register',
                  ontap: () {
                    if (cubit.formkey.currentState!.validate()) {
                      cubit.register();
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
