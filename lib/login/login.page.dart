import 'package:crush_app/login/phone.page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 100.h),
          Center(child: Image.asset("assets/likelogo.png")),
          SizedBox(height: 50.h),
          Text(
            "Signup to Continue",
            style: GoogleFonts.lexend(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1F1216),
            ),
          ),
          Text(
            "Please login to continue",
            style: GoogleFonts.lexend(
              fontSize: 14.sp,
              fontWeight: FontWeight.w300,
              color: Color(0xFF989394),
            ),
          ),
          SizedBox(height: 30.h),
          Container(
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
                "Continue with Email",
                style: GoogleFonts.inter(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(height: 16.h),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                CupertinoPageRoute(builder: (context) => PhonePage()),
              );
            },
            child: Container(
              width: 335.w,
              height: 56.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(color: Color(0xFFBC7BE4), width: 1.w),
              ),
              child: Center(
                child: Text(
                  "Continue with Phone Number",
                  style: GoogleFonts.inter(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFFBC7BE4),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 30.h),
          Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w),
            child: Row(
              children: [
                Expanded(
                  child: Divider(
                    indent: 10,
                    endIndent: 10,
                    color: Color(0xFFD8D8D8),
                  ),
                ),
                Text(
                  "Or Signup with ",
                  style: GoogleFonts.inter(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w300,
                    color: Color(0xFF1F1216),
                  ),
                ),
                Expanded(
                  child: Divider(
                    indent: 10,
                    endIndent: 10,
                    color: Color(0xFFD8D8D8),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 30.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 162.w,
                height: 50.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(color: Color(0xFF989394), width: 1.w),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //SizedBox(width: 8.w),
                    Image.asset("assets/google.png"),
                    SizedBox(width: 8.w),
                    Text(
                      "Google",
                      style: GoogleFonts.inter(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w300,
                        color: Color(0xFF1F1216),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 10.w),
              Container(
                width: 162.w,
                height: 50.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(color: Color(0xFF989394), width: 1.w),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //SizedBox(width: 8.w),
                    Image.asset("assets/facebook.png"),
                    SizedBox(width: 8.w),
                    Text(
                      "Facebook",
                      style: GoogleFonts.inter(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w300,
                        color: Color(0xFF1F1216),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 75.h),
          Text(
            "I accept all the ",
            style: GoogleFonts.inter(
              fontSize: 14.sp,
              fontWeight: FontWeight.w300,
              color: Color(0xFF1F1216),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Terms & Conditions ",
                style: GoogleFonts.inter(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w300,
                  color: Color(0xFFBC7BE4),
                ),
              ),
              Text(
                "&",
                style: GoogleFonts.inter(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w300,
                  color: Color(0xFF1F1216),
                ),
              ),
              Text(
                " Privacy Policy",
                style: GoogleFonts.inter(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w300,
                  color: Color(0xFFBC7BE4),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
