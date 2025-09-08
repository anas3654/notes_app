import 'package:flutter/material.dart';
import 'package:note_app/views/home_views.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const NoteApp());
}

class NoteApp extends StatelessWidget {
  const NoteApp({super.key});

  @override
  Widget build(BuildContext context) {
  return Sizer(
      builder: (context, orientation, deviceType){
        return MaterialApp(
            title: 'Note Taking App',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              brightness: Brightness.dark
            ),
            home: HomeScreen()
        );
    });

  }
}
