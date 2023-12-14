part of 'list_person_bloc.dart';

@immutable
sealed class ListPersonEvent {}

final class GetListPerson extends ListPersonEvent {}
