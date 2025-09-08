import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.only(top: 2.h),
        itemBuilder: (context, index) {
          return Container(
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
                    'Meeting Notes',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    'Discuss project timeline and deliverables. uiadshpuifasdui;fhuijfhuiabfijdbbuijcbnbiujfhhcbudsjfnbndusifhjdnihfbui',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.grey.shade400,
                    ),
                  ),
                  trailing: GestureDetector(
                    onTap: () {},
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
                        "12:30 PM",
                        style: TextStyle(
                            fontSize: 13.sp, color: Colors.grey.shade400),
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      Text(
                        "May 12, 2024",
                        style: TextStyle(
                            fontSize: 13.sp, color: Colors.grey.shade400),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            height: 2.h,
          );
        },
        itemCount: 10,
      ),
    );
  }
}
