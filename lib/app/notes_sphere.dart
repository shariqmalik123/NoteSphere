import 'package:flutter/material.dart';
import 'package:notesphere/core/di/injection_container.dart';
import 'package:notesphere/features/notes/presentation/view/screens/notes_screen.dart';
import 'package:notesphere/features/notes/presentation/viewmodel/notes_view_model.dart';
import 'package:provider/provider.dart';

class NoteSphere extends StatelessWidget {
  const NoteSphere({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => di<NotesViewModel>())],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'NoteSphere',
        home: NoteScreen(),
      ),
    );
  }
}
