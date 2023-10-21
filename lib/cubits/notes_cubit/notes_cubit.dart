

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:notes_app/const.dart';
import '../../helper/show_snak_bar.dart';
import '../../models/note_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());
  List<NoteModel> notes = [];



  Future<bool> addNote(NoteModel note) async {
    // Color? color=const Color(0xff982176);
    emit(AddNoteLoading());
    // note.color = color!.value;
    try {
      final notesBox = Hive.box<NoteModel>(kNotesBox);
      await notesBox.add(note);
      emit(AddNoteSuccess());
      fetchAllNotes();
      return true;
    } catch (e) {
      AddNoteFailure(e.toString()); // TODO
      return false;
    }
  }

  void fetchAllNotes() {
    emit(FetchNotesLoading());
    final notesBox = Hive.box<NoteModel>(kNotesBox);
    notes = notesBox.values.toList();
    emit(FetchNotesSuccess(notes));
  }

  Future<void> deleteNote(NoteModel note) async {
    emit(DeleteNoteLoading());
    try {
      // final notesBox = Hive.box<NoteModel>(kNotesBox);
      // notesBox.clear(); // delete all
      await note.delete();
      emit(DeleteNoteSuccess());
      fetchAllNotes();
    } catch (e) {
      DeleteNoteFailure(e.toString()); // TODO
    }
  }
}
