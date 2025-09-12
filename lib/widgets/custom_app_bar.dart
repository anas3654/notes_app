import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/get_notes/get_notes_state.dart';
import 'package:note_app/models/note_model.dart';
import 'package:sizer/sizer.dart';
import '../cubits/get_notes/get_notes_cubit.dart';
import 'custom_search_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetNotesCubit, GetNotesState>(
      builder: (context, state) {
        List<NoteModel> notes = [];
        if (state is GetNotesSuccess) {
          notes = state.notes;
        }else{
          notes = [];
        }
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Notes',
              style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
            ),
            CustomSearchIcon(notes: notes,),
          ],
        );
      },
    );
  }
}


