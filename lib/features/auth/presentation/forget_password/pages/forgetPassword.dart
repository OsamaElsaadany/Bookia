import 'package:bookia/components/appBar/app_bar_with_back.dart';
import 'package:bookia/components/buttons/main_button.dart';
import 'package:bookia/components/inputs/custom_text_field.dart';
import 'package:bookia/core/constants/app_colors.dart';
import 'package:bookia/core/routes/navigation.dart';
import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class Forgetpassword extends StatelessWidget {
  const Forgetpassword({super.key});

  @override
  Widget build(BuildContext context) {
    var emailcontroller = TextEditingController();
    return Scaffold(
      appBar: AppBarWithBack(),
      body: BuildLoginBody(emailcontroller, context),
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

  Padding BuildLoginBody(
    TextEditingController emailcontroller,
    BuildContext context,
  ) {
    return Padding(
      padding: const EdgeInsets.all(22.0),
      child: SingleChildScrollView(
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
              controller: emailcontroller,
              hint: 'Enter your email',
            ),

            SizedBox(height: 40),
            MainButton(
              h: 55,
              title: 'Send Code',
              ontap: () {
                pushandrm(context, Routes.otpverfication);
              },
            ),
          ],
        ),
      ),
    );
  }
}
