import 'package:bookia/components/appBar/app_bar_with_back.dart';
import 'package:bookia/components/buttons/main_button.dart';
import 'package:bookia/components/inputs/custom_text_field.dart';
import 'package:bookia/core/routes/navigation.dart';
import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var emailcontroller = TextEditingController();
    var passwordcontroller = TextEditingController();
    var namecontroller = TextEditingController();
    var confirmpasswordcontroller = TextEditingController();
    return Scaffold(
      appBar: AppBarWithBack(),
      body: BuildLoginBody(
        namecontroller,
        emailcontroller,
        passwordcontroller,
        confirmpasswordcontroller,
      ),
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

  Padding BuildLoginBody(
    TextEditingController namecontroller,
    TextEditingController emailcontroller,
    TextEditingController passwordcontroller,
    TextEditingController confirmpasswordcontroller,
  ) {
    return Padding(
      padding: const EdgeInsets.all(22.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'Hello! Register to get started',
              style: TextStyles.textsize30(),
            ),
            SizedBox(height: 30),
            CustomTextField(controller: namecontroller, hint: 'Username'),
            SizedBox(height: 12),
            CustomTextField(controller: emailcontroller, hint: 'Email'),
            SizedBox(height: 12),
            CustomTextField(controller: passwordcontroller, hint: 'Password'),
            SizedBox(height: 12),
            CustomTextField(
              controller: confirmpasswordcontroller,
              hint: 'Password',
            ),
            SizedBox(height: 30),
            MainButton(h: 55, title: 'Register', ontap: () {}),
          ],
        ),
      ),
    );
  }
}
