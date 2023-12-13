import '../../domain/entities/person.entity.dart';

class PersonModel extends Person {
  PersonModel({
    required super.name,
    required super.lastname,
    required super.age,
  });

  factory PersonModel.fromJson(Map<String, dynamic> json) => PersonModel(
        name: json['name'],
        lastname: json['lastname'],
        age: json['age'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'lastname': lastname,
        'age': age,
      };
}
