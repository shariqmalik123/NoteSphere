import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:notesphere/features/notes/data/datasources/notes_remote_datasourse.dart';

import '../network/dio_client.dart';
import '../../features/notes/data/repositories/notes_repository_impl.dart';
import '../../features/notes/domain/repositories/notes_repository.dart';
import '../../features/notes/domain/usecases/get_notes.dart';
import '../../features/notes/presentation/viewmodel/notes_view_model.dart';

final di = GetIt.instance;

Future<void> init() async {
  // Dio
  di.registerLazySingleton<Dio>(() => DioClient().dio);

  // DataSource
  di.registerLazySingleton<NotesRemoteDataSource>(
    () => NotesRemoteDataSourceImpl(di()),
  );

  // Repository
  di.registerLazySingleton<NotesRepository>(
    () => NotesRepositoryImpl(di()),
  );

  // UseCase
  di.registerLazySingleton(() => GetNotes(di()));

  // ViewModel
  di.registerFactory(() => NotesViewModel(di()));
}
