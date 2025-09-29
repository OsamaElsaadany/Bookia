import 'package:bookia/components/buttons/main_button.dart';
import 'package:bookia/core/constants/app_colors.dart';
import 'package:bookia/core/constants/app_images.dart';
import 'package:bookia/core/routes/navigation.dart';
import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Passwordchanged extends StatelessWidget {
  const Passwordchanged({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(AppImages.successSvg),
              SizedBox(height: 30),
              SizedBox(
                width: 227,
                child: Column(
                  children: [
                    Text('Password Changed!', style: TextStyles.textsize24()),
                    SizedBox(height: 5),
                    Text(
                      'Your password has been changed successfully.',
                      textAlign: TextAlign.center,
                      style: TextStyles.textsize14(color: AppColors.graycolor),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40),
              MainButton(
                h: 56,
                title: 'Back to Login',
                ontap: () {
                  pushrplc(context, Routes.login);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
