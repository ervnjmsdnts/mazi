import 'package:flutter/material.dart';
import 'number.dart';
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

TextEditingController pass = TextEditingController();
TextEditingController confirmpass = TextEditingController();
bool isNext = false;
GlobalKey<FormState> formkey = GlobalKey<FormState>();
GlobalKey<FormState> formkey2 = GlobalKey<FormState>();
GlobalKey<FormState> formkey3 = GlobalKey<FormState>();
GlobalKey<FormState> formkey4 = GlobalKey<FormState>();
GlobalKey<FormState> formkey5 = GlobalKey<FormState>();
void validate(){
  if(formkey.currentState!.validate() && formkey2.currentState!.validate()
      && formkey3.currentState!.validate() && formkey4.currentState!.validate()
      && formkey5.currentState!.validate()){
    print('validated');
    isNext = true;
  }else{
    print('Not Validated');
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
            controller: pass,
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
            controller: confirmpass,
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
              if(pass.text != confirmpass.text){
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
            if (isNext != true) {
              validate();
            }else {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) {
                      return const MobileNumber();
                    }
                ),
              );
            }
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


