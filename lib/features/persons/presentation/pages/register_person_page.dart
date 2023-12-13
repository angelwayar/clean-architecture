import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection.dart';
import '../../domain/entities/person.entity.dart';
import '../blocs/blocs.dart';

class RegisterPersonPage extends StatelessWidget {
  const RegisterPersonPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controllerName = TextEditingController();
    final controllerLastname = TextEditingController();
    final controllerAge = TextEditingController();

    return BlocProvider<RegisterPersonBloc>(
      create: (context) => Injector.getIt<RegisterPersonBloc>(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Register person'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  controller: controllerName,
                  decoration: const InputDecoration(label: Text('Name')),
                ),
                const SizedBox(height: 24.0),
                TextFormField(
                  controller: controllerLastname,
                  decoration: const InputDecoration(label: Text('Lastname')),
                ),
                const SizedBox(height: 24.0),
                TextFormField(
                  controller: controllerAge,
                  decoration: const InputDecoration(label: Text('Age')),
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
                const Spacer(),
                BlocBuilder<RegisterPersonBloc, RegisterPersonState>(
                  builder: (context, state) {
                    return ElevatedButton(
                      onPressed: state is RegisterPersonLoading
                          ? null
                          : () {
                              final person = Person(
                                name: controllerName.text,
                                lastname: controllerLastname.text,
                                age: int.parse(controllerAge.text),
                              );
                              context
                                  .read<RegisterPersonBloc>()
                                  .add(AddRegisterPerson(person: person));
                            },
                      child: state is RegisterPersonLoading
                          ? const CircularProgressIndicator()
                          : const Text('Save person'),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
