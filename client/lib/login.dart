import 'package:flutter/material.dart';

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
void validate(){
  if(formkey.currentState!.validate() && formkey2.currentState!.validate()){
    print('validated');
  }else{
    print('Not Validated');
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



