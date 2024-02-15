import 'package:flutter/material.dart';
import 'package:tictac/game.dart';
import 'package:tictac/splash_screan.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SplachScrean(),
      ),
    );
  }
}
