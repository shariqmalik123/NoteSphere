import 'package:flutter/material.dart';
import '../../domain/entities/note.dart';
import '../../domain/usecases/get_notes.dart';

class NotesViewModel extends ChangeNotifier {
  final GetNotes getNotesUseCase;

  NotesViewModel(this.getNotesUseCase);

  List<Note> _notes = [];
  List<Note> get notes => _notes;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _error;
  String? get error => _error;

  Future<void> fetchNotes() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _notes = await getNotesUseCase();
    } catch (e) {
      _error = e.toString();
    }

    _isLoading = false;
    notifyListeners();
  }
}
