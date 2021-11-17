import 'package:flutter/material.dart';
import 'location.dart';
class VerifiedScreen extends StatelessWidget {
  const VerifiedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFF041B2D),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          VerifiedLogo(),
          SizedBox(height: 50),
          VerifiedText(),
          SizedBox(height: 250),
          StartButton()
        ],
      ),
    );
  }
}

class VerifiedLogo extends StatelessWidget {
  const VerifiedLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minWidth: 100, maxWidth: 280),
      child: Icon(Icons.add_task, size: 150, color: Colors.white,),
    );
  }
}

class VerifiedText extends StatelessWidget {
  const VerifiedText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: BoxConstraints(minWidth: 100, maxWidth: 280),
        child: Column(
          children: [
            Text(
              'Congratulations',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontFamily: "Chivo-Bold"
              ),
            ),
            SizedBox(height: 10,),
            Text(
              'Your mobile number is verified!',
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

class StartButton extends StatelessWidget {
  const StartButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          style: TextButton.styleFrom(
              backgroundColor: const Color(0xFFFF9CDA),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 30)
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) {
                    return const LocationScreen();
                  }
              ),
            );
          },
          child: const Text(
            'Start',
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
