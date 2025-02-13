import 'package:flutter/material.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
   final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rejestracja"),
        elevation: 4.0,
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.all(10.0),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Adres E-mail',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Wprowadź adres E-mail";
                      }
                      else if (!value.contains(RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$'))) {
                        return "Nieprawidłowy email";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Nazwa użytkownika',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Wprowadź nazwę użytkownika";
                      }
                      else if (value.length < 6) {
                        return "Nazwa użytkownika powinna zawierać minimum sześć znaków";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Hasło',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Wprowadź hasło";
                      }
                      else if (value.length < 8) {
                        return "Hasło powinno zawierać minimum osiem znaków";
                      }
                      else if (!value.contains(RegExp(r'[A-Z]'))) {
                        return "Hasło powinno zawierać minimum jedną wielką literę";
                      }
                      else if (!value.contains(RegExp(r'[a-z]'))) {
                        return "Hasło powinno zawierać minimum jedną wielką literę";
                      }
                      else if (!value.contains(RegExp(r'[0-9]'))) {
                        return "Hasło powinno zawierać minimum jedną cyfrę";
                      }
                      else if (!value.contains(RegExp(r'[!@#\$&*~]'))) {
                        return "Hasło powinno zawierać minimum jeden znak specjalny";
                      } 
                      return null;
                    },
                    obscureText: true,
                  ),
                  ElevatedButton(onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Rejestrowanie...")),
                      );
                    }
                  }, 
                  child: const Text("Zarejestruj się"),),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
