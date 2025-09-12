import 'package:note_app/models/note_model.dart';

abstract class SearchNoteState {}

class SearchNoteInitial extends SearchNoteState {}

class SearchNoteEmpty extends SearchNoteState {}

class SearchNoteLoaded extends SearchNoteState {
  final List<NoteModel> notes;
  SearchNoteLoaded(this.notes);
}
