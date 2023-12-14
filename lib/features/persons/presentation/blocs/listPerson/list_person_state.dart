part of 'list_person_bloc.dart';

@immutable
sealed class ListPersonState {}

final class ListPersonLoading extends ListPersonState {
  ListPersonLoading();
}

final class ListPersonSuccess extends ListPersonState {
  final List<Person> persons;
  ListPersonSuccess({required this.persons});
}

final class ListPersonFailure extends ListPersonState {
  final String message;
  ListPersonFailure({required this.message});
}
