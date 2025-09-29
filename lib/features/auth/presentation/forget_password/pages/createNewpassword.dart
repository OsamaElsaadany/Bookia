import 'package:bookia/components/appBar/app_bar_with_back.dart';
import 'package:bookia/components/buttons/main_button.dart';
import 'package:bookia/components/inputs/custom_text_field.dart';
import 'package:bookia/core/constants/app_colors.dart';
import 'package:bookia/core/routes/navigation.dart';
import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class Createnewpassword extends StatelessWidget {
  const Createnewpassword({super.key});

  @override
  Widget build(BuildContext context) {
    var passwordcontroller = TextEditingController();
    var confirmpasswordcontroller = TextEditingController();
    return Scaffold(
      appBar: AppBarWithBack(),
      body: BuildLoginBody(
        passwordcontroller,
        confirmpasswordcontroller,
        context,
      ),
    );
  }

  Padding BuildLoginBody(
    TextEditingController passwordcontroller,
    TextEditingController confirmpasswordcontroller,
    BuildContext context,
  ) {
    return Padding(
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
              controller: passwordcontroller,
              hint: 'New Password',
            ),
            SizedBox(height: 12),
            CustomTextField(
              controller: confirmpasswordcontroller,
              hint: 'Confirm Password',
            ),
            SizedBox(height: 30),
            MainButton(
              h: 55,
              title: 'Reset Password',
              ontap: () {
                pushandrm(context, Routes.passwordChanged);
              },
            ),
          ],
        ),
      ),
    );
  }
}
