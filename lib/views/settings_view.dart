import 'dart:io' show Platform;
import 'package:flutter/material.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  bool _darkMode = false;
  String _selectedLanguage = 'Polish';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ustawienia"),
        automaticallyImplyLeading: false,
        elevation: 4.0,
      ),
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Ogólne",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SwitchListTile(
            title: const Text("Tryb ciemny"),
            subtitle: const Text("Włącz lub wyłącz tryb ciemny."),
            value: _darkMode, 
            onChanged: (value) {
              setState(() {
                _darkMode = value;
              });
            },),
          ListTile(
            title: const Text("Język"),
            subtitle: DropdownButton<String>(
              value: _selectedLanguage,
              items: ["Polish", "English"]
                  .map((lang) => DropdownMenuItem(
                        value: lang,
                        child: Text(lang),
                      ),)
                  .toList(),
              onChanged: (newValue) {
                setState(() {
                  _selectedLanguage = newValue!;
                });
              },
            ),
          ),
          ListTile(
            title: const Text("Prywatność"),
            trailing: Platform.isAndroid ? const Icon(Icons.arrow_forward) : const Icon(Icons.arrow_forward_ios),
            leading: const Icon(Icons.security),
          ),
          ListTile(
            title: const Text("O nas"),
            trailing: Platform.isAndroid ? const Icon(Icons.arrow_forward) : const Icon(Icons.arrow_forward_ios),
            leading: const Icon(Icons.info),
          ),
          const ListTile(
            title: Text("Wyloguj się"),
            leading: Icon(Icons.logout),
          ),
        ],
      ),
    );
  }
}
