import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:note_app/models/note_model.dart';
import '../cubits/add_note_cubit/add_note_state.dart';
import '../cubits/get_notes/get_notes_cubit.dart';
import '../widgets/custom_text_note_field.dart';

class NoteDetailsView extends StatefulWidget {
  const NoteDetailsView({super.key});

  @override
  State<NoteDetailsView> createState() => _NoteDetailsViewState();
}

class _NoteDetailsViewState extends State<NoteDetailsView> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    titleController.text = args["note"].title;
    contentController.text = args["note"].content;
    return BlocConsumer<AddNoteCubit, AddNoteState>(
      listener: (context, state) {
        if (state is AddNoteFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMassage),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: BackButton(
              onPressed: args["isFromAddNote"]
                  ? () {
                      NoteModel note = NoteModel(
                          title: titleController.text.isNotEmpty
                              ? titleController.text
                              : "Untitled",
                          content: contentController.text,
                          date: DateTime.now());
                      if (titleController.text.isNotEmpty || contentController.text.isNotEmpty) {
                        BlocProvider.of<AddNoteCubit>(context).addNote(note);
                        Navigator.pop(context);
                      } else {
                        Navigator.pop(context);
                      }
                    }
                  : () {
                      if (titleController.text.isNotEmpty || contentController.text.isNotEmpty) {
                        args["note"].title = titleController.text;
                        args["note"].content = contentController.text;
                        args["note"].date = DateTime.now();
                        args["note"].save();
                        BlocProvider.of<GetNotesCubit>(context).fetchNotes();
                        Navigator.pop(context);
                      } else {
                        args["note"].delete();
                        BlocProvider.of<GetNotesCubit>(context).fetchNotes();
                        Navigator.pop(context);
                      }
                    },
            ),
            title: CustomTextNotsField(
              hintText: 'Title',
              controller: titleController,
              isForTitle: true,
            ),
          ),
          body: CustomTextNotsField(
            hintText: 'Start Typing...',
            controller: contentController,
            isForTitle: false,
          ),
        );
      },
    );
  }
}


