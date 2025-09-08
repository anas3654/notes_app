import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_floating_action_button.dart';
import '../widgets/note_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: CustomFloatingActionButton(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.w),
        child: Column(
          children: [
            SizedBox(
              height: 5.h,
            ),
            CustomAppBar(),
            NoteItem(),
          ],
        ),
      ),
    );
  }
}

