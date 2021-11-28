import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mazi/location.dart';
import 'models/token.dart';
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


Future<void> Register(BuildContext context) async {
  final SharedPreferences _pref = await SharedPreferences.getInstance();
  void showBanner() => ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Wrong email or password, please try again"),
      )
  );


  Map<String, String> data = {
    'username': emailController.text,
    'password': passController.text,
  };
  var response = await http.post(Uri.parse("http://10.0.2.2:8000/auth/jwt/login"),
      headers: {"Content-Type":"application/x-www-form-urlencoded"},
      body: data
  );
  if (response.statusCode == 200) {
    final Map<String, dynamic> parse = json.decode(response.body);
    Token token = Token.fromJson(parse);
    final SharedPreferences pref = _pref;
    await pref.setString("token", token.accessToken);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) {
            return const LocationScreen();
          }
      ),
    );
  }else{
    showBanner();
    print(data);
    print(response.body);
    print(response.statusCode);
  }
}

class EmailPass extends StatelessWidget {
  const EmailPass({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Column(
      children:  [
        Image.asset('assets/images/unnamed.png', width: 80, height: 80,),
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
            controller: emailController,
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
            controller: passController,
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

void validate(BuildContext context){
  final ProgressDialog pr = ProgressDialog(context, type: ProgressDialogType.Normal);
  if(formkey.currentState!.validate() && formkey2.currentState!.validate()){
    pr.show();
    Future.delayed(Duration(seconds: 3)).then((value){pr.hide();});
    Register(context);
  }else{
    print('Not Validated');
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
            validate(context);
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



