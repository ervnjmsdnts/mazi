import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
class LocationScreen extends StatelessWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFF041B2D),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          LocationText(),
          SizedBox(height: 50),
          LocationButton(),
          SizedBox(height: 250),
          LocationSubtext()
        ],
      ),
    );
  }
}

class LocationText extends StatelessWidget {
  const LocationText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: BoxConstraints(minWidth: 100, maxWidth: 250),
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(left: 10.0),

        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(right: 120.0),
              child: Icon(Icons.pin_drop, size: 150, color: Colors.white,),
            ),

            Text(
              'Enable Location Services',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontFamily: "Chivo-Bold"
              ),
            ),
            SizedBox(height: 10,),
            Text(
              'We use your location to show your possible matches in your area.',
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

class LocationButton extends StatefulWidget {
  const LocationButton({Key? key}) : super(key: key);

  @override
  _LocationButtonState createState() => _LocationButtonState();
}

class _LocationButtonState extends State<LocationButton> {
  var locationMessage = "";
  void getCurrentLocation() async {
    var position = await Geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    var lastPosition = await Geolocator.getLastKnownPosition();
    print(lastPosition);

    setState(() {
      locationMessage = "$position.latitude, $position.longitude";
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          style: TextButton.styleFrom(
              fixedSize: Size(200, 40),
              backgroundColor: const Color(0xFF428CD4),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 30)
          ),

          onPressed: () {
            getCurrentLocation();
            /* Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) {
                    return const LocationScreen();
                  }
              ),
            ); */
          },
          child: const Text(
            'Enable Location',
            style: TextStyle(
              fontFamily: "Chivo-Light",
              color: Colors.white,
              fontSize: 17,
            ),
          ),
        ),
        Text("Position: $locationMessage")
      ],
    );
  }
}


class LocationSubtext extends StatelessWidget {
  const LocationSubtext({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

    );
  }
}