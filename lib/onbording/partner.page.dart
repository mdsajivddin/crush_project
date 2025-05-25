import 'package:crush_app/login/login.page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PartnerPage extends StatefulWidget {
  const PartnerPage({super.key});

  @override
  State<PartnerPage> createState() => _PartnerPageState();
}

class _PartnerPageState extends State<PartnerPage> {
  PageController pageController = PageController();
  int currentIndex = 0;
  List<Map<String, String>> smoothList = [
    {
      "imageUrl": "assets/partner.png",
      "title": "Find your partner\nwith us",
      "subtitle":
          "Amet minim mollit non deserunt\nsit aliqua dolor do amet sint.",
    },
    {
      "imageUrl": "assets/better.png",
      "title": "Dating better than\never before",
      "subtitle":
          "Amet minim mollit non deserunt\nsit aliqua dolor do amet sint.",
    },
    {
      "imageUrl": "assets/perfect.png",
      "title": "Find your perfect\nmatch",
      "subtitle":
          "Amet minim mollit non deserunt\nsit aliqua dolor do amet sint.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF5F7),
      body: PageView.builder(
        onPageChanged: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        controller: pageController,
        itemCount: smoothList.length,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 60.h),
              Center(
                child: Image.asset(
                  // "assets/partner.png",
                  smoothList[index]["imageUrl"].toString(),
                  width: 335.w,
                  height: 380.h,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 30.h),
              Container(
                width: 335.w,
                height: 287.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.r),
                  color: Color(0xFFFFFFFF),
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: 20.h),
                  child: Column(
                    children: [
                      Text(
                        smoothList[index]["title"].toString(),
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                          letterSpacing: -2,
                          fontSize: 28.sp,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1F1216),
                        ),
                      ),
                      Center(
                        child: Text(
                          textAlign: TextAlign.center,
                          smoothList[index]["subtitle"].toString(),
                          style: GoogleFonts.inter(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w300,
                            color: Color(0xFF989394),
                          ),
                        ),
                      ),
                      SizedBox(height: 30.h),
                      SmoothPageIndicator(
                        controller: pageController,
                        count: smoothList.length,
                        effect: ExpandingDotsEffect(
                          dotHeight: 8.h,
                          dotWidth: 8.w,
                          activeDotColor: Color(0xFFBC7BE4),
                        ),
                      ),
                      SizedBox(height: 30.h),
                      GestureDetector(
                        onTap: () {
                          if (currentIndex < smoothList.length - 1) {
                            pageController.nextPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.bounceIn,
                            );
                          } else {
                            // Navigate or show "Done"
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => LoginPage(),
                              ),
                            );
                          }
                        },
                        child: Container(
                          width: 295.w,
                          height: 56.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFFFF84A7),
                                Color(0xFFBC7BE4),
                              ],
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "Next",
                              style: GoogleFonts.inter(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w300,
                                color: Color(0xFFFFFFFF),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
