import 'package:dio/dio.dart';
import '../models/note_model.dart';

abstract class NotesRemoteDataSource {
  Future<List<NoteModel>> getNotes();
}

class NotesRemoteDataSourceImpl implements NotesRemoteDataSource {
  final Dio dio;

  NotesRemoteDataSourceImpl(this.dio);

  @override
  Future<List<NoteModel>> getNotes() async {
    final response = await dio.get('/posts');

    return (response.data as List)
        .map((json) => NoteModel.fromJson(json))
        .toList();
  }
}
