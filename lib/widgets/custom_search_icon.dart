import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomSearchIcon extends StatelessWidget {
  const CustomSearchIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.sp),
        color: Colors.grey.withOpacity(0.15),
      ),
      child: Padding(
        padding: EdgeInsets.all(10.sp),
        child: GestureDetector(
          onTap: () {},
          child: Icon(
              Icons.search,
              size: 24.sp,
            ),
        ),
      ),
    );
  }
}
