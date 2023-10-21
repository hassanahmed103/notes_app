import 'package:flutter/material.dart';
import 'package:notes_app/widgets/add_notes_bottom_shet.dart';
import 'package:notes_app/widgets/notes_view_boody.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showModalBottomSheet(
            isScrollControlled: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            context: context , builder:(context){
            return const AddNotesModelSheet();
          },);
        },
        child: const Icon(Icons.add),
      ),
      body: const NotesViewBody(),
    );
  }
}
// {
//           showModalBottomSheet(
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(20),
//               ),
//               context: context,
//               builder: (context) {
//                 return const AddNotesModelSheet();
//               });
//         },
