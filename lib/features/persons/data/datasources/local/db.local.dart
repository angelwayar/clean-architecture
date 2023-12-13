import '../../models/person.model.dart';

abstract class DbLocalServices {
  const DbLocalServices();

  Future<void> addPerson({required PersonModel personModel});
}

class DbLocalServicesImpl implements DbLocalServices {
  @override
  Future<void> addPerson({required PersonModel personModel}) {
    final personModelJson = personModel.toJson();
    throw UnimplementedError();
  }
}
