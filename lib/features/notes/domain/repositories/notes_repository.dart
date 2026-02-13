import '../entities/note.dart';

abstract class NotesRepository {
  Future<List<Note>> getNotes();
}
