import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mazi/home.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child:
      Scaffold(
        backgroundColor: const Color(0xFF041B2D),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              WelcomePic(),
              SizedBox(height: 30),
              WelcomeText(),
              SizedBox(height: 50),
              WelcomeButton()
            ],
          ),
        ),
      ),
      onWillPop: () async {
        return false;
      },
    );
  }
}

class WelcomePic extends StatelessWidget {
  const WelcomePic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/images/emoji.png', width: 180, height: 180,
    );
  }
}

class WelcomeText extends StatelessWidget {
  const WelcomeText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: const BoxConstraints(minWidth: 100, maxWidth: 250),

        child: Column(
          children: const [

             Text(
              'Welcome to Mazi!',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontFamily: "Chivo-Bold"
              ),
            ),
             SizedBox(height: 10,),
             Text(
              'Congrats! Youre officially part of the Mazi. Enjoy and make the most of it!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontFamily: "Chivo-Light",
              ),
            ),
          ],
        )
    );
  }
}

class WelcomeButton extends StatefulWidget {
  const WelcomeButton({Key? key}) : super(key: key);

  @override
  _WelcomeButtonState createState() => _WelcomeButtonState();
}

class _WelcomeButtonState extends State<WelcomeButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minWidth: 100, maxWidth: 250),
      child: TextButton(
        style: TextButton.styleFrom(
            backgroundColor: const Color(0xFF428CD4),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 60)
        ),
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) {
                  return const HomeScreen();
                }
            ),
          );
        }, child: const Text(
          "Start",
          style: TextStyle(
            color: Colors.white,
            fontSize: 17,
            fontFamily: "Chivo-Light",
          ),
       ),
      ),
    );
  }
}
