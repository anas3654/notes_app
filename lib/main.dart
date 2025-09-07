import 'package:flutter/material.dart';

void main() {
  runApp(const NoteApp());
}

class NoteApp extends StatelessWidget {
  const NoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Note Taking App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Note Taking App'),
        ),
        body: Center(
          child: Text('Welcome to the Note Taking App!', style: TextStyle(fontSize: 24)),
        ),
      ),
    );
  }
}
