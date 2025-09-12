import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/get_notes/get_notes_cubit.dart';
import 'package:sizer/sizer.dart';
import '../cubits/add_note_cubit/add_note_cubit.dart';
import '../cubits/add_note_cubit/add_note_state.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_floating_action_button.dart';
import '../widgets/note_item.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});


  @override
  Widget build(BuildContext context) {
    return
        BlocListener<AddNoteCubit, AddNoteState>(
          listener: (context, state) {
            BlocProvider.of<GetNotesCubit>(context).fetchNotes();
          },
      child: Scaffold(
        floatingActionButton: CustomFloatingActionButton(),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.w),
          child: Column(
            children: [
              SizedBox(
                height: 5.h,
              ),
              CustomAppBar(),
              NoteItems(),
            ],
          ),
        ),
      ),
    );
  }
}
