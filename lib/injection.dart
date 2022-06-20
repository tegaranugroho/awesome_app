import 'package:awesome_app/controllers/list_image/list_image_bloc.dart';
import 'package:awesome_app/repositories/repository.dart';
import 'package:awesome_app/repositories/repository_impl.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final locator = GetIt.instance;

void init() {
  // bloc
  locator.registerFactory(() => ListImageBloc(locator()));
  // repository
  locator.registerLazySingleton<Repository>(
      () => RepositoryImpl(client: locator()));

  // external
  locator.registerLazySingleton(() => http.Client());
}
