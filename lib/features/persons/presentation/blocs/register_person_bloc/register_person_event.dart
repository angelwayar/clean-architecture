part of 'register_person_bloc.dart';

@immutable
sealed class RegisterPersonEvent {}

final class AddRegisterPerson extends RegisterPersonEvent {
  final Person person;
  AddRegisterPerson({required this.person});
}
