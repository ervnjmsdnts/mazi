import 'package:flutter/material.dart';
import 'login.dart';
import 'create_acc.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Exploration',
      theme: ThemeData(primarySwatch: Colors.pink),
      home: const Signing(),
    );
  }
}

class Signing extends StatelessWidget{
  const Signing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF041B2D),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [
          Welcoming(),
          LoginButton(),
          CreateAccountButton(),
        ],
      ),
    );
  }
}

class Welcoming extends StatelessWidget{
  const Welcoming({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 14,),
        const Text('Welcome',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontFamily: 'Chivo-Bold'
          ),
        ),
        const Text('to',
          style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontFamily: 'Chivo-Bold'
          ),
        ),
        const SizedBox(height: 14,),
        Container(
          padding: const EdgeInsets.all(40.0),
          width: 100,
          color: Colors.white,
        ),
        const SizedBox(height: 14,),
        const Text('The Future of',
          style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontFamily: 'Chivo-Bold'
          ),
        ),
        const Text('Dating',
          style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontFamily: 'Chivo-Bold'
          ),
        ),
      ],
    );
  }
}

class LoginButton extends StatelessWidget{
  const LoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          const SizedBox(height: 200,),
          TextButton(
              style: TextButton.styleFrom(
                backgroundColor: const Color(0xFF428CD4),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 120)
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) {
                          return const LoginScreen();
                        }
                  ),
                );
              },
              child: const Text(
                'Log In',
                style: TextStyle(
                  fontFamily: "Chivo-Light",
                  color: Colors.white,
                  fontSize: 17,
                ),
              ),
          )
        ],
    );
  }
}

class CreateAccountButton extends StatelessWidget{
  const CreateAccountButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          const SizedBox(height: 14,),
          TextButton(
            style: TextButton.styleFrom(
                backgroundColor: const Color(0xFF9D91D6),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 82)
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) {
                      return const CreateAccount();
                    }
                ),
              );
            },
            child: const Text(
              'Create Account',
              style: TextStyle(
                fontFamily: "Chivo-Light",
                color: Colors.white,
                fontSize: 17,
              ),
            ),
          )
        ],
    );
  }
}