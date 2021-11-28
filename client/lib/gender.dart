import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mazi/preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
class GenderScreen extends StatefulWidget {
  const GenderScreen({Key? key}) : super(key: key);

  @override
  _GenderScreenState createState() => _GenderScreenState();
}

class _GenderScreenState extends State<GenderScreen> {
  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      child:
      Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xFF041B2D),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            GenderText(),
            SizedBox(height: 200.0,),
            GenderChoices(),
            SizedBox(height: 200.0,)
          ],
        ),
      ),
      onWillPop: () async {
        return false;
      },
    );
  }
}

class GenderText extends StatelessWidget {
  const GenderText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: BoxConstraints(minWidth: 100, maxWidth: 120),
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(left: 30.0),
        child: Column(
          children: [
            Text(
              'Your Gender',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontFamily: "Chivo-Bold"
              ),
            ),
            SizedBox(height: 10,),
            Text(
              'You can change this later.',
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

Future<void> setGender(BuildContext context, String value) async {
  final Future<SharedPreferences> _pref = SharedPreferences.getInstance();
  final SharedPreferences pref = await _pref;
  Map<String, dynamic> data = {
    'gender': value
  };
  String? token = pref.getString("token");
  var body = json.encode(data);
  var response = await http.put(Uri.parse("http://10.0.2.2:8000/user/gender"),
      headers: {"Content-Type":"application/json","Authorization":"Bearer $token"},
      body: body
  );
  print(token);
  if (response.statusCode == 200) {
    print(response.body);
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) {
            return const InterestScreen();
          }
      ),
    );
  }
  else
    print("errir");
}

class GenderChoices extends StatefulWidget {
  const GenderChoices({Key? key}) : super(key: key);

  @override
  _GenderChoicesState createState() => _GenderChoicesState();
}

class _GenderChoicesState extends State<GenderChoices> {
  int? _value = 0;
  String genderValue = "";
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            width: 220,
            decoration:
            BoxDecoration(
                color: Color(0xFF041B2D),
                border: Border.all(color: Colors.deepPurpleAccent),
                borderRadius: BorderRadius.circular(8.0)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Male",
                  style: TextStyle(
                    fontSize: 17,
                    fontFamily: "Chivo-Light",
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 100,),
                Radio(
                    value: 1,
                    groupValue: _value,
                    activeColor: Color(0xFFFF9CDA),
                    onChanged: (int? value) {
                      setState(() {
                        _value = value;
                        genderValue = "Male";
                      });
                    }
                    ),
              ],
            ),
          ),
          SizedBox(height: 10.0,),
          Container(
            width: 220,
            decoration:
            BoxDecoration(
                color: Color(0xFF041B2D),
                border: Border.all(color: Colors.deepPurpleAccent), 
                borderRadius: BorderRadius.circular(8.0)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Female",
                  style: TextStyle(
                    fontSize: 17,
                    fontFamily: "Chivo-Light",
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 82,),
                Radio(
                    value: 2,
                    groupValue: _value,
                    activeColor: Color(0xFFFF9CDA),
                    onChanged: (int? value) {

                      setState(() {
                        _value = value;
                        genderValue = "Female";
                      });
                    }
                ),
              ],
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
                backgroundColor: const Color(0xFF041B2D),
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 30)
            ),
            onPressed: () {
             if(genderValue == ""){
               return;
             }
             setGender(context, genderValue);
            },
            child: const Text(
              'Next >>',
              style: TextStyle(
                fontFamily: "Chivo-Light",
                color: Colors.white,
                fontSize: 17,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
