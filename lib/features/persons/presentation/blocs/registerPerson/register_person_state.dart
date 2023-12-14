part of 'register_person_bloc.dart';

@immutable
sealed class RegisterPersonState {}

final class RegisterPersonInitial extends RegisterPersonState {}

final class RegisterPersonLoading extends RegisterPersonState {}

final class RegisterPersonSuccess extends RegisterPersonState {}

final class RegisterPersonFailure extends RegisterPersonState {
  final String message;
  RegisterPersonFailure({required this.message});
}
