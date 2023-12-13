import '../entities/person.entity.dart';
import '../repositories/person.repository.dart';

final class AddPersonUseCase {
  const AddPersonUseCase(this._personRepository);

  final PersonRepository _personRepository;

  Future<void> call({required Person person}) async {
    // TODO: If the logic is more complex, here is the place
    await _personRepository.addPerson(person: person);
  }
}
