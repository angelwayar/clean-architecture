import 'package:get_it/get_it.dart';

import 'features/persons/data/datasources/local/db.local.dart';
import 'features/persons/data/repositories/person.repository.dart';
import 'features/persons/domain/repositories/person.repository.dart';
import 'features/persons/domain/usecases/add_person.use_case.dart';
import 'features/persons/presentation/blocs/blocs.dart';

class Injector {
  static final GetIt _instance = GetIt.I;

  initInjector() {
    _instance.registerLazySingleton<DbLocalServices>(
      () => DbLocalServicesImpl(),
    );
    _instance.registerLazySingleton<PersonRepository>(
      () => PersonRepositoryImpl(_instance.get<DbLocalServices>()),
    );
    _instance.registerFactory(
      () => AddPersonUseCase(_instance.get<PersonRepository>()),
    );
    _instance.registerFactory(
      () => RegisterPersonBloc(_instance.get<AddPersonUseCase>()),
    );
  }
}
