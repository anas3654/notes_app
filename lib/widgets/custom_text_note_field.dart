import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../model/note_model.dart';

class CustomTextNotsField extends StatelessWidget {
  const CustomTextNotsField({required this.isForTitle, required this.controller, required this.note, super.key});

  final NoteModel note;
  final TextEditingController controller;
  final bool isForTitle;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: isForTitle ? TextInputType.text : TextInputType.multiline,
      style: TextStyle(fontSize: isForTitle ? 20.sp : 16.sp, fontWeight: isForTitle ? FontWeight.bold : FontWeight.normal),
      autofocus: true,
      expands: isForTitle ? false : true,
      cursorColor: Colors.white,
      maxLines: isForTitle ? 1 : null,
      decoration: InputDecoration(
        hintText: isForTitle ? 'Title' : 'type here...',
        border: InputBorder.none,
        contentPadding: EdgeInsets.symmetric(horizontal: 3.w),
      ),
    );
  }
}
