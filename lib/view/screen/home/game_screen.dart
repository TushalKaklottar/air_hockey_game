import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import '../../../view_model/airhocky_game.dart';
import '../../../view_model/menu.dart';
import '../../../view_model/playerpaddle.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  late AirHockeyGame myAirHockeyGame;
  late int _playerRedScore;
  late int _playerBlueScore;

  void PlayerScored(PlayerColor whichplayer) {
    setState(() {
      if (whichplayer == PlayerColor.redPlayer) {
        myAirHockeyGame.whoScored = PlayerColor.redPlayer;
        _playerRedScore++;
      } else {
        myAirHockeyGame.whoScored = PlayerColor.bluePlayer;
        _playerBlueScore++;
      }
      myAirHockeyGame.removePuck();
      myAirHockeyGame.updateScore(_playerRedScore, _playerBlueScore);
    });
  }

  void NewGame() {
    setState(() {
      _playerRedScore = 0;
      _playerBlueScore = 0;
    });
    myAirHockeyGame.restartGame();
  }

  @override
  void initState() {
    super.initState();
    _playerRedScore = 0;
    _playerBlueScore = 1;
    myAirHockeyGame = AirHockeyGame();
    myAirHockeyGame.paused = false;
    myAirHockeyGame.whoScored = PlayerColor.noPlayer;
    myAirHockeyGame.PlayerScored = PlayerScored;
    myAirHockeyGame.NewGame = NewGame;
  }

  @override
  Widget build(BuildContext context) {
    double x = MediaQuery.of(context).size.width.roundToDouble();
    double y = MediaQuery.of(context).size.height.roundToDouble();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              constraints: BoxConstraints.expand(width: x, height: y),
              child: GameWidget<AirHockeyGame>(
                game: myAirHockeyGame,
                overlayBuilderMap: const {
                  'PauseMenu': pauseMenuBuilder,
                  'FaceoffMenu': faceoffMenuBuilder,
                  'WinnerMenu': winnerMenuBuilder,
                },
                backgroundBuilder: (context) => Padding(
                  padding: const EdgeInsets.all(1),
                  child: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/lobb.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
