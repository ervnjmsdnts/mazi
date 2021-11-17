import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:mazi/otp.dart';
class MobileNumber extends StatelessWidget {
  const MobileNumber({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async{
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('The System Back Button is Deactivated')));
          return false;
        },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFF041B2D),
       body: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           TextNumber(),
           SizedBox(height: 150),
           InputNumber(),
           CreateAccButton(),
         ],
       ),
    ),
    );
  }
}

bool isNext = false;
GlobalKey<FormState> formkey = GlobalKey<FormState>();
void validate(){
  if(formkey.currentState!.validate() ){
    print('validated');
    isNext = true;
  }else{
    print('Not Validated');
  }
}

class TextNumber extends StatelessWidget {
  const TextNumber({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minWidth: 100, maxWidth: 280),
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: 10.0),
      child: Column(
      children: [
        Text(
            'What is your number?',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontFamily: "Chivo-Bold"
          ),
        ),
      SizedBox(height: 10,),
        Text(
          'We protect our users by making sure everyone on Mazi is real.',
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

class InputNumber extends StatelessWidget {
  const InputNumber({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column (
      children: [
        Row(
          children: [
          SizedBox(width: 50,),
          Container(
          width: 80,
          height: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              border: Border.all(color: const Color(0xFF004E9A))
          ),
        child: CountryCodePicker(
          backgroundColor: Color(0xFF041B2D),
        dialogBackgroundColor: Color(0xFF041B2D),
        dialogTextStyle: TextStyle(
          color: Colors.white,
        ),
        textStyle: TextStyle(
          color: Colors.white,
        ),
        initialSelection: 'PH',
        hideSearch: true,
        favorite: ['+63', 'PH'],
      ),
      ),
        SizedBox(width: 10,),
        Form(
          key: formkey,
          child: Container(
          width: 180,
          height: 50,
          padding: EdgeInsets.only(left: 15.0),
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
            keyboardType: TextInputType.phone,
            textInputAction: TextInputAction.done,
              validator: (value) {
                if (value!.isEmpty || value.length < 10) {
                  return "Enter a correct phone number";
                } else {
                  return null;
                }
              }
          ),
        ),
        ),
      ],
    ),
        SizedBox(height: 15),
    Container(
    constraints: BoxConstraints(minWidth: 100, maxWidth: 280),
    alignment: Alignment.centerLeft,
    padding: EdgeInsets.only(left: 10.0),
        child: RichText(
          text: TextSpan(
          text: 'We protect our users by making sure everyone on Mazi is real.',
          style: TextStyle(
            color: Colors.white,
            fontSize: 17,
            fontFamily: "Chivo-Light",
          ),
            children: [
            WidgetSpan(
                child: Icon(Icons.lock,
              color: Colors.white,
                  size: 20,
            ),
                alignment: PlaceholderAlignment.middle
            )
            ]
          ),
          ),
        ),
      ],
    );
  }
}

class CreateAccButton extends StatelessWidget {
  const CreateAccButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 130,),
        TextButton(
          style: TextButton.styleFrom(
              backgroundColor: const Color(0xFFFF9CDA),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 30)
          ),
          onPressed: () {
            if (isNext != true) {
              validate();
            }else {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) {
                      return const OtpScreen();
                    }
                ),
              );
            }
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

