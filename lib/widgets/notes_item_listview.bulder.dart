import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/widgets/item_notes.dart';
import '../cubits/notes_cubit/notes_cubit.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        if (state is FetchNotesSuccess) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: ListView.builder(
              itemCount: state.notes.length,
              /*itemCount: state is NoteSuccess ? state.notes.length:0,*/
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: NotesItem(
                      note: state.notes[index],
                      onTabDelete: () => BlocProvider.of<NotesCubit>(context)
                          .deleteNote(state.notes[index])),
                );
              },
            ),
          );
        }

        return const CircularProgressIndicator();
      },
    );
  }
}
