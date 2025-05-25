import 'package:crush_app/addProfile/addProfile.page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otp_pin_field/otp_pin_field.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      appBar: AppBar(
        backgroundColor: Color(0xFFFFFFFF),
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios, color: Colors.black, size: 25.sp),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 22.w, right: 22.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Enter Verification Code",
              style: GoogleFonts.lexend(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1F1216),
              ),
            ),
            Text(
              "Please enter your phone number to continue",
              style: GoogleFonts.lexend(
                fontSize: 14.sp,
                fontWeight: FontWeight.w300,
                color: Color(0xFF1F1216),
              ),
            ),
            SizedBox(height: 50.h),
            OtpPinField(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              fieldHeight: 50.h,
              fieldWidth: 50.w,
              keyboardType: TextInputType.number,
              maxLength: 5,
              otpPinFieldDecoration:
                  OtpPinFieldDecoration.roundedPinBoxDecoration,
              otpPinFieldStyle: OtpPinFieldStyle(
                filledFieldBackgroundColor: Color(0xFFBC7BE4),
                defaultFieldBackgroundColor: Color(0xFFFFFFFF),
                textStyle: GoogleFonts.lexend(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),

              onSubmit: (text) {},
              onChange: (text) {},
            ),
            SizedBox(height: 30.h),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (context) => AddprofilePage()),
                );
              },
              child: Container(
                width: 335.w,
                height: 56.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  gradient: LinearGradient(
                    colors: [Color(0xFFFF84A7), Color(0xFFBC7BE4)],
                  ),
                ),
                child: Center(
                  child: Text(
                    "Continue",
                    style: GoogleFonts.inter(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
