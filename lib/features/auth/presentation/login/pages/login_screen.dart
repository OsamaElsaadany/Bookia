import 'package:bookia/components/appBar/app_bar_with_back.dart';
import 'package:bookia/components/buttons/main_button.dart';
import 'package:bookia/components/inputs/custom_text_field.dart';
import 'package:bookia/core/constants/app_colors.dart';
import 'package:bookia/core/constants/app_images.dart';
import 'package:bookia/core/routes/navigation.dart';
import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:bookia/features/auth/presentation/login/widgets/social_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var emailcontroller = TextEditingController();
    var passwordcontroller = TextEditingController();
    return Scaffold(
      appBar: AppBarWithBack(),
      body: BuildLoginBody(emailcontroller, passwordcontroller, context),
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

  Padding BuildLoginBody(
    TextEditingController emailcontroller,
    TextEditingController passwordcontroller,
    BuildContext context,
  ) {
    return Padding(
      padding: const EdgeInsets.all(22.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'Welcome back! Glad to see you, Again!',
              style: TextStyles.textsize30(),
            ),
            SizedBox(height: 30),
            CustomTextField(
              controller: emailcontroller,
              hint: 'Enter your email',
            ),
            SizedBox(height: 10),
            CustomTextField(
              controller: passwordcontroller,
              hint: 'Enter your password',
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
                  style: TextStyles.textsize14(color: AppColors.darkgraycolor),
                ),
              ),
            ),
            SizedBox(height: 15),
            MainButton(h: 55, title: 'Login', ontap: () {}),
            SizedBox(height: 30),
            socialLogin(),
          ],
        ),
      ),
    );
  }
}
