import 'package:bookia/components/buttons/main_button.dart';
import 'package:bookia/core/constants/app_colors.dart';
import 'package:bookia/core/constants/app_images.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AppImages.background,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(22.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(flex: 2),
                SvgPicture.asset(AppImages.logoSvg),
                SizedBox(height: 10),
                Text(
                  'Order Your Book Now!',
                  style: TextStyles.textsize18(color: AppColors.darkcolor),
                ),
                Spacer(flex: 5),
                MainButton(h: 56, title: 'Login', ontap: () {}),
                SizedBox(height: 15),
                MainButton(h: 56, title: 'Register', ontap: () {}),
                Spacer(flex: 1),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
