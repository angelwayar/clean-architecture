import '../entities/person.entity.dart';

abstract class PersonRepository {
  Future<void> addPerson({required Person person});
}
