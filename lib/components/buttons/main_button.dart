import 'package:bookia/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    super.key,
    required this.h,
    required this.title,
    required this.ontap,
    this.bgcolor = AppColors.primarycolor,
    this.bordercolor, this.txtcolor,
  });

  final double h;
  final String title;
  final Color bgcolor;
  final Color? bordercolor;
  final Color? txtcolor;
  final Function() ontap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: h,

      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: AppColors.whitecolor,
          backgroundColor: bgcolor,
          side: bordercolor != null
              ? BorderSide(color: bordercolor ?? AppColors.darkcolor)
              : BorderSide.none,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        onPressed: ontap,
        child: Text(
          title,
          style: TextStyle(
            color: txtcolor ?? AppColors.whitecolor,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
