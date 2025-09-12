import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import '../cubits/get_notes/get_notes_cubit.dart';
import '../cubits/get_notes/get_notes_state.dart';
import '../models/note_model.dart';
import 'custom_separated_list_view.dart';

class NoteItems extends StatefulWidget {
  const NoteItems({super.key});

  @override
  State<NoteItems> createState() => _NoteItemsState();
}

class _NoteItemsState extends State<NoteItems> {
  List<NoteModel> notes = [];

  @override
  void initState() {
    super.initState();
    notes = BlocProvider.of<GetNotesCubit>(context).fetchNotes();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetNotesCubit, GetNotesState>(
    builder: (context, state) {
      if (state is GetNotesSuccess) {
        notes = state.notes;
      } else {
        notes = [];
      }
      return notes.isEmpty
          ? Column(
              children: [
                SizedBox(
                  height: 20.h,
                ),
                Icon(
                  Icons.note_add_outlined,
                  size: 40.sp,
                ),
                Text(
                  'No Notes Yet',
                  style:
                      TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w700),
                ),
              ],
            )
          : Expanded(
              child: CustomSeparatedListView(notes: notes),
            );
    });
  }
}

