import 'package:bloc/bloc.dart';
part 'easynote_state.dart';


class Notes{
  static List<String>notes=['abc','xyz'];

}

class EasynoteCubit extends Cubit<EasynoteInitial> {
  EasynoteCubit() : super(EasynoteInitial(notes:Notes.notes));


  addNote(String note){
    final noteList=state.notes;
    noteList.add(note);
    emit(EasynoteInitial(notes:noteList));
  }
   removeNote(int index){
    final noteList=state.notes;
    noteList.removeAt(index);
    emit(EasynoteInitial(notes:noteList));
   }
    updateNote(){}

}
