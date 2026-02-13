import 'package:flutter/material.dart';
import 'package:notesphere/core/di/injection_container.dart';
import 'app/notes_sphere.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const NoteSphere());
}