import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> {
  Icon restartIcon = Icon(Icons.restart_alt);

  bool isPlayerOneMarked = false;
  bool isPlayerTwoMarked = false;
  String playerOne = "";
  String playerTwo = "";

  void showResultDialog(GameCombo playerOne, GameCombo playerTwo) {
  
    int result = playerOne.getResult(playerTwo);

    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: const Text("가위바위보 게임"),
              content: Text(
                  "Player1: ${playerOne.description}\nPlayer2: ${playerTwo.description}\n${result == 1 ? "Player1이 이겼습니다." : result == -1 ? "Player2가 이겼습니다." : "비겼습니다."}"),
              actions: [
                TextButton(
                  child: const Text("확인"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ));
    }

    void markPlayerOne() {
      // var playerStat = player;
      setState(() {
        isPlayerOneMarked = !isPlayerOneMarked;
      });
  }
  void markPlayerTwo() {
      setState(() {
        isPlayerTwoMarked = !isPlayerTwoMarked;
      });
    }
  String setPlayer(String stat) {
      return stat;
  }

  void reset() {
    setState(() {
      playerOne = "";
      playerTwo = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("가위바위보 게임")),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          ElevatedButton(
              onPressed: () {
              markPlayerOne();
              playerOne = setPlayer("가위");
              setState(() {
              });
              },
              child: const Text("가위")),
          const Padding(padding: EdgeInsets.symmetric(horizontal: 10.0)),
          ElevatedButton(
              onPressed: () {
              markPlayerOne();
              playerOne = setPlayer("바위");
              setState(() {
              });
              },
              child: const Text("바위")),
          const Padding(padding: EdgeInsets.symmetric(horizontal: 10.0)),
          ElevatedButton(
              onPressed: () {
              markPlayerOne();
              playerOne = setPlayer("보");
              setState(() {
              });
              },
              child: const Text("보")),
          const Padding(padding: EdgeInsets.symmetric(horizontal: 10.0)),
          if (isPlayerOneMarked) 
          Text(
            "Player1: $playerOne",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 84, 96, 106),
              ),
            ),
            SizedBox(height: 20),
            
        ]),
        // player 2
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          ElevatedButton(
              onPressed: () {
              markPlayerTwo();
              playerTwo = setPlayer("가위");
              setState(() {
              });
              },
              child: const Text("가위")),
          const Padding(padding: EdgeInsets.symmetric(horizontal: 10.0)),
          ElevatedButton(
              onPressed: () {
              markPlayerTwo();
              playerTwo = setPlayer("바위");
              setState(() {
              });
              },
              child: const Text("바위")),
          const Padding(padding: EdgeInsets.symmetric(horizontal: 10.0)),
          ElevatedButton(
              onPressed: () {
              markPlayerTwo();
              playerTwo = setPlayer("보");
              setState(() {
              });
              },
              child: const Text("보")),
          const Padding(padding: EdgeInsets.symmetric(horizontal: 10.0)),
          if (isPlayerTwoMarked) 
          Text(
            "Player2: $playerTwo",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 84, 96, 106),
              ),
            ),
            SizedBox(height: 20),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            ElevatedButton
            (onPressed: () {
            var playerOneCombo = GameCombo.fromDescription(playerOne);
            var playerTwoCombo = GameCombo.fromDescription(playerTwo);
            showResultDialog(playerOneCombo, playerTwoCombo);},
            child: const Text("RESULT")),
            ElevatedButton.icon(onPressed: () => reset(), icon: restartIcon, label: Text("초기화")),
          ])
      ]),
    )
    );
  }

  
}

enum GameCombo {
  nonexistent("정해지지 않음"),
  rock("바위"),
  scissors("가위"),
  paper("보");

  const GameCombo(this.description);

  final String description;

  // 상대에게 이기면 1, 비기면 0, 지면 -1
  int getResult(GameCombo computer) {
    
    if (computer == this) return 0;
    switch (this) {
      case GameCombo.rock:
        return computer == GameCombo.scissors ? 1 : -1;
      case GameCombo.scissors:
        return computer == GameCombo.paper ? 1 : -1;
      case GameCombo.paper:
      default:
        return computer == GameCombo.rock ? 1 : -1;
    }
  }

  static GameCombo fromDescription(String description) {
    for (var combo in GameCombo.values) {
      if (combo.description == description) {
        return combo;
      }
    }
    throw ArgumentError("Invalid description: $description");
  }
}