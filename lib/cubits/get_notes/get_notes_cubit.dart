import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:note_app/models/note_model.dart';
import 'get_notes_state.dart';



class GetNotesCubit extends Cubit<GetNotesState> {
  GetNotesCubit() : super(GetNotesInitial());
  List<NoteModel> notes = [];

  List<NoteModel> fetchNotes(){
      notes = Hive.box<NoteModel>("Notes").values.toList();
      emit(GetNotesSuccess(notes));
    return notes;
  }

}
