import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/get_notes/get_notes_cubit.dart';
import 'package:note_app/cubits/search_note/search_note_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/widgets/custom_separated_list_view.dart';
import 'package:note_app/widgets/custom_text_note_field.dart';
import 'package:sizer/sizer.dart';

import '../cubits/search_note/search_note_state.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final TextEditingController searchController = TextEditingController();
  List<NoteModel> notes = [];
  List<NoteModel> searchedNotes = [];

  @override
  void initState() {
    notes = BlocProvider.of<GetNotesCubit>(context).fetchNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomTextNotsField(
          controller: searchController,
          isForTitle: true,
          hintText: "Search",
        ),
        actions: [
          IconButton(
            onPressed: () {
              context.read<SearchNoteCubit>().searchNotes(
                    searchController.text,
                    notes,
                  );
            },
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: BlocBuilder<SearchNoteCubit, SearchNoteState>(
        builder: (context, state) {
          if (state is SearchNoteEmpty) {
            return Center(
              child: Text(
                "No Notes Found",
                style:
                    TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w700),
              ),
            );
          } else if (state is SearchNoteLoaded) {
            searchedNotes = state.notes;
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.w),
              child: CustomSeparatedListView(notes: searchedNotes),
            );
          } else {
            return Center(
              child: Text(
                "Search for note",
                style:
                TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w700),
              ),
            );
          }
        },
      ),
    );
  }
}
