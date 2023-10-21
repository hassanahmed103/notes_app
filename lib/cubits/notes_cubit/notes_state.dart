part of 'notes_cubit.dart';


abstract class NotesState {}

class NotesInitial extends NotesState {}

// region Fetch
class FetchNotesLoading extends NotesState {}

class FetchNotesSuccess extends NotesState{
 final List <NoteModel>notes;

  FetchNotesSuccess(this.notes);
}

class FetchNotesFailure extends NotesState {
 final String errorMessage;

 FetchNotesFailure(this.errorMessage);
}
// endregion

// region Add
class AddNoteLoading extends NotesState {}

class AddNoteSuccess extends NotesState {}

class AddNoteFailure extends NotesState {
 final String errorMessage;

 AddNoteFailure(this.errorMessage);
}
// endregion
// alt + j
// region Delete
class DeleteNoteLoading extends NotesState {}

class DeleteNoteSuccess extends NotesState {}

class DeleteNoteFailure extends NotesState {
 final String errorMessage;

 DeleteNoteFailure(this.errorMessage);
}
// endregion