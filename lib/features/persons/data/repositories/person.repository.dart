import '../../domain/entities/person.entity.dart';
import '../../domain/repositories/person.repository.dart';
import '../datasources/local/db.local.dart';
import '../models/person.model.dart';

class PersonRepositoryImpl implements PersonRepository {
  const PersonRepositoryImpl(this._dbLocalServices);

  final DbLocalServices _dbLocalServices;

  @override
  Future<void> addPerson({required Person person}) async {
    final personModel = PersonModel(
      name: person.name,
      lastname: person.lastname,
      age: person.age,
    );

    await _dbLocalServices.addPerson(personModel: personModel);
  }
}
