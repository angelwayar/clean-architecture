import 'dart:developer';

import '../../models/person.model.dart';

final persons = <Map<String, dynamic>>[];

abstract class DbLocalServices {
  const DbLocalServices();

  Future<void> addPerson({required PersonModel personModel});
}

class DbLocalServicesImpl implements DbLocalServices {
  @override
  Future<void> addPerson({required PersonModel personModel}) async {
    final personModelJson = personModel.toJson();

    await Future.delayed(const Duration(seconds: 1));

    persons.add(personModelJson);

    persons.forEach((element) => log(element.toString()));
  }
}
