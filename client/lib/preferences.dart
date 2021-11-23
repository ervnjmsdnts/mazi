import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
class InterestScreen extends StatefulWidget {
  const InterestScreen({Key? key}) : super(key: key);

  @override
  _InterestScreenState createState() => _InterestScreenState();
}

class _InterestScreenState extends State<InterestScreen> {
  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      child:
      Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xFF041B2D),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 120),
              InterestText1(),
              SizedBox(height: 20),
              Creativity(),
              SizedBox(height: 20),
              Sports(),
              SizedBox(height: 20),
              Goingout(),
              SizedBox(height: 20),
              Stayingin(),
              SizedBox(height: 20),
              FilmTv(),
              SizedBox(height: 50),
              NextInterest(),
              SizedBox(height: 20),
            ],
          ),
        )
      ),
      onWillPop: () async {
        return false;
      },
    );
  }
}

class InterestText1 extends StatelessWidget {
  const InterestText1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: BoxConstraints(minWidth: 100, maxWidth: 250),
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.only(right: 120.0),
        padding: EdgeInsets.only(left: 30.0),

        child: Column(
          children: [
 
            Text(
              'Your interests',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontFamily: "Chivo-Bold"
              ),
            ),
            SizedBox(height: 10,),
            Text(
              'Pick atleast 10 things you love, you can change this later.',
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

final List<String> dataCreativity = <String>[];


class Creativity extends StatefulWidget {
  const Creativity({Key? key}) : super(key: key);

  @override
  _CreativityState createState() => _CreativityState();
}

class _CreativityState extends State<Creativity> {

  bool _hasbeenPressed = false;
  bool _hasbeenPressed2 = false;
  bool _hasbeenPressed3 = false;
  bool _hasbeenPressed4 = false;
  bool _hasbeenPressed5 = false;
  bool _hasbeenPressed6 = false;
  bool _hasbeenPressed7 = false;
  bool _hasbeenPressed8 = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minWidth: 100, maxWidth: 450),
      alignment: Alignment.centerLeft,
      child: Column(
        children: [
          Container(
            constraints: BoxConstraints(minWidth: 100, maxWidth: 250),
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(right: 100.0),
            child: Text(
              'Creativity',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: "Chivo-Bold"
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  onPressed: (){
                    setState(() {
                      _hasbeenPressed = !_hasbeenPressed;
                    });
                    if(_hasbeenPressed)
                    {
                      dataCreativity.add("Arts");
                    }
                    else {
                      dataCreativity.remove("Arts");
                    }
                  },
                  child: Text(
                      "Art",
                    style: TextStyle(
                    fontFamily: "Chivo-Light",
                    color: Colors.white,
                    fontSize: 17,
                  ),
                  ),
                style: ElevatedButton.styleFrom(
                  side: BorderSide(color: Colors.deepPurpleAccent),
                  primary: _hasbeenPressed ? Color(0xFFFF9CDA) : Color(0xFF041B2D),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10)
                ),
              ),
              ElevatedButton(
                onPressed: (){
                  setState(() {
                    _hasbeenPressed2 = !_hasbeenPressed2;
                  });
                  if(_hasbeenPressed2)
                  {
                    dataCreativity.add("Crafts");
                  }
                  else {
                    dataCreativity.remove("Crafts");
                  }
                },
                child: Text(
                  "Crafts",
                  style: TextStyle(
                    fontFamily: "Chivo-Light",
                    color: Colors.white,
                    fontSize: 17,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    side: BorderSide(color: Colors.deepPurpleAccent),
                    primary: _hasbeenPressed2 ? Color(0xFFFF9CDA) : Color(0xFF041B2D),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10)
                ),
              ),
              ElevatedButton(
                onPressed: (){
                  setState(() {
                    _hasbeenPressed3 = !_hasbeenPressed3;
                  });
                  if(_hasbeenPressed3)
                  {
                    dataCreativity.add("Dancing");
                  }
                  else {
                    dataCreativity.remove("Dancing");
                  }
                },
                child: Text(
                  "Dancing",
                  style: TextStyle(
                    fontFamily: "Chivo-Light",
                    color: Colors.white,
                    fontSize: 17,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    side: BorderSide(color: Colors.deepPurpleAccent),
                    primary: _hasbeenPressed3 ? Color(0xFFFF9CDA) : Color(0xFF041B2D),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10)
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: (){
                  setState(() {
                    _hasbeenPressed4 = !_hasbeenPressed4;
                  });
                  if(_hasbeenPressed4)
                  {
                    dataCreativity.add("Design");
                  }
                  else {
                    dataCreativity.remove("Design");
                  }
                },
                child: Text(
                  "Design",
                  style: TextStyle(
                    fontFamily: "Chivo-Light",
                    color: Colors.white,
                    fontSize: 17,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    side: BorderSide(color: Colors.deepPurpleAccent),
                    primary: _hasbeenPressed4 ? Color(0xFFFF9CDA) : Color(0xFF041B2D),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10)
                ),
              ),
              ElevatedButton(
                onPressed: (){
                  setState(() {
                    _hasbeenPressed5 = !_hasbeenPressed5;
                  });
                  if(_hasbeenPressed5)
                  {
                    dataCreativity.add("Editing");
                  }
                  else {
                    dataCreativity.remove("Editing");
                  }
                },
                child: Text(
                  "Editing",
                  style: TextStyle(
                    fontFamily: "Chivo-Light",
                    color: Colors.white,
                    fontSize: 17,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    side: BorderSide(color: Colors.deepPurpleAccent),
                    primary: _hasbeenPressed5 ? Color(0xFFFF9CDA) : Color(0xFF041B2D),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10)
                ),
              ),
              ElevatedButton(
                onPressed: (){
                  setState(() {
                    _hasbeenPressed6 = !_hasbeenPressed6;
                  });
                  if(_hasbeenPressed6)
                  {
                    dataCreativity.add("Make-Up");
                  }
                  else {
                    dataCreativity.remove("Make-Up");
                  }
                },
                child: Text(
                  "Make-Up",
                  style: TextStyle(
                    fontFamily: "Chivo-Light",
                    color: Colors.white,
                    fontSize: 17,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    side: BorderSide(color: Colors.deepPurpleAccent),
                    primary: _hasbeenPressed6 ? Color(0xFFFF9CDA) : Color(0xFF041B2D),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10)
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: (){
                  setState(() {
                    _hasbeenPressed7 = !_hasbeenPressed7;
                  });
                  if(_hasbeenPressed7)
                  {
                    dataCreativity.add("Singing");
                  }
                  else {
                    dataCreativity.remove("Singing");
                  }
                },
                child: Text(
                  "Singing",
                  style: TextStyle(
                    fontFamily: "Chivo-Light",
                    color: Colors.white,
                    fontSize: 17,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    side: BorderSide(color: Colors.deepPurpleAccent),
                    primary: _hasbeenPressed7 ? Color(0xFFFF9CDA) : Color(0xFF041B2D),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 30)
                ),
              ),
              ElevatedButton(
                onPressed: (){
                  setState(() {
                    _hasbeenPressed8 = !_hasbeenPressed8;
                  });
                  if(_hasbeenPressed8)
                  {
                    dataCreativity.add("Writing");
                  }
                  else {
                    dataCreativity.remove("Writing");
                  }
                },
                child: Text(
                  "Writing",
                  style: TextStyle(
                    fontFamily: "Chivo-Light",
                    color: Colors.white,
                    fontSize: 17,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    side: BorderSide(color: Colors.deepPurpleAccent),
                    primary: _hasbeenPressed8 ? Color(0xFFFF9CDA) : Color(0xFF041B2D),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 30)
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Sports extends StatefulWidget {
  const Sports({Key? key}) : super(key: key);

  @override
  _SportsState createState() => _SportsState();
}

class _SportsState extends State<Sports> {
    bool _hasbeenPressed = false;
    bool _hasbeenPressed2 = false;
    bool _hasbeenPressed3 = false;
    bool _hasbeenPressed4 = false;
    bool _hasbeenPressed5 = false;
    bool _hasbeenPressed6 = false;
    bool _hasbeenPressed7 = false;
    bool _hasbeenPressed8 = false;
    @override
    Widget build(BuildContext context) {
      return Container(
        constraints: BoxConstraints(minWidth: 100, maxWidth: 450),
        alignment: Alignment.centerLeft,
        child: Column(
          children: [
            Container(
              constraints: BoxConstraints(minWidth: 100, maxWidth: 250),
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(right: 100.0),
              child: Text(
                'Sports',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: "Chivo-Bold"
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: (){
                    setState(() {
                      _hasbeenPressed = !_hasbeenPressed;
                    });
                    if(_hasbeenPressed)
                    {
                      dataCreativity.add("Basketball");
                    }
                    else {
                      dataCreativity.remove("Basketball");
                    }
                  },
                  child: Text(
                    "Basketball",
                    style: TextStyle(
                      fontFamily: "Chivo-Light",
                      color: Colors.white,
                      fontSize: 17,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                      side: BorderSide(color: Colors.deepPurpleAccent),
                      primary: _hasbeenPressed ? Color(0xFFFF9CDA) : Color(0xFF041B2D),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10)
                  ),
                ),
                ElevatedButton(
                  onPressed: (){
                    setState(() {
                      _hasbeenPressed2 = !_hasbeenPressed2;
                    });
                    if(_hasbeenPressed2)
                    {
                      dataCreativity.add("Tennis");
                    }
                    else {
                      dataCreativity.remove("Tennis");
                    }
                  },
                  child: Text(
                    "Tennis",
                    style: TextStyle(
                      fontFamily: "Chivo-Light",
                      color: Colors.white,
                      fontSize: 17,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                      side: BorderSide(color: Colors.deepPurpleAccent),
                      primary: _hasbeenPressed2 ? Color(0xFFFF9CDA) : Color(0xFF041B2D),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10)
                  ),
                ),
                ElevatedButton(
                  onPressed: (){
                    setState(() {
                      _hasbeenPressed3 = !_hasbeenPressed3;
                    });
                    if(_hasbeenPressed3)
                    {
                      dataCreativity.add("Chess");
                    }
                    else {
                      dataCreativity.remove("Chess");
                    }
                  },
                  child: Text(
                    "Chess",
                    style: TextStyle(
                      fontFamily: "Chivo-Light",
                      color: Colors.white,
                      fontSize: 17,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                      side: BorderSide(color: Colors.deepPurpleAccent),
                      primary: _hasbeenPressed3 ? Color(0xFFFF9CDA) : Color(0xFF041B2D),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10)
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: (){
                    setState(() {
                      _hasbeenPressed4 = !_hasbeenPressed4;
                    });
                    if(_hasbeenPressed4)
                    {
                      dataCreativity.add("Volleyball");
                    }
                    else {
                      dataCreativity.remove("Volleyball");
                    }
                  },
                  child: Text(
                    "Voleyball",
                    style: TextStyle(
                      fontFamily: "Chivo-Light",
                      color: Colors.white,
                      fontSize: 17,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                      side: BorderSide(color: Colors.deepPurpleAccent),
                      primary: _hasbeenPressed4 ? Color(0xFFFF9CDA) : Color(0xFF041B2D),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10)
                  ),
                ),
                ElevatedButton(
                  onPressed: (){
                    setState(() {
                      _hasbeenPressed5 = !_hasbeenPressed5;
                    });
                    if(_hasbeenPressed5)
                    {
                      dataCreativity.add("Boxing");
                    }
                    else {
                      dataCreativity.remove("Boxing");
                    }
                  },
                  child: Text(
                    "Boxing",
                    style: TextStyle(
                      fontFamily: "Chivo-Light",
                      color: Colors.white,
                      fontSize: 17,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                      side: BorderSide(color: Colors.deepPurpleAccent),
                      primary: _hasbeenPressed5 ? Color(0xFFFF9CDA) : Color(0xFF041B2D),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10)
                  ),
                ),
                ElevatedButton(
                  onPressed: (){
                    setState(() {
                      _hasbeenPressed6 = !_hasbeenPressed6;
                    });
                    if(_hasbeenPressed6)
                    {
                      dataCreativity.add("Swimming");
                    }
                    else {
                      dataCreativity.remove("Swimming");
                    }
                  },
                  child: Text(
                    "Swimming",
                    style: TextStyle(
                      fontFamily: "Chivo-Light",
                      color: Colors.white,
                      fontSize: 17,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                      side: BorderSide(color: Colors.deepPurpleAccent),
                      primary: _hasbeenPressed6 ? Color(0xFFFF9CDA) : Color(0xFF041B2D),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10)
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: (){
                    setState(() {
                      _hasbeenPressed7 = !_hasbeenPressed7;
                    });
                    if(_hasbeenPressed7)
                    {
                      dataCreativity.add("Golf");
                    }
                    else {
                      dataCreativity.remove("Golf");
                    }
                  },
                  child: Text(
                    "Golf",
                    style: TextStyle(
                      fontFamily: "Chivo-Light",
                      color: Colors.white,
                      fontSize: 17,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                      side: BorderSide(color: Colors.deepPurpleAccent),
                      primary: _hasbeenPressed7 ? Color(0xFFFF9CDA) : Color(0xFF041B2D),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10)
                  ),
                ),
                ElevatedButton(
                  onPressed: (){
                    setState(() {
                      _hasbeenPressed8 = !_hasbeenPressed8;
                    });
                    if(_hasbeenPressed8)
                    {
                      dataCreativity.add("Cycling");
                    }
                    else {
                      dataCreativity.remove("Cycling");
                    }
                  },
                  child: Text(
                    "Cycling",
                    style: TextStyle(
                      fontFamily: "Chivo-Light",
                      color: Colors.white,
                      fontSize: 17,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                      side: BorderSide(color: Colors.deepPurpleAccent),
                      primary: _hasbeenPressed8 ? Color(0xFFFF9CDA) : Color(0xFF041B2D),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10)
                  ),
                ),
              ],
            ),
          ],
        ),
      );
  }
}

class Goingout extends StatefulWidget {
  const Goingout({Key? key}) : super(key: key);

  @override
  _GoingoutState createState() => _GoingoutState();
}

class _GoingoutState extends State<Goingout> {
  bool _hasbeenPressed = false;
  bool _hasbeenPressed2 = false;
  bool _hasbeenPressed3 = false;
  bool _hasbeenPressed4 = false;
  bool _hasbeenPressed5 = false;
  bool _hasbeenPressed6 = false;
  bool _hasbeenPressed7 = false;
  bool _hasbeenPressed8 = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minWidth: 100, maxWidth: 450),
      alignment: Alignment.centerLeft,
      child: Column(
        children: [
          Container(
            constraints: BoxConstraints(minWidth: 100, maxWidth: 250),
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(right: 100.0),
            child: Text(
              'Going out',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: "Chivo-Bold"
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: (){
                  setState(() {
                    _hasbeenPressed = !_hasbeenPressed;
                  });
                  if(_hasbeenPressed)
                  {
                    dataCreativity.add("Bars");
                  }
                  else {
                    dataCreativity.remove("Bars");
                  }
                },
                child: Text(
                  "Bars",
                  style: TextStyle(
                    fontFamily: "Chivo-Light",
                    color: Colors.white,
                    fontSize: 17,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    side: BorderSide(color: Colors.deepPurpleAccent),
                    primary: _hasbeenPressed ? Color(0xFFFF9CDA) : Color(0xFF041B2D),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 30)
                ),
              ),
              ElevatedButton(
                onPressed: (){
                  setState(() {
                    _hasbeenPressed2 = !_hasbeenPressed2;
                  });
                  if(_hasbeenPressed2)
                  {
                    dataCreativity.add("Clubs");
                  }
                  else {
                    dataCreativity.remove("Clubs");
                  }
                },
                child: Text(
                  "Clubs",
                  style: TextStyle(
                    fontFamily: "Chivo-Light",
                    color: Colors.white,
                    fontSize: 17,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    side: BorderSide(color: Colors.deepPurpleAccent),
                    primary: _hasbeenPressed2 ? Color(0xFFFF9CDA) : Color(0xFF041B2D),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10)
                ),
              ),
              ElevatedButton(
                onPressed: (){
                  setState(() {
                    _hasbeenPressed3 = !_hasbeenPressed3;
                  });
                  if(_hasbeenPressed3)
                  {
                    dataCreativity.add("Concerts");
                  }
                  else {
                    dataCreativity.remove("Concerts");
                  }
                },
                child: Text(
                  "Concerts",
                  style: TextStyle(
                    fontFamily: "Chivo-Light",
                    color: Colors.white,
                    fontSize: 17,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    side: BorderSide(color: Colors.deepPurpleAccent),
                    primary: _hasbeenPressed3 ? Color(0xFFFF9CDA) : Color(0xFF041B2D),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10)
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: (){
                  setState(() {
                    _hasbeenPressed4 = !_hasbeenPressed4;
                  });
                  if(_hasbeenPressed4)
                  {
                    dataCreativity.add("Festivals");
                  }
                  else {
                    dataCreativity.remove("Festivals");
                  }
                },
                child: Text(
                  "Festivals",
                  style: TextStyle(
                    fontFamily: "Chivo-Light",
                    color: Colors.white,
                    fontSize: 17,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    side: BorderSide(color: Colors.deepPurpleAccent),
                    primary: _hasbeenPressed4 ? Color(0xFFFF9CDA) : Color(0xFF041B2D),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10)
                ),
              ),
              ElevatedButton(
                onPressed: (){
                  setState(() {
                    _hasbeenPressed5 = !_hasbeenPressed5;
                  });
                  if(_hasbeenPressed5)
                  {
                    dataCreativity.add("Karaoke");
                  }
                  else {
                    dataCreativity.remove("Karaoke");
                  }
                },
                child: Text(
                  "Karaoke",
                  style: TextStyle(
                    fontFamily: "Chivo-Light",
                    color: Colors.white,
                    fontSize: 17,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    side: BorderSide(color: Colors.deepPurpleAccent),
                    primary: _hasbeenPressed5 ? Color(0xFFFF9CDA) : Color(0xFF041B2D),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10)
                ),
              ),
              ElevatedButton(
                onPressed: (){
                  setState(() {
                    _hasbeenPressed6 = !_hasbeenPressed6;
                  });
                  if(_hasbeenPressed6)
                  {
                    dataCreativity.add("Stand up");
                  }
                  else {
                    dataCreativity.remove("Stand up");
                  }
                },
                child: Text(
                  "Stand up",
                  style: TextStyle(
                    fontFamily: "Chivo-Light",
                    color: Colors.white,
                    fontSize: 17,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    side: BorderSide(color: Colors.deepPurpleAccent),
                    primary: _hasbeenPressed6 ? Color(0xFFFF9CDA) : Color(0xFF041B2D),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10)
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: (){
                  setState(() {
                    _hasbeenPressed7 = !_hasbeenPressed7;
                  });
                  if(_hasbeenPressed7)
                  {
                    dataCreativity.add("Theater");
                  }
                  else {
                    dataCreativity.remove("Theater");
                  }
                },
                child: Text(
                  "Theater",
                  style: TextStyle(
                    fontFamily: "Chivo-Light",
                    color: Colors.white,
                    fontSize: 17,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    side: BorderSide(color: Colors.deepPurpleAccent),
                    primary: _hasbeenPressed7 ? Color(0xFFFF9CDA) : Color(0xFF041B2D),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10)
                ),
              ),
              ElevatedButton(
                onPressed: (){
                  setState(() {
                    _hasbeenPressed8 = !_hasbeenPressed8;
                  });
                  if(_hasbeenPressed8)
                  {
                    dataCreativity.add("Museums & Galleries");
                  }
                  else {
                    dataCreativity.remove("Museums & Galleries");
                  }
                },
                child: Text(
                  "Museums & Galleries",
                  style: TextStyle(
                    fontFamily: "Chivo-Light",
                    color: Colors.white,
                    fontSize: 17,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    side: BorderSide(color: Colors.deepPurpleAccent),
                    primary: _hasbeenPressed8 ? Color(0xFFFF9CDA) : Color(0xFF041B2D),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10)
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Stayingin extends StatefulWidget {
  const Stayingin({Key? key}) : super(key: key);

  @override
  _StayinginState createState() => _StayinginState();
}

class _StayinginState extends State<Stayingin> {
  bool _hasbeenPressed = false;
  bool _hasbeenPressed2 = false;
  bool _hasbeenPressed3 = false;
  bool _hasbeenPressed4 = false;
  bool _hasbeenPressed5 = false;
  bool _hasbeenPressed6 = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minWidth: 100, maxWidth: 450),
      alignment: Alignment.centerLeft,
      child: Column(
        children: [
          Container(
            constraints: BoxConstraints(minWidth: 100, maxWidth: 250),
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(right: 100.0),
            child: Text(
              'Staying in',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: "Chivo-Bold"
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: (){
                  setState(() {
                    _hasbeenPressed = !_hasbeenPressed;
                  });
                  if(_hasbeenPressed)
                  {
                    dataCreativity.add("Baking");
                  }
                  else {
                    dataCreativity.remove("Baking");
                  }
                },
                child: Text(
                  "Baking",
                  style: TextStyle(
                    fontFamily: "Chivo-Light",
                    color: Colors.white,
                    fontSize: 17,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    side: BorderSide(color: Colors.deepPurpleAccent),
                    primary: _hasbeenPressed ? Color(0xFFFF9CDA) : Color(0xFF041B2D),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10)
                ),
              ),
              ElevatedButton(
                onPressed: (){
                  setState(() {
                    _hasbeenPressed2 = !_hasbeenPressed2;
                  });
                  if(_hasbeenPressed2)
                  {
                    dataCreativity.add("Cooking");
                  }
                  else {
                    dataCreativity.remove("Cooking");
                  }
                },
                child: Text(
                  "Cooking",
                  style: TextStyle(
                    fontFamily: "Chivo-Light",
                    color: Colors.white,
                    fontSize: 17,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    side: BorderSide(color: Colors.deepPurpleAccent),
                    primary: _hasbeenPressed2 ? Color(0xFFFF9CDA) : Color(0xFF041B2D),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10)
                ),
              ),
              ElevatedButton(
                onPressed: (){
                  setState(() {
                    _hasbeenPressed3 = !_hasbeenPressed3;
                  });
                  if(_hasbeenPressed3)
                  {
                    dataCreativity.add("Gardening");
                  }
                  else {
                    dataCreativity.remove("Gardening");
                  }
                },
                child: Text(
                  "Gardening",
                  style: TextStyle(
                    fontFamily: "Chivo-Light",
                    color: Colors.white,
                    fontSize: 17,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    side: BorderSide(color: Colors.deepPurpleAccent),
                    primary: _hasbeenPressed3 ? Color(0xFFFF9CDA) : Color(0xFF041B2D),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10)
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: (){
                  setState(() {
                    _hasbeenPressed4 = !_hasbeenPressed4;
                  });
                  if(_hasbeenPressed4)
                  {
                    dataCreativity.add("Takeout");
                  }
                  else {
                    dataCreativity.remove("Takeout");
                  }
                },
                child: Text(
                  "Takeout",
                  style: TextStyle(
                    fontFamily: "Chivo-Light",
                    color: Colors.white,
                    fontSize: 17,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    side: BorderSide(color: Colors.deepPurpleAccent),
                    primary: _hasbeenPressed4 ? Color(0xFFFF9CDA) : Color(0xFF041B2D),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10)
                ),
              ),
              ElevatedButton(
                onPressed: (){
                  setState(() {
                    _hasbeenPressed5 = !_hasbeenPressed5;
                  });
                  if(_hasbeenPressed5)
                  {
                    dataCreativity.add("Board games");
                  }
                  else {
                    dataCreativity.remove("Board games");
                  }
                },
                child: Text(
                  "Board games",
                  style: TextStyle(
                    fontFamily: "Chivo-Light",
                    color: Colors.white,
                    fontSize: 17,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    side: BorderSide(color: Colors.deepPurpleAccent),
                    primary: _hasbeenPressed5 ? Color(0xFFFF9CDA) : Color(0xFF041B2D),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10)
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: (){
                  setState(() {
                    _hasbeenPressed6 = !_hasbeenPressed6;
                  });
                  if(_hasbeenPressed6)
                  {
                    dataCreativity.add("Video games");
                  }
                  else {
                    dataCreativity.remove("Video games");
                  }
                },
                child: Text(
                  "Video games",
                  style: TextStyle(
                    fontFamily: "Chivo-Light",
                    color: Colors.white,
                    fontSize: 17,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    side: BorderSide(color: Colors.deepPurpleAccent),
                    primary: _hasbeenPressed6 ? Color(0xFFFF9CDA) : Color(0xFF041B2D),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10)
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class FilmTv extends StatefulWidget {
  const FilmTv({Key? key}) : super(key: key);

  @override
  _FilmTvState createState() => _FilmTvState();
}

class _FilmTvState extends State<FilmTv> {
  bool _hasbeenPressed = false;
  bool _hasbeenPressed2 = false;
  bool _hasbeenPressed3 = false;
  bool _hasbeenPressed4 = false;
  bool _hasbeenPressed5 = false;
  bool _hasbeenPressed6 = false;
  bool _hasbeenPressed7 = false;
  bool _hasbeenPressed8 = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minWidth: 100, maxWidth: 450),
      alignment: Alignment.centerLeft,
      child: Column(
        children: [
          Container(
            constraints: BoxConstraints(minWidth: 100, maxWidth: 250),
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(right: 100.0),
            child: Text(
              'Film & TV',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: "Chivo-Bold"
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: (){
                  setState(() {
                    _hasbeenPressed = !_hasbeenPressed;
                  });
                  if(_hasbeenPressed)
                  {
                    dataCreativity.add("Comedy");
                  }
                  else {
                    dataCreativity.remove("Comedy");
                  }
                },
                child: Text(
                  "Comedy",
                  style: TextStyle(
                    fontFamily: "Chivo-Light",
                    color: Colors.white,
                    fontSize: 17,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    side: BorderSide(color: Colors.deepPurpleAccent),
                    primary: _hasbeenPressed ? Color(0xFFFF9CDA) : Color(0xFF041B2D),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10)
                ),
              ),
              ElevatedButton(
                onPressed: (){
                  setState(() {
                    _hasbeenPressed2 = !_hasbeenPressed2;
                  });
                  if(_hasbeenPressed2)
                  {
                    dataCreativity.add("Anime");
                  }
                  else {
                    dataCreativity.remove("Anime");
                  }
                },
                child: Text(
                  "Anime",
                  style: TextStyle(
                    fontFamily: "Chivo-Light",
                    color: Colors.white,
                    fontSize: 17,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    side: BorderSide(color: Colors.deepPurpleAccent),
                    primary: _hasbeenPressed2 ? Color(0xFFFF9CDA) : Color(0xFF041B2D),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10)
                ),
              ),
              ElevatedButton(
                onPressed: (){
                  setState(() {
                    _hasbeenPressed3 = !_hasbeenPressed3;
                  });
                  if(_hasbeenPressed3)
                  {
                    dataCreativity.add("K-Drama");
                  }
                  else {
                    dataCreativity.remove("K-Drama");
                  }
                },
                child: Text(
                  "K-Drama",
                  style: TextStyle(
                    fontFamily: "Chivo-Light",
                    color: Colors.white,
                    fontSize: 17,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    side: BorderSide(color: Colors.deepPurpleAccent),
                    primary: _hasbeenPressed3 ? Color(0xFFFF9CDA) : Color(0xFF041B2D),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10)
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: (){
                  setState(() {
                    _hasbeenPressed4 = !_hasbeenPressed4;
                  });
                  if(_hasbeenPressed4)
                  {
                    dataCreativity.add("Drama");
                  }
                  else {
                    dataCreativity.remove("Drama");
                  }
                },
                child: Text(
                  "Drama",
                  style: TextStyle(
                    fontFamily: "Chivo-Light",
                    color: Colors.white,
                    fontSize: 17,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    side: BorderSide(color: Colors.deepPurpleAccent),
                    primary: _hasbeenPressed4 ? Color(0xFFFF9CDA) : Color(0xFF041B2D),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10)
                ),
              ),
              ElevatedButton(
                onPressed: (){
                  setState(() {
                    _hasbeenPressed5 = !_hasbeenPressed5;
                  });
                  if(_hasbeenPressed5)
                  {
                    dataCreativity.add("Romance");
                  }
                  else {
                    dataCreativity.remove("Romance");
                  }
                },
                child: Text(
                  "Romance",
                  style: TextStyle(
                    fontFamily: "Chivo-Light",
                    color: Colors.white,
                    fontSize: 17,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    side: BorderSide(color: Colors.deepPurpleAccent),
                    primary: _hasbeenPressed5 ? Color(0xFFFF9CDA) : Color(0xFF041B2D),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10)
                ),
              ),
              ElevatedButton(
                onPressed: (){
                  setState(() {
                    _hasbeenPressed6 = !_hasbeenPressed6;
                  });
                  if(_hasbeenPressed6)
                  {
                    dataCreativity.add("Horror");
                  }
                  else {
                    dataCreativity.remove("Horror");
                  }
                },
                child: Text(
                  "Horror",
                  style: TextStyle(
                    fontFamily: "Chivo-Light",
                    color: Colors.white,
                    fontSize: 17,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    side: BorderSide(color: Colors.deepPurpleAccent),
                    primary: _hasbeenPressed6 ? Color(0xFFFF9CDA) : Color(0xFF041B2D),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10)
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: (){
                  setState(() {
                    _hasbeenPressed7 = !_hasbeenPressed7;
                  });
                  if(_hasbeenPressed7)
                  {
                    dataCreativity.add("Sci-fi");
                  }
                  else {
                    dataCreativity.remove("Sci-fi");
                  }
                },
                child: const Text(
                  "Sci-fi",
                  style: TextStyle(
                    fontFamily: "Chivo-Light",
                    color: Colors.white,
                    fontSize: 17,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    side: BorderSide(color: Colors.deepPurpleAccent),
                    primary: _hasbeenPressed7 ? Color(0xFFFF9CDA) : Color(0xFF041B2D),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 30)
                ),
              ),
              ElevatedButton(
                onPressed: (){
                  setState(() {
                    _hasbeenPressed8 = !_hasbeenPressed8;
                  });
                  if(_hasbeenPressed8)
                  {
                    dataCreativity.add("Fantasy");
                  }
                  else {
                    dataCreativity.remove("Fantasy");
                  }
                },
                child: Text(
                  "Fantasy",
                  style: TextStyle(
                    fontFamily: "Chivo-Light",
                    color: Colors.white,
                    fontSize: 17,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    side: BorderSide(color: Colors.deepPurpleAccent),
                    primary: _hasbeenPressed8 ? Color(0xFFFF9CDA) : Color(0xFF041B2D),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 30)
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Future<void> setInterest(BuildContext context) async {
  final Future<SharedPreferences> _pref = SharedPreferences.getInstance();
  final SharedPreferences pref = await _pref;
  Map<String, dynamic> dataMap = {
    'interests': dataCreativity
  };
  String? token = pref.getString("token");
  var body = json.encode(dataMap);
  var response = await http.post(Uri.parse("http://10.0.2.2:8000/user/interest"),
      headers: {"Content-Type":"application/json","Authorization":"Bearer $token"},
      body: body
  );
  if (response.statusCode == 200) {
    print(response.body);
  }
  else
    print(response.body);
    print(body);
}

class NextInterest extends StatefulWidget {
  const NextInterest({Key? key}) : super(key: key);

  @override
  _NextInterestState createState() => _NextInterestState();
}

class _NextInterestState extends State<NextInterest> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minWidth: 100, maxWidth: 250),
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(left: 250.0),
      child: TextButton(
        style: TextButton.styleFrom(
            backgroundColor: const Color(0xFF041B2D),
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 30)
        ),
        onPressed: () {
          setInterest(context);
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
    );
  }
}





