import 'package:flutter/material.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'add_note_form.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddNotesModelSheet extends StatefulWidget {
  const AddNotesModelSheet({super.key});

  @override
  State<AddNotesModelSheet> createState() => _AddNotesModelSheetState();
}

class _AddNotesModelSheetState extends State<AddNotesModelSheet> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NotesCubit, NotesState>(
      // blocConsumer to make rebuild to screen and to do some condition
      listener: (context, state) {
        /*if (state is AddNoteFailure) {
          print('failed ${state.errorMessage}');
        }
        if (state is AddNoteSuccess) {
          Navigator.pop(context);
        }*/
      },
      builder: (context, state) {
        return AbsorbPointer(
          // to make the screen stace
          absorbing: /*state is AddNoteLoading ? true : */ false,
          child: Padding(
            padding: EdgeInsets.only(
                left: 16,
                right: 16,
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: const SingleChildScrollView(
                physics: BouncingScrollPhysics(), child: AddNoteForm()),
          ),
        );
      },
    );
  }
}
