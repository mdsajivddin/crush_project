import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';

class AddprofilePage extends StatefulWidget {
  const AddprofilePage({super.key});

  @override
  State<AddprofilePage> createState() => _AddprofilePageState();
}

class _AddprofilePageState extends State<AddprofilePage> {
  File? image;
  final picker = ImagePicker();

  Future pickerImageFromGallery() async {
    var status = await Permission.camera.request();
    if (status.isGranted) {
      final PickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (PickedFile != null) {
        setState(() {
          image = File(PickedFile.path);
        });
      }
    } else {
      print("Galler permission is denied");
    }
  }

  Future pickImageFromCamera() async {
    var status = await Permission.camera.request();
    if (status.isGranted) {
      final PickedFile = await picker.pickImage(source: ImageSource.camera);
      if (PickedFile != null) {
        setState(() {
          image = File(PickedFile.path);
        });
      }
    } else {
      print("Camera permission is denied");
    }
  }

  Future showImage() async {
    showCupertinoModalPopup(
      context: context,
      builder:
          (context) => CupertinoActionSheet(
            actions: [
              CupertinoActionSheetAction(
                onPressed: () {
                  Navigator.pop(context);
                  pickerImageFromGallery();
                },
                child: Text("Gallery"),
              ),
              CupertinoActionSheetAction(
                onPressed: () {
                  Navigator.pop(context);
                  pickImageFromCamera();
                },
                child: Text("Camera"),
              ),
            ],
          ),
    );
  }

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  DateTime? selectedDate;
  Future<void> pickDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      initialDate: selectedDate,
    );
    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
        dateController.text = DateFormat('dd MMM yyyy').format(pickedDate);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    dateController.text = "11/11/2021";
    selectedDate = DateTime.now();
    dateController.text = DateFormat('dd MMM yyyy').format(selectedDate!);
  }

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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 22.w, right: 22.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Add Profile Details",
                style: GoogleFonts.lexend(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1F1216),
                ),
              ),
              Text(
                "Please Add your Profile details here",
                style: GoogleFonts.lexend(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w300,
                  color: Color(0xFF1F1216),
                ),
              ),
              SizedBox(height: 21.h),
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 97.w,
                      height: 100.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: Colors.grey,
                      ),
                      child:
                          image == null
                              ? Image.asset(
                                "assets/addprofile.png",
                                fit: BoxFit.cover,
                              )
                              : Image.file(image!, fit: BoxFit.cover),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: () {
                          showImage();
                        },
                        child: Container(
                          width: 25.w,
                          height: 25.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(10.r),
                            ),
                            gradient: LinearGradient(
                              colors: [Color(0xFFFF7689), Color(0xFFBC7BE4)],
                            ),
                          ),
                          child: Icon(
                            Icons.edit_square,
                            color: Colors.white,
                            size: 20.sp,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 22.h),
              ProfileBody(
                name: "Mark johnson",
                hintxt: 'Name',
                type: TextInputType.name,
                controller: nameController,
              ),
              SizedBox(height: 10.h),
              ProfileBody(
                name: "Globally@gmail.com",
                hintxt: 'Email Address',
                type: TextInputType.emailAddress,
                controller: emailController,
              ),
              SizedBox(height: 10.h),
              ProfileBody(
                name: "(+91) 9885632665",
                hintxt: 'Mobile number',
                type: TextInputType.phone,
                controller: phoneController,
              ),
              SizedBox(height: 10.h),
              ProfileBody(
                name: "MI road  Jaipur (Raj)",
                hintxt: 'Enter Address',
                type: TextInputType.streetAddress,
                controller: addressController,
              ),
              SizedBox(height: 10.h),
              TextFormField(
                readOnly: true,
                onTap: () {
                  pickDate();
                },
                controller: dateController,
                // initialValue:
                //     selectedDate != null
                //         ? DateFormat('dd MMM yyyy').format(selectedDate!)
                //         : "01/02/2025",
                style: GoogleFonts.inter(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF000000),
                ),
                decoration: InputDecoration(
                  labelText: 'Date of birth',
                  labelStyle: GoogleFonts.inter(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFFBC7BE4),
                  ),
                  suffixIcon: Icon(
                    Icons.date_range_outlined,
                    color: Color(0xFFBC7BE4),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFBC7BE4),
                      width: 1.w,
                    ),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFBC7BE4),
                      width: 1.w,
                    ),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 12.h,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileBody extends StatelessWidget {
  final String hintxt;
  final String name;
  final TextEditingController controller;
  final TextInputType type;
  const ProfileBody({
    super.key,
    required this.hintxt,
    required this.controller,
    required this.type,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: type,
      initialValue: name,
      style: GoogleFonts.inter(
        fontSize: 15.sp,
        fontWeight: FontWeight.w500,
        color: Color(0xFF000000),
      ),
      decoration: InputDecoration(
        labelText: hintxt,
        labelStyle: GoogleFonts.inter(
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
          color: Color(0xFFBC7BE4),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFBC7BE4), width: 1.w),
          borderRadius: BorderRadius.circular(10.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFBC7BE4), width: 1.w),
          borderRadius: BorderRadius.circular(10.r),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      ),
    );
  }
}
