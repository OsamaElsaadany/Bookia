import 'package:bookia/core/constants/app_colors.dart';
import 'package:bookia/core/constants/app_images.dart';
import 'package:bookia/features/home/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MainappScreen extends StatefulWidget {
  const MainappScreen({super.key});

  @override
  State<MainappScreen> createState() => _MainappScreenState();
}

class _MainappScreenState extends State<MainappScreen> {
  List<Widget> screens = [Homescreen()];

  int currentindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentindex],
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.whitecolor,
            boxShadow: [
              BoxShadow(
                color: AppColors.graycolor.withValues(alpha: .2),
                blurRadius: 10,
                offset: Offset(0, -2),
              ),
            ],
          ),
          child: BottomNavigationBar(
            currentIndex: currentindex,
            onTap: (index) {
              setState(() {
                currentindex = index;
              });
            },
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.transparent,
            elevation: 0,
            selectedItemColor: AppColors.primarycolor,
            unselectedItemColor: AppColors.darkcolor,
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(AppImages.homeSvg),
                label: '',
              ),

              BottomNavigationBarItem(
                icon: SvgPicture.asset(AppImages.bookmarkSvg),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(AppImages.categorySvg),
                label: '',
              ),

              BottomNavigationBarItem(
                icon: SvgPicture.asset(AppImages.profileSvg),
                label: '',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
