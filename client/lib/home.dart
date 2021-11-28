import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mazi/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  final screens = [
    Home(),
    Profile(),
    Match(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFF041B2D),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,

        backgroundColor: const Color(0xFF041B2D),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        selectedFontSize: 5,
        showUnselectedLabels: false,
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: '_______________',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '_______________',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: '_______________',
          ),
        ],
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  late Animation<double> _animation2;
  late Animation<double> _animation3;
  late Animation<double> _animation4;
  late Animation<double> _animation5;
  @override
  dispose() {
    _animationController.dispose(); // you need this
    super.dispose();
  }

  @override void initState() {
    super.initState();

    _animationController = AnimationController(
        vsync: this,
      duration: Duration(seconds: 2),
    );

    _animation =
        Tween<double>(begin: 1.0, end: 1.8).animate(_animationController);
    _animation2 =
        Tween<double>(begin: 2.0, end: 2.8).animate(_animationController);
    _animation3 =
        Tween<double>(begin: 3.0, end: 3.8).animate(_animationController);
    _animation4 =
        Tween<double>(begin: 4.0, end: 4.8).animate(_animationController);
    _animation5 =
        Tween<double>(begin: 5.0, end: 5.8).animate(_animationController);
    _animationController.forward();
    _animation.addStatusListener((status) {
      if(status == AnimationStatus.completed){
        _animationController.reverse();
      }else if(status == AnimationStatus.dismissed){
        _animationController.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/unnamed.png', width: 70, height: 70,),
          SizedBox(height: 200),
          Stack(
            children: [
              ScaleTransition(
                scale: _animation,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(width: 0.5, color: Color(0xFF9D91D6))),
                  child: Icon(
                    Icons.circle,
                    color: Colors.transparent,
                    size: 60,
                  ),
                )
              ),
              ScaleTransition(
                scale: _animation2,
                child:  Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(width: 0.5, color: Color(0xFFFF9CDA))),
                  child: Icon(
                    Icons.circle,
                    color: Colors.transparent,
                    size: 60,
                  ),
                )
                  ),
              ScaleTransition(
                scale: _animation3,
                child:  Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(width: 0.5, color: Color(0xFF9D91D6))),
                  child: Icon(
                    Icons.circle,
                    color: Colors.transparent,
                    size: 60,
                  ),
                )
              ),
              ScaleTransition(
                  scale: _animation4,
                  child:  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(width: 0.5, color: Color(0xFFFF9CDA))),
                    child: Icon(
                      Icons.circle,
                      color: Colors.transparent,
                      size: 60,
                    ),
                  )
              ),
              ScaleTransition(
                  scale: _animation5,
                  child:  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(width: 0.5, color: Color(0xFF9D91D6))),
                    child: Icon(
                      Icons.circle,
                      color: Colors.transparent,
                      size: 60,
                    ),
                  )
              ),
              Icon(
                Icons.circle,
                size: 60,
                color: Colors.red,
              ),
            ],
          ),
          SizedBox(height: 200),
          TextButton(
            style: TextButton.styleFrom(
                backgroundColor: const Color(0xFF428CD4),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 60)
            ),
            onPressed: () =>
                Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.yellow)
                  ),
                  width: 20,
                  height: 20,
                )
            , child: const Text(
            "Start",
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontFamily: "Chivo-Light",
            ),
          ),
          ),
        ],
      ),
    );
  }
}

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

 Future<User> fetchposts() async {
    final Future<SharedPreferences> _pref = SharedPreferences.getInstance();
    final SharedPreferences pref = await _pref;
    String? token = pref.getString("token");
    var response = await http.get(Uri.parse("http://10.0.2.2:8000/user/interest/"),
      headers: {"Content-Type":"application/json","Authorization":"Bearer $token"},
    );
    if(response.statusCode == 200) {
     var asd = User.fromJson(jsonDecode(response.body));
      return asd;
    } else
      {
        throw Exception("failed to load user");
      }
  }

  @override
  Widget build(BuildContext context) {
    return
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                //color: Colors.yellow,
                child: Column(
                  children: [
                    Icon(Icons.account_circle, color: Colors.white, size: 80,),
                    FutureBuilder<User>(future: fetchposts(),builder: (context, snapshot){
                      if(snapshot.hasData){
                        return Text(snapshot.data!.firstName,
                            style:TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                              fontFamily: "Chivo-Light",
                            ));
                      } else if(snapshot.hasError){
                        return Text("$snapshot.data", style:TextStyle(color: Colors.white));
                      }
                      return const CircularProgressIndicator();
                    }),
                    FutureBuilder<User>(future: fetchposts(),builder: (context, snapshot){
                      if(snapshot.hasData){
                        return Text(snapshot.data!.email,
                            style:TextStyle(
                                color: Colors.white70,
                              fontSize: 14,
                              fontFamily: "Chivo-Light",
                            ));
                      } else if(snapshot.hasError){
                        return Text("$snapshot.data", style:TextStyle(color: Colors.white));
                      }
                      return const CircularProgressIndicator();
                    }),
                  ],
                ),
              ),
              Container(
                //color: Colors.lightBlue,
                decoration: BoxDecoration(border: Border.all(color: Colors.deepPurpleAccent)),
                height: 200,
                child:
                    FutureBuilder<User>(future: fetchposts(),builder: (context, snapshot){
                      if(snapshot.hasData){
                        var asd = snapshot.data!.interests.toList();
                        return ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: asd.length,
                              itemBuilder: (BuildContext context, int index){
                                return
                                  ListTile(
                                      trailing: ElevatedButton(
                                        onPressed: (){},
                                        child: Text(
                                          asd[index],
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 17,
                                            fontFamily: "Chivo-Light",
                                          ),
                                        ),
                                style: ElevatedButton.styleFrom(
                                side: BorderSide(color: Colors.deepPurpleAccent),
                                  primary:Color(0xFF041B2D),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10)
                                )
                                      ),
                                    );
                              }
                          );
                      } else if(snapshot.hasError){
                        return Text("$snapshot.data", style:TextStyle(color: Colors.white));
                      }
                      return const CircularProgressIndicator();
                    }),
              ),
            ],
          ),
        );
  }
}

class Match extends StatefulWidget {
  const Match({Key? key}) : super(key: key);

  @override
  _MatchState createState() => _MatchState();
}

class _MatchState extends State<Match> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
