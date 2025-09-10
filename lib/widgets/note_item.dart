import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../model/note_model.dart';

class NoteItem extends StatefulWidget {
  const NoteItem({super.key});

  @override
  State<NoteItem> createState() => _NoteItemState();
}

class _NoteItemState extends State<NoteItem> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.only(top: 2.h),
        separatorBuilder: (context, index) {
          return SizedBox(
            height: 2.h,
          );
        },
        itemCount: notes.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, '/noteDetails',arguments: notes[index] );
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
                        notes.removeAt(index);
                        setState(() {});
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
                          "${notes[index].date.year}-${notes[index].date.month}-${notes[index].date.day}",
                          style: TextStyle(
                              fontSize: 13.sp, color: Colors.grey.shade400),
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        Text(
                          "${notes[index].date.hour}:${notes[index].date.minute}",
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
      ),
    );
  }
}


