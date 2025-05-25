import 'package:crush_app/login/otp.page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class PhonePage extends StatefulWidget {
  const PhonePage({super.key});

  @override
  State<PhonePage> createState() => _PhonePageState();
}

class _PhonePageState extends State<PhonePage> {
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
              "Enter Phone Number",
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
            IntlPhoneField(
              decoration: InputDecoration(
                counterText: '',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: BorderSide(color: Color(0xFFBC7BE4), width: 1.w),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: BorderSide(color: Color(0xFFBC7BE4), width: 1.w),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: BorderSide(color: Color(0xFFBC7BE4), width: 1.w),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: BorderSide(color: Color(0xFFBC7BE4), width: 1.w),
                ),
              ),
              initialCountryCode: 'IN',
              onChanged: (Phone) {
                print(Phone.completeNumber);
              },
            ),
            SizedBox(height: 33.h),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (context) => OtpPage()),
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
