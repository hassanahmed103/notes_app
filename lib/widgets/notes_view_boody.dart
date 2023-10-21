import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/widgets/notes_item_listview.bulder.dart';
import '../cubits/notes_cubit/notes_cubit.dart';
import 'Custom_app_bar.dart';


class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(height: 50,),
          CustomAppBar(title: 'Notes', icon: Icons.search,),
          // am but expanded on notesListView because colum
          Expanded(
              child: NotesListView()
          ),
        ],
      ),
    );
  }
}
