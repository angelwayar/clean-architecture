import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/blocs.dart';
import 'register_person_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Favorite persons'),
        actions: [
          IconButton(
            onPressed: () {
              context.read<ListPersonBloc>().add(GetListPerson());
            },
            icon: const Icon(Icons.refresh),
          )
        ],
      ),
      body: BlocBuilder<ListPersonBloc, ListPersonState>(
        builder: (context, state) {
          if (state is ListPersonSuccess) {
            if (state.persons.isEmpty) {
              return const Center(
                child: Text('No hay datos Guardados'),
              );
            }
            return ListView.builder(
              itemCount: state.persons.length,
              itemBuilder: (context, index) {
                final person = state.persons[index];
                return Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Nombre: ${person.name}'),
                      Text('Apellido: ${person.lastname}'),
                      Text('Edad: ${person.age}'),
                    ],
                  ),
                );
              },
            );
          } else if (state is ListPersonFailure) {
            return Center(
              child: Text(state.message),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: ((context) => const RegisterPersonPage()),
            ),
          );
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
