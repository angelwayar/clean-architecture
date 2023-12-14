import 'package:get_it/get_it.dart';

import 'features/persons/data/datasources/local/db.local.dart';
import 'features/persons/data/repositories/person.repository.dart';
import 'features/persons/domain/repositories/person.repository.dart';
import 'features/persons/domain/usecases/add_person.use_case.dart';
import 'features/persons/domain/usecases/list_person.use_case.dart';
import 'features/persons/presentation/blocs/blocs.dart';

class Injector {
  static GetIt? _instance;
  static GetIt get getIt => _instance ??= GetIt.I;

  initInjector() {
    Injector.getIt;

    getIt.registerLazySingleton<DbLocalServices>(
      () => DbLocalServicesImpl(),
    );
    getIt.registerLazySingleton<PersonRepository>(
      () => PersonRepositoryImpl(getIt.get<DbLocalServices>()),
    );
    // Use case Register
    getIt.registerFactory(
      () => AddPersonUseCase(getIt.get<PersonRepository>()),
    );
    // Use case Register
    getIt.registerFactory(
      () => ListPersonUseCase(getIt.get<PersonRepository>()),
    );

    // Register Bloc
    getIt.registerFactory(
      () => RegisterPersonBloc(getIt.get<AddPersonUseCase>()),
    );
    // List Bloc
    getIt.registerFactory(
      () => ListPersonBloc(getIt.get<ListPersonUseCase>()),
    );
  }
}
