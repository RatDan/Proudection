import 'package:flutter/material.dart';
import 'package:proudection/view/login_view.dart';
import 'package:proudection/view/register_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [Colors.orange, Colors.lime]),
        ),
        child: Column(
          children: [
            Flexible(
              flex: 2,
              child: Container(
                alignment: Alignment.topCenter,
                padding: const EdgeInsets.only(top: 100.0),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    style: TextStyle(
                      fontSize: 20, 
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: "Proud",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple,
                        ),
                      ),
                      TextSpan(
                        text: "ection",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.indigo,
                        ),
                      ),
                      TextSpan(
                        text: " - be ",
                      ),
                      TextSpan(
                        text: "Proud",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple,
                        ),
                      ),
                      TextSpan(
                        text: " of your ",
                      ),
                      TextSpan(
                        text: "Collection",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.indigo,
                        ),
                      ),
                      TextSpan(
                        text: "!",
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Flexible(
              child: Icon(
                Icons.auto_stories,
                size: 170.0,
              ),
            ),
            Flexible(
              flex: 2,
              child: Container(
                alignment: Alignment.center,
                child: const Text(
                  "Aplikacja do zapisywania swoich kolekcji!",
                  style: TextStyle(
                    fontSize: 17.0,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.95,
              child: TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.black,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  side: BorderSide(
                    color: Colors.deepPurple,
                    width: 5,
                  ),
                ),
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const LoginView()),
                );
              },
              child: const Text('Zaloguj się'),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.95,
                child: TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.black,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    side: BorderSide(
                      color: Colors.indigo,
                      width: 5,
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const RegisterView()),
                  );
                },
                child: const Text('Zarejestruj się'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
