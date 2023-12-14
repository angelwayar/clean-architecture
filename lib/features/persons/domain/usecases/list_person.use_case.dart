import '../entities/person.entity.dart';
import '../repositories/person.repository.dart';

final class ListPersonUseCase {
  const ListPersonUseCase(this._personRepository);

  final PersonRepository _personRepository;

  Future<List<Person>> call() async {
    return await _personRepository.listPerson();
  }
}
