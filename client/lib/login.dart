import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFF041B2D),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [
            EmailPass(),
            Login(),
          ],
      ),
    );
  }
}
GlobalKey<FormState> formkey = GlobalKey<FormState>();
GlobalKey<FormState> formkey2 = GlobalKey<FormState>();
TextEditingController emailController = TextEditingController();
TextEditingController passController = TextEditingController();
void validate(){
  if(formkey.currentState!.validate() && formkey2.currentState!.validate()){
    print('validated');
  }else{
    print('Not Validated');
  }
}

Future<void> Register(BuildContext context) async {

  void showBanner() => ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Email already exists, please try another one"),
      )
  );

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Register Successful'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('An email verification has been sent to you.'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Ok'),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) {
                        return const LoginScreen();
                      }
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }


  Map<String, dynamic> data = {
    'email': emailController.text,
    'password': passController.text,
  };
  var body = json.encode(data);
  var response = await http.post(Uri.parse("http://10.0.2.2:8000/auth/jwt/login"),
      headers: {"Content-Type":"application/json"},
      body: body
  );
  if (response.statusCode == 201) {
    _showMyDialog();
  }else{
    showBanner();
  }
}

class EmailPass extends StatelessWidget {
  const EmailPass({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Column(
      children:  [
        Container(
          padding: const EdgeInsets.all(40.0),
          width: 100,
          color: Colors.white,
        ),
        const SizedBox(height: 30),
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 40),
          child:Text('Email Address:',
          
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'Chivo-Bold',
            color: Colors.white,
          ),
        ),
        ),
        SizedBox(height: 5),
        Form(
          key: formkey,
          child:Container(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          width: 320,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            border: Border.all(color: const Color(0xFF004E9A))
          ),
          child:TextFormField(
            style: const TextStyle(
              color: Colors.white,
              fontFamily: 'Chivo-Light',
              fontSize: 17
            ),
            decoration: const InputDecoration(
              border: InputBorder.none,

            ),
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            validator: (value) {
              if(value!.isEmpty){
                return "Required";
              }else{
                return null;
              }
            },
          ),
          ),

    ),
            const SizedBox(height: 15),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 40),
            child: Text('Password:',
          textAlign: TextAlign.start,
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'Chivo-Bold',
            color: Colors.white,
          ),
        ),
          ),
        SizedBox(height: 5),
        Form(
        key: formkey2,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          width: 320,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              border: Border.all(color: const Color(0xFF004E9A))
          ),
          child: TextFormField(
            style: const TextStyle(
                color: Colors.white,
                fontFamily: 'Chivo-Light',
                fontSize: 17
            ),
            decoration: const InputDecoration(
              border: InputBorder.none,
            ),
            obscureText: true,
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.done,
              validator: (value1) {
                if (value1!.isEmpty) {
                  return "Required";
                } else {
                  return null;
                }
              }
            ),
           ),
            ),
      ],
    );
  }
}

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 180,),
        TextButton(
          style: TextButton.styleFrom(
              backgroundColor: const Color(0xFFFF9CDA),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 30)
          ),
          onPressed: () {
            validate();
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



