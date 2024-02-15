import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tictac/game.dart';

class SplachScrean extends StatefulWidget {
  @override
  State<SplachScrean> createState() => _SplachScreanState();
}

class _SplachScreanState extends State<SplachScrean> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 10)).then((value) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (BuildContext context) {
            return Application();
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage("images/x.png"),
                width: 100,
              ),
              SizedBox(width: 30),
              Image(
                image: AssetImage("images/o.png"),
                width: 100,
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            "XO GAME",
            style: TextStyle(
                color: Colors.white, fontSize: 50, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Designed and developed by ",
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              Text(
                "Mehdi Ramezani",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          SpinKitThreeInOut(
            color: Colors.blue,
            size: 50,
          ),
          SpinKitThreeInOut(
            color: Colors.red,
            size: 50,
          ),
        ],
      ),
    );
  }
}
