import 'package:crush_app/onbording/partner.page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnbordingPage extends StatefulWidget {
  const OnbordingPage({super.key});

  @override
  State<OnbordingPage> createState() => _OnbordingPageState();
}

class _OnbordingPageState extends State<OnbordingPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
      Duration(seconds: 3),
      () => Navigator.push(
        context,
        CupertinoPageRoute(builder: (context) => PartnerPage()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFDF5F7),
      body: Center(child: Image.asset("assets/likelogo.png")),
    );
  }
}
