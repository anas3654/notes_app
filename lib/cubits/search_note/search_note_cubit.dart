import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/models/note_model.dart';
import 'search_note_state.dart';

class SearchNoteCubit extends Cubit<SearchNoteState> {
  SearchNoteCubit() : super(SearchNoteInitial());

  void searchNotes(String query, List<NoteModel> notes) {
    if (query.isEmpty) {
      emit(SearchNoteEmpty());
      return;
    }
    final filtered = notes
        .where((note) =>
    note.title.toLowerCase().contains(query.toLowerCase()) ||
        note.content.toLowerCase().contains(query.toLowerCase()))
        .toList();

    if (filtered.isEmpty) {
      emit(SearchNoteEmpty());
    } else {
      emit(SearchNoteLoaded(filtered));
    }
  }


}
