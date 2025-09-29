import 'package:bookia/core/constants/app_colors.dart';
import 'package:bookia/core/constants/app_images.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class socialLogin extends StatelessWidget {
  const socialLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: Divider()),
            SizedBox(width: 30),
            Text('OR', style: TextStyles.textsize16()),
            SizedBox(width: 30),
            Expanded(child: Divider()),
          ],
        ),
        SizedBox(height: 30),
        socialButton(
          text: 'Sign in with Google',
          image: AppImages.googleSvg,
        ),
        SizedBox(height: 15),
        socialButton(
          text: 'Sign in with Apple',
          image: AppImages.appleSvg,
        ),
      ],
    );
  }
}

class socialButton extends StatelessWidget {
  const socialButton({super.key, required this.text, required this.image});
  final String text;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.bordercolor),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(image),
          SizedBox(width: 10),
          Text(
            text,
            style: TextStyles.textsize14(color: AppColors.darkgraycolor),
          ),
        ],
      ),
    );
  }
}
