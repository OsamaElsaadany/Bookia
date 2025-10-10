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

class Createnewpassword extends StatelessWidget {
  final String verifyCode;
  const Createnewpassword({super.key, required this.verifyCode});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBarWithBack(), body: BuildLoginBody(context));
  }

  Widget BuildLoginBody(BuildContext context) {
    var cubit = context.read<AuthCubit>();
    cubit.otpcontroller.text = verifyCode;
    return BlocListener<AuthCubit, AuthState>(
      listener: (cntext, state) {
        if (state is AuthLoadingState) {
          showLoadingDialog(context);
        } else if (state is AuthSuccessState) {
          pop(context);
          log('success');
          pushandrm(context, Routes.passwordChanged);
        } else if (state is AuthErrorState) {
          pop(context);
          showErrorDialog(context, state.errorMessage);
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(22.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Create new password', style: TextStyles.textsize30()),
              SizedBox(height: 10),
              Text(
                'Your new password must be unique from those previously used.',
                style: TextStyles.textsize16(color: AppColors.graycolor),
              ),
              SizedBox(height: 30),
              CustomTextField(
                controller: cubit.passwordcontroller,
                hint: 'New Password',
              ),
              SizedBox(height: 12),
              CustomTextField(
                controller: cubit.confirmpasswordcontroller,
                hint: 'Confirm Password',
              ),
              SizedBox(height: 30),
              MainButton(
                h: 55,
                title: 'Reset Password',
                ontap: () {
                  // if (cubit.formkey.currentState!.validate()) {
                  cubit.resetPassword();
                  // }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
