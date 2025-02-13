import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Logowanie"),
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
                        const SnackBar(content: Text("Logowanie...")),
                      );
                    }
                  }, 
                  child: const Text("Zaloguj się"),),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
