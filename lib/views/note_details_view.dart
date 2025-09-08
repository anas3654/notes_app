import 'package:flutter/material.dart';
import 'package:note_app/model/note_model.dart';
import 'package:sizer/sizer.dart';
import '../widgets/custom_text_note_field.dart';


class NoteDetailsView extends StatelessWidget {
  const NoteDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    NoteModel note = ModalRoute.of(context)!.settings.arguments as NoteModel;
    final TextEditingController titleController =
        TextEditingController(text: note.title);
    final TextEditingController contentController =
        TextEditingController(text: note.content);

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            note.update(title: titleController.text, content: contentController.text, date: DateTime.now());
            Navigator.pop(context);
          },
        ),
        title: TextField(
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
          controller: titleController,
          autofocus: true,
          cursorColor: Colors.white,
          decoration: InputDecoration(
            hintText: note.title.isEmpty ? 'Title' : null,
            border: InputBorder.none,
          ),
        ),
      ),
      body: CustomTextNotsField(
        note: note,
        contentController: contentController,
      ),
    );
  }
}
