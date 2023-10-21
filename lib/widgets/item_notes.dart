import 'package:flutter/material.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/update_screen.dart';

class NotesItem extends StatelessWidget {
  const   NotesItem({super.key,required this.note, required this.onTabDelete});
  final VoidCallback onTabDelete;
final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder:(context){
          return  EditNoteView(note:note ,);
        }));
      },
      child: Container(
        padding: const EdgeInsets.only(top: 24, bottom: 24, left: 16),
        decoration: BoxDecoration(
          color: Color(note.color),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title:  Text(
                note.title,
                style:const TextStyle(color: Colors.black, fontSize: 18),
              ),
              subtitle: Padding(
                padding:const EdgeInsets.only(top: 25, bottom: 25),
                child: Text(
                  note.subtitle,
                  style: TextStyle(
                      color: Colors.black.withOpacity(.4), fontSize: 15),
                ),
              ),
              trailing: IconButton(
                onPressed: onTabDelete,
                icon: const Icon(
                  Icons.delete,
                  color: Colors.black,
                  size: 30,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 29),
              child: Text(note.date,
                  style: TextStyle(color: Colors.black.withOpacity(.4))),
            ),
          ],
        ),
      ),
    );
  }
}
