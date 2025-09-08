
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../model/note_model.dart';

class CustomTextNotsField extends StatelessWidget {
   CustomTextNotsField({required this.contentController,required this.note,super.key});
  NoteModel note;
    TextEditingController contentController;

   @override
  Widget build(BuildContext context) {
    return TextField(
      controller: contentController,
      keyboardType: TextInputType.multiline,
      style: TextStyle(fontSize: 16.sp),
      autofocus: true,
      expands: true,
      cursorColor: Colors.white,
      maxLines: null,
      decoration: InputDecoration(
        hintText: note.content.isEmpty ? "Note" : null,
        border: InputBorder.none,
        contentPadding: EdgeInsets.symmetric(horizontal: 3.w),
      ),
    );
  }
}

