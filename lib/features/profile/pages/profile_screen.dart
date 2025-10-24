import 'package:bookia/core/constants/app_images.dart';
import 'package:bookia/core/routes/navigator.dart';
import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:bookia/features/profile/widgets/profile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true,
        actions: [
          SvgPicture.asset(AppImages.logoutsvg, width: 20, height: 20),
          Padding(padding: const EdgeInsets.only(right: 19)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(radius: 40, backgroundColor: AppColors.borderColor),
                Gap(16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('**********', style: TextStyles.styleSize20()),
                    Text('*************@gmail.com', style: TextStyles.styleSize14(color: AppColors.greyColor)),
                  ],
                ),
              ],
            ),
            Gap(35),
            ProfileCard(
              title: 'My Orders',
              onTap: () {
                pushTo(context, Routes.myOrder);
              },
            ),
            Gap(10),
            ProfileCard(
              title: 'Edit Profile',
              onTap: () {
                pushTo(context, Routes.editProfile);
              },
            ),
            Gap(10),
            ProfileCard(
              title: 'Reset Password',
              onTap: () {
                pushTo(context, Routes.resetPassword);
              },
            ),
            Gap(10),
            ProfileCard(title: 'FAQ'),
            Gap(10),
            ProfileCard(title: 'Contact Us'),
            Gap(10),
            ProfileCard(title: 'Privacy & Terms'),
            Gap(10),
          ],
        ),
      ),
    );
  }
}
