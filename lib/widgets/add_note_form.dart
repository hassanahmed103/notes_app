import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';

import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/Custom_text_filed.dart';
import 'package:notes_app/widgets/color_list/Item_color.dart';
import 'package:notes_app/widgets/custom_butoom.dart';
import 'package:intl/intl.dart';

import '../helper/show_snak_bar.dart';
import 'color_list/item_color_list_view.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subtitle;
  int color = Colors.amber.value;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          const SizedBox(height: 25),
          CustomTextFiled(
            onSaved: (value) {
              title = value;
            },
            hitText: 'title',
            maxLine: 2,
          ),
          const SizedBox(height: 25),
          CustomTextFiled(
            onSaved: (value) {
              subtitle = value;
            },
            hitText: 'desecration',
            maxLine: 5,
          ),
          const SizedBox(height: 30),
          ItemColorListView(
            onSelect: (value) {
              color = value;
            },
          ),
          const SizedBox(height: 30),
          BlocBuilder<NotesCubit, NotesState>(
            // am make BlocBuilder to listen on is loading
            builder: (context, state) {
              return CustomButtom(
                  isLoading:
                      state is AddNoteLoading || state is FetchNotesLoading,
                  onTap: () async {
                    final currentNow = DateTime.now();
                    final formatCurrentNow =
                        DateFormat('dd / MM /yyyy').format(currentNow);
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      var note = NoteModel(
                          title: title!,
                          subtitle: subtitle!,
                          date: formatCurrentNow,
                          color: color);
                      if (await BlocProvider.of<NotesCubit>(context)
                          .addNote(note)) {
                        if(mounted) {
                          showSnackBar(context, 'Success');
                          Navigator.pop(context);
                        }
                      }
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  },
                  text: 'add');
            },
          ),
          const SizedBox(height: 25),
        ],
      ),
    );
  }
}
