import 'package:dio/dio.dart';
import 'package:notesphere/core/network/api_endpoints.dart';
import '../models/note_model.dart';

abstract class NotesRemoteDataSource {
  Future<List<NoteModel>> getNotes();
}

class NotesRemoteDataSourceImpl implements NotesRemoteDataSource {
  final Dio dio;

  NotesRemoteDataSourceImpl(this.dio);

  @override
  Future<List<NoteModel>> getNotes() async {
    final response = await dio.get(ApiEndpoints.getNotes);
    final List notes = response.data['posts'];

    return notes.map((e) => NoteModel.fromJson(e)).toList();
  }
}
