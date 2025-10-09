import 'package:bookia/core/constants/app_images.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset(AppImages.logoSvg, width: 120, height: 40),
        centerTitle: false,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(AppImages.books),
            SizedBox(height: 15),
            Center(child: SvgPicture.asset(AppImages.slide)),
            SizedBox(height: 30),
            Expanded(
              child: ListView(
                children: [
                  Text('Best Seller', style: TextStyles.textsize24()),
                  SizedBox(height: 15),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
