import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import '../cubits/get_notes/get_notes_cubit.dart';
import '../models/note_model.dart';

class CustomSeparatedListView extends StatelessWidget {
  const CustomSeparatedListView({required this.notes, super.key});

  final List<NoteModel> notes;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.only(top: 2.h),
      separatorBuilder: (context, index) {
        return SizedBox(height: 2.h);
      },
      itemCount: notes.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/noteDetails',
                arguments: {"isFromAddNote": false, "note": notes[index]});
          },
          child: Container(
            padding: EdgeInsets.only(top: 1.h, left: 1.w, bottom: 1.h),
            decoration: BoxDecoration(
              color: Colors.grey.shade800,
              borderRadius: BorderRadius.circular(12.sp),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ListTile(
                  title: Text(
                    notes[index].title,
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    notes[index].content,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.grey.shade400,
                    ),
                  ),
                  trailing: GestureDetector(
                    onTap: () {
                      notes[index].delete();
                      log(notes.length.toString());
                      BlocProvider.of<GetNotesCubit>(context).fetchNotes();
                    },
                    child: Icon(
                      Icons.delete,
                      color: Colors.grey.shade400,
                      size: 21.sp,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 4.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        DateFormat('yyyy/MM/dd').format(notes[index].date),
                        style: TextStyle(
                            fontSize: 13.sp, color: Colors.grey.shade400),
                      ),
                      SizedBox(width: 2.w),
                      Text(
                        DateFormat('hh:mm a').format(notes[index].date),
                        style: TextStyle(
                            fontSize: 13.sp, color: Colors.grey.shade400),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
