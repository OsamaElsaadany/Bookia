import 'package:bookia/components/appBar/app_bar_with_back.dart';
import 'package:bookia/components/buttons/main_button.dart';
import 'package:bookia/core/constants/app_colors.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class Otpverfication extends StatelessWidget {
  const Otpverfication({super.key});

  @override
  Widget build(BuildContext context) {
    var emailcontroller = TextEditingController();
    return Scaffold(
      appBar: AppBarWithBack(),
      body: BuildLoginBody(emailcontroller),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Didn’t received code?'),
          TextButton(child: Text('Resend'), onPressed: () {}),
        ],
      ),
    );
  }

  Padding BuildLoginBody(TextEditingController emailcontroller) {
    return Padding(
      padding: const EdgeInsets.all(22.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('OTP Verification', style: TextStyles.textsize30()),
            SizedBox(height: 10),
            Text(
              'Enter the verification code we just sent on your email address.',
              style: TextStyles.textsize16(color: AppColors.graycolor),
            ),
            SizedBox(height: 30),
            Pinput(
              length: 4,
              showCursor: true,
              onCompleted: (pin) {
                print("OTP Entered: $pin");
              },
              defaultPinTheme: PinTheme(
                width: 65,
                height: 65,
                textStyle: TextStyle(
                  fontSize: 22,
                  color: AppColors.blackcolor,
                  fontWeight: FontWeight.bold,
                ),
                decoration: BoxDecoration(
                  color: AppColors.whitecolor,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: AppColors.graycolor.withOpacity(0.4),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
              ),
              focusedPinTheme: PinTheme(
                width: 65,
                height: 65,
                textStyle: TextStyle(
                  fontSize: 22,
                  color: AppColors.primarycolor,
                  fontWeight: FontWeight.bold,
                ),
                decoration: BoxDecoration(
                  color: AppColors.whitecolor,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.primarycolor, width: 2),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primarycolor.withOpacity(0.2),
                      blurRadius: 8,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
              ),
              separatorBuilder: (index) =>
                  const SizedBox(width: 35),
            ),
            SizedBox(height: 40),
            MainButton(h: 55, title: 'Send Code', ontap: () {}),
          ],
        ),
      ),
    );
  }
}
