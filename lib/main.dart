import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/const.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/views/home_screen.dart';
import 'observer/add_simpel_bloc_observer.dart';

void main() async {
  // 1 call the box
  await Hive.initFlutter();
  Bloc.observer = simpelBlocObserver();
  //3 save box  then change position
  Hive.registerAdapter(NoteModelAdapter());
  // 2 open box
  await Hive.openBox<NoteModel>(kNotesBox);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit()..fetchAllNotes(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          fontFamily: 'Poppins',
        ),
        home: const HomeScreen(),
      ),
    );
  }
}

// return BlocProvider<NotesCubit>(
//        create: (context) =>  NotesCubit(),
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         theme: ThemeData(
//           brightness: Brightness.dark,
//           fontFamily: 'Poppins',
//         ),
//         home: const HomeScreen(),
//       ),
//     );