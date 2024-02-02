import 'package:flutter/material.dart';

void main() {
  runApp(Application());
}

class Application extends StatefulWidget {
  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  bool isTurnX = true;
  List<String> TurnXANDTurnO = ["", "", "", "", "", "", "", "", ""];
  bool has_result = false;
  int scorePlayerX = 0;
  int scorePlayerO = 0;
  int filBox = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.purple[900],
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  isTurnX
                      ? Padding(
                          padding: const EdgeInsets.only(bottom: 40),
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white),
                                child: _getCard("x", scorePlayerX.toString()),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Your Turn",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        )
                      : _getCard("x", scorePlayerX.toString()),
                  isTurnX == false
                      ? Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white),
                              child: _getCard("o", scorePlayerO.toString()),
                            ),
                            Text(
                              "Your Turn",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        )
                      : _getCard("o", scorePlayerO.toString()),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: 390,
                height: 400,
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: has_result ? ResultGame() : Game(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void OnTap(int index) {
    setState(() {
      if (has_result) {
        return;
      }
      if (isTurnX) {
        TurnXANDTurnO[index] = "x";
        isTurnX = false;
        filBox = filBox + 1;
      } else {
        TurnXANDTurnO[index] = "o";
        isTurnX = true;
        filBox = filBox + 1;
      }
      checkResult();
    });
  }

  void checkResult() {
    //========================================================= Check Row ===============================================
    if (TurnXANDTurnO[0] == TurnXANDTurnO[1] &&
        TurnXANDTurnO[1] == TurnXANDTurnO[2] &&
        TurnXANDTurnO[0] != "") {
      getScore(TurnXANDTurnO[0]);

      print("${TurnXANDTurnO[0]} turn");
    }

    if (TurnXANDTurnO[3] == TurnXANDTurnO[4] &&
        TurnXANDTurnO[4] == TurnXANDTurnO[5] &&
        TurnXANDTurnO[3] != "") {
      getScore(TurnXANDTurnO[3]);
    }

    if (TurnXANDTurnO[6] == TurnXANDTurnO[7] &&
        TurnXANDTurnO[7] == TurnXANDTurnO[8] &&
        TurnXANDTurnO[7] != "") {
      getScore(TurnXANDTurnO[6]);
    }
    //========================================================= Check Row ===============================================

    //========================================================= Chcek Collumn =========================================

    if (TurnXANDTurnO[0] == TurnXANDTurnO[3] &&
        TurnXANDTurnO[3] == TurnXANDTurnO[6] &&
        TurnXANDTurnO[3] != "") {
      getScore(TurnXANDTurnO[0]);
    }

    if (TurnXANDTurnO[1] == TurnXANDTurnO[4] &&
        TurnXANDTurnO[4] == TurnXANDTurnO[7] &&
        TurnXANDTurnO[1] != "") {
      getScore(TurnXANDTurnO[1]);
    }

    if (TurnXANDTurnO[2] == TurnXANDTurnO[5] &&
        TurnXANDTurnO[5] == TurnXANDTurnO[8] &&
        TurnXANDTurnO[2] != "") {
      getScore(TurnXANDTurnO[2]);
    }

    //==================================================== End Collumn =============================================================

    if (TurnXANDTurnO[0] == TurnXANDTurnO[4] &&
        TurnXANDTurnO[4] == TurnXANDTurnO[8] &&
        TurnXANDTurnO[0] != "") {
      getScore(TurnXANDTurnO[0]);
    }

    if (TurnXANDTurnO[2] == TurnXANDTurnO[4] &&
        TurnXANDTurnO[4] == TurnXANDTurnO[6] &&
        TurnXANDTurnO[2] != "") {
      getScore(TurnXANDTurnO[2]);
    }
  }

  void getScore(String player) {
    setState(() {
      has_result = true;
      if (player == "x") {
        scorePlayerX = scorePlayerX + 1;
      } else if (player == "0") {
        scorePlayerO = scorePlayerO + 1;
      } else {
        scorePlayerO = scorePlayerO + 1;
        scorePlayerX = scorePlayerX + 1;
      }
    });
  }

  Widget Game() {
    return GridView.builder(
        itemCount: 9,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, mainAxisSpacing: 12, crossAxisSpacing: 10),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              OnTap(index);
            },
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[900]),
              child: Center(
                child: TurnXANDTurnO[index] != ""
                    ? Image(
                        image: AssetImage("images/${TurnXANDTurnO[index]}.png"),
                        width: 60,
                      )
                    : Text(""),
              ),
            ),
          );
        });
  }

  Widget ResultGame() {
    return Column(
      children: [
        SizedBox(
          height: 15,
        ),
        Image(
          image: AssetImage("images/xplayer.png"),
          width: 120,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "X is winner !",
          style: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.w900),
        ),
        SizedBox(
          height: 10,
        ),
        TextButton(
          style: TextButton.styleFrom(
              backgroundColor: Colors.red, maximumSize: Size(150, 100)),
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(
                Icons.play_arrow,
                color: Colors.white,
              ),
              Text(
                "Play Again",
                style: TextStyle(color: Colors.white, fontSize: 20),
              )
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        OutlinedButton(
          onPressed: () {},
          child: Text(
            "Restart The Game",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w900),
          ),
        )
      ],
    );
  }

  Widget _getCard(String player, String score) {
    return Card(
      color: Colors.grey[900],
      child: Container(
        width: 150,
        height: 220,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 70,
              width: 80,
              child: Image.asset(
                "images/${player}player.png",
              ),
            ),
            Text(
              score,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 30,
              width: 30,
              child: Image(
                image: AssetImage("images/${player}.png"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
