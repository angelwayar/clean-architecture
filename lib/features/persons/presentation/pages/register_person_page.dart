import 'package:flutter/material.dart';

class RegisterPersonPage extends StatelessWidget {
  const RegisterPersonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                decoration: const InputDecoration(label: Text('Name')),
              ),
              const SizedBox(height: 24.0),
              TextFormField(
                decoration: const InputDecoration(label: Text('Lastname')),
              ),
              const SizedBox(height: 24.0),
              TextFormField(
                decoration: const InputDecoration(label: Text('Age')),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  // TODO: Se debe de llamar al bloc para realizar el registro necesario
                },
                child: const Text('Save person'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
