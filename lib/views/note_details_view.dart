import 'package:flutter/material.dart';
import 'package:note_app/model/note_model.dart';
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
            if (titleController.text.isNotEmpty || contentController.text.isNotEmpty) {
              if(note.isNew){
                notes.add(NoteModel(title: titleController.text, content: contentController.text, date: DateTime.now(), isNew: false));
              }
              else{
                note.update(title: titleController.text, content: contentController.text, date: DateTime.now());
              }
              Navigator.pop(context, note);
            } else {
              Navigator.pop(context);
            }
          },
        ),
        title: CustomTextNotsField(controller: titleController, note: note, isForTitle: true,),
        // title: TextField(
        //   style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
        //   controller: titleController,
        //   autofocus: true,
        //   cursorColor: Colors.white,
        //   decoration: InputDecoration(
        //     hintText: note.title.isEmpty ? 'Title' : null,
        //     border: InputBorder.none,
        //   ),
        // ),
      ),
      body: CustomTextNotsField(
        note: note,
        controller: contentController,
        isForTitle: false,
      ),
    );
  }
}
