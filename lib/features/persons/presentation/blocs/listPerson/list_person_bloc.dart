import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/person.entity.dart';
import '../../../domain/usecases/list_person.use_case.dart';

part 'list_person_event.dart';
part 'list_person_state.dart';

class ListPersonBloc extends Bloc<ListPersonEvent, ListPersonState> {
  ListPersonBloc(this._listPersonUseCase) : super(ListPersonLoading()) {
    on<GetListPerson>(getListPerson);
  }

  final ListPersonUseCase _listPersonUseCase;

  getListPerson(GetListPerson event, Emitter emit) async {
    try {
      if (state is! ListPersonLoading) {
        emit(ListPersonLoading());
      }
      final persons = await _listPersonUseCase();
      emit(ListPersonSuccess(persons: persons));
    } catch (e) {
      emit(ListPersonFailure(message: 'Ocurrio un Error'));
    }
  }
}
