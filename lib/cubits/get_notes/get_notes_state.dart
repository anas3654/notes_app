import '../../models/note_model.dart';

abstract class GetNotesState {}

final class GetNotesInitial extends GetNotesState {}

final class GetNotesSuccess extends GetNotesState {
  final List<NoteModel> notes;
  GetNotesSuccess(this.notes);
}


