import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/color_list/color_update_screen.dart';
import '../Custom_app_bar.dart';
import '../Custom_text_filed.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, required this.note});

  final NoteModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  @override
  String? title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // todo: mediaquery.viewinsters
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
        onPressed: () {
          widget.note.title = title ?? widget.note.title;
          widget.note.subtitle = subTitle ?? widget.note.subtitle;
          widget.note.save();
          BlocProvider.of<NotesCubit>(context).fetchAllNotes();
          Navigator.pop(context);
        },
        title: 'Edit Notes',
        icon: Icons.check,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            CustomTextFiled(
                onChanged: (value) {
                  title = value;
                },
                hitText: widget.note.title),
            const SizedBox(
              height: 20,
            ),
            CustomTextFiled(
              onChanged: (value) {
                subTitle = value;
              },
              hitText: widget.note.title,
              maxLine: 5,
            ),
            ItemColorUpdate(
              note: widget.note,
              onSelect: (int value) {},
            ),
          ],
        ),
      ),
    );
  }
}
