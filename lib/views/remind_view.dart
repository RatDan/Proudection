import 'package:flutter/material.dart';

class RemindView extends StatefulWidget {
  const RemindView({super.key});

  @override
  State<RemindView> createState() => _RemindViewState();
}

class _RemindViewState extends State<RemindView> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Przypomnij hasło"),
        elevation: 4.0,
        backgroundColor: Colors.yellowAccent,
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
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: ElevatedButton(onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Resetowanie hasła...")),
                          );
                        }
                      }, 
                      child: const Text("Wyślij link do resetowania hasła"),),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
