import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:note_app/models/note_model.dart';
import 'add_note_state.dart';


class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());

  void addNote(NoteModel note)async{
    try{
      emit(AddNoteLoading());
      await Hive.box<NoteModel>("Notes").add(note);
      emit(AddNoteSuccess());
    }catch(e){
      emit(AddNoteFailure(e.toString()));
    }
  }

}
