
import 'package:flutter/material.dart';
import 'verified.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFF041B2D),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          OtpText(),
          SizedBox(height: 140),
          OtpNumber(),
          SizedBox(height: 140),
          VerifyButton(),
        ],
      ),
    );
  }
}

class OtpText extends StatelessWidget {
  const OtpText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minWidth: 100, maxWidth: 280),
        child: Column(
          children: [
            Text(
              'OTP Verification',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontFamily: "Chivo-Bold"
              ),
            ),
            SizedBox(height: 10,),
            Text(
              'OTP is sent to your mobile number',
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

class VerifyButton extends StatelessWidget {
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
          //    if (isNext != true) {
          //    validate();
         //   }else {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) {
                      return const VerifiedScreen();
                    }
                ),
              );
        //    }
          },
          child: const Text(
            'Verify',
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

class OtpNumber extends StatefulWidget {
  @override
  _OtpNumberState createState() => _OtpNumberState();
}

class _OtpNumberState extends State<OtpNumber> {
  late FocusNode pin2focusNode2;
  late FocusNode pin2focusNode3;
  late FocusNode pin2focusNode4;
  void initState() {
    super.initState();
    pin2focusNode2 = FocusNode();
    pin2focusNode3 = FocusNode();
    pin2focusNode4 = FocusNode();
  }

  void dispose() {
    pin2focusNode2.dispose();
    pin2focusNode3.dispose();
    pin2focusNode4.dispose();
    super.dispose();
  }

  void nextField({ required String value, FocusNode? focusNode}) {
    if (value.length == 1) {
      focusNode?.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minWidth: 100, maxWidth: 280),
      child: Column(
        children: [
          Form(child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 60,
                height: 60,
                child: TextFormField(
                  autofocus: true,
                  obscureText: true,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    nextField(value: value, focusNode: pin2focusNode2);
                  },
                  style: TextStyle(fontSize: 34,color: Colors.white),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(color: Color(0xFF004E9A))
                      )
                  ),
                ),
              ),
              SizedBox(
                width: 60,
                height: 60,
                child: TextFormField(
                  focusNode: pin2focusNode2,
                  autofocus: true,
                  obscureText: true,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    nextField(value: value, focusNode: pin2focusNode3);
                  },
                  style: TextStyle(fontSize: 34,color: Colors.white),
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(color: Color(0xFF004E9A))
                      )
                  ),
                ),
              ),
              SizedBox(
                width: 60,
                height: 60,
                child: TextFormField(
                  focusNode: pin2focusNode3,
                  autofocus: true,
                  obscureText: true,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    nextField(value: value, focusNode: pin2focusNode4);
                  },
                  style: TextStyle(fontSize: 34,color: Colors.white),
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(color: Color(0xFF004E9A))
                      )
                  ),
                ),
              ),
              SizedBox(
                width: 60,
                height: 60,
                child: TextFormField(
                  focusNode: pin2focusNode4,
                  autofocus: true,
                  obscureText: true,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    pin2focusNode4.unfocus();
                  },
                  style: TextStyle(fontSize: 34,color: Colors.white),
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(color: Color(0xFF004E9A))
                      )
                  ),
                ),
              ),
            ],
          )
          ),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('OTP autoresend in ',
              style: TextStyle(
                  color: Colors.white,
                fontSize: 17,
                fontFamily: "Chivo-light",
                ),
              ),
              TweenAnimationBuilder(
                tween: Tween(begin: 40.0, end: 0),
                duration: Duration(seconds: 40),
                builder: (BuildContext context, num value, child) =>
                    Text(
                      "00:${value.toInt()}",
                      style: TextStyle(
                        color: Color(0xFFFF9CDA),
                        fontFamily: "Chivo-Light",
                        fontSize: 17
                      ),
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}