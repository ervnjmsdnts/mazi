import 'package:mazi/login.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:progress_dialog/progress_dialog.dart';
class CreateAccount extends StatelessWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFF041B2D),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [
          Info(),
          Next(),
        ],
      ),
    );
  }
}
bool isRegister = false;
TextEditingController emailController = TextEditingController();
TextEditingController firstnameController = TextEditingController();
TextEditingController lastnameController = TextEditingController();
TextEditingController passController = TextEditingController();
TextEditingController confirmpassController = TextEditingController();
bool isNext = false;
GlobalKey<FormState> formkey = GlobalKey<FormState>();
GlobalKey<FormState> formkey2 = GlobalKey<FormState>();
GlobalKey<FormState> formkey3 = GlobalKey<FormState>();
GlobalKey<FormState> formkey4 = GlobalKey<FormState>();
GlobalKey<FormState> formkey5 = GlobalKey<FormState>();


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
                Navigator.push(
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
    'firstName': firstnameController.text,
    'lastName': lastnameController.text,
    'confirmationPassword': confirmpassController.text,
  };
  var body = json.encode(data);
  var response = await http.post(Uri.parse("http://10.0.2.2:8000/auth/register"),
     headers: {"Content-Type":"application/json"},
      body: body
  );
  if (response.statusCode == 201) {
    _showMyDialog();
  }else{
    showBanner();
  }
}



class Info extends StatelessWidget {
  const Info({Key? key}) : super(key: key);

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
        child: Text('First Name:',
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'Chivo-Light',
            color: Colors.white,
          ),
        ),
        ),
        Form(
          key: formkey,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          width: 320,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              border: Border.all(color: const Color(0xFF004E9A))
          ),
          child: TextFormField(
            controller: firstnameController,
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'Chivo-Light',
                fontSize: 17
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
            ),
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,
            validator: (value) {
              if(value!.isEmpty || !RegExp(r'^[a-z A-Z]+$').hasMatch(value)){
                return "Enter correct name";
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
        child: Text('Last Name:',
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'Chivo-Light',
            color: Colors.white,
          ),
        ),
        ),
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
            controller: lastnameController,
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'Chivo-Light',
                fontSize: 17
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
            ),
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,
            validator: (value) {
              if(value!.isEmpty || !RegExp(r'^[a-z A-Z]+$').hasMatch(value)){
                return "Enter correct name";
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
        child: Text('Email Address:',
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'Chivo-Light',
            color: Colors.white,
          ),
        ),
        ),
        Form(
         key: formkey3,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          width: 320,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              border: Border.all(color: const Color(0xFF004E9A))
          ),
          child: TextFormField(
            controller: emailController,
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'Chivo-Light',
                fontSize: 17
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
            ),
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            validator: (value) {
              if(value!.isEmpty || !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}').hasMatch(value)){
                return "Enter correct email";
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
            fontFamily: 'Chivo-Light',
            color: Colors.white,
          ),
        ),
        ),
        Form(
          key: formkey4,
        child:Container(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          width: 320,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              border: Border.all(color: const Color(0xFF004E9A))
          ),
          child: TextFormField(
            controller: passController,
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'Chivo-Light',
                fontSize: 17
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
            ),
            obscureText: true,
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,
            validator: (value) {
              if(value!.isEmpty || value.length < 7){
                return "Password must be longer than 6";
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
        child: Text('Confirm Password:',
          textAlign: TextAlign.start,
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'Chivo-Light',
            color: Colors.white,
          ),
        ),
        ),
        Form(
          key: formkey5,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          width: 320,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              border: Border.all(color: const Color(0xFF004E9A))
          ),
          child: TextFormField(
            controller: confirmpassController,
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'Chivo-Light',
                fontSize: 17
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
            ),
            obscureText: true,
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.done,
            validator: (value) {
              if(value!.isEmpty){
                return "Required";
              }
              if(passController.text != confirmpassController.text){
                return "Passwords do not match";
              }else{
                return null;
              }
            },
          ),
        ),
        ),
      ],
    );
  }
}

void validateCreate(BuildContext context){
  final ProgressDialog pr = ProgressDialog(context, type: ProgressDialogType.Normal);
  if(formkey.currentState!.validate()&&
      formkey2.currentState!.validate()&&
      formkey3.currentState!.validate()&&
      formkey4.currentState!.validate()&&
      formkey5.currentState!.validate()){
    pr.show();
    Future.delayed(Duration(seconds: 3)).then((value){pr.hide();});
    Register(context);
  }
}

class Next extends StatelessWidget {
  const Next({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 35),
        TextButton(
          style: TextButton.styleFrom(
              backgroundColor: const Color(0xFFFF9CDA),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 12)
          ),
          onPressed: () {
                validateCreate(context);
              },
          child: RichText(

              text: const TextSpan(text: 'Next ',
                  style: TextStyle(
                    fontFamily: "Chivo-Light",
                    color: Colors.white,
                    fontSize: 17,
              ),
                children: [
                  WidgetSpan(child: Icon(Icons.arrow_forward_ios_rounded, color: Colors.white,size: 18,))
                ]
            ),
          ),
        )
      ],
    );
  }
}




