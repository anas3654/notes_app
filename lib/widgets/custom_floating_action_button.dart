import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../models/note_model.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({super.key});


  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.only(bottom: 2.h),
      child: FloatingActionButton(
        onPressed: () {
          NoteModel note = NoteModel(title: "", content: "", date: DateTime.now());
          Navigator.pushNamed(context, '/noteDetails' ,arguments: {"isFromAddNote": true, "note":note });
        },
        backgroundColor: Colors.black,
        child: Icon(
          Icons.add,
          size: 24.sp,
          color: Colors.white,
        ),
      ),
    );
  }
}
