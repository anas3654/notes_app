import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';


class CustomTextNotsField extends StatelessWidget {
  const CustomTextNotsField({required this.controller, this.isForTitle = false, super.key, required this.hintText});

  final TextEditingController controller;
  final bool isForTitle ;
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: isForTitle ? TextInputType.text :  TextInputType.multiline,
      style: TextStyle(fontSize: isForTitle ? 20.sp : 16.sp, fontWeight: isForTitle ? FontWeight.bold : FontWeight.normal),
      autofocus: true,
      expands: !isForTitle ,
      cursorColor: Colors.white,
      maxLines: isForTitle ? 1 :  null,
      decoration: InputDecoration(
        hintText: hintText,
        border: InputBorder.none,
        contentPadding: EdgeInsets.symmetric(horizontal: 3.w),
      ),
    );
  }
}
