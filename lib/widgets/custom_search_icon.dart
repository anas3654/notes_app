import 'package:flutter/material.dart';
import 'package:note_app/models/note_model.dart';
import 'package:sizer/sizer.dart';

class CustomSearchIcon extends StatelessWidget {
  const CustomSearchIcon({super.key, required this.notes});

  final List<NoteModel> notes;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.sp),
        color: Colors.grey.withValues(alpha: 0.15),
      ),
      child: Padding(
        padding: EdgeInsets.all(10.sp),
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/search');
          },
          child: Icon(
            Icons.search,
            size: 24.sp,
          ),
        ),
      ),
    );
  }
}

