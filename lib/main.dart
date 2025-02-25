import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:proudection/firebase_options.dart';
import 'package:proudection/views/start_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const Proudection());
}

class Proudection extends StatelessWidget {
  const Proudection({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Proudection',
      home: StartView(),
    );
  }
}
