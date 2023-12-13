import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/person.entity.dart';
import '../../../domain/usecases/add_person.use_case.dart';

part 'register_person_event.dart';
part 'register_person_state.dart';

class RegisterPersonBloc
    extends Bloc<RegisterPersonEvent, RegisterPersonState> {
  RegisterPersonBloc(this._addPersonUseCase) : super(RegisterPersonInitial()) {
    on<AddRegisterPerson>(addPerson);
  }

  final AddPersonUseCase _addPersonUseCase;

  Future<void> addPerson(AddRegisterPerson event, Emitter emit) async {
    try {
      emit(RegisterPersonLoading());
      await _addPersonUseCase(person: event.person);
      emit(RegisterPersonSuccess());
    } catch (e) {
      emit(RegisterPersonFailure(message: 'Unexpected error ocurred'));
    }
  }
}
