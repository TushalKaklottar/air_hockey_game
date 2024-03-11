import 'package:air_hockey_game/view_model/playerpaddle.dart';
import 'package:air_hockey_game/view_model/puck.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'airhocky_game.dart';
import 'goal.dart';

class puckContactCallback extends ContactCallbacks {
  final ThePuck thePuck;
  late AirHockeyGame parentGame = thePuck.findParent() as AirHockeyGame;

  puckContactCallback({required this.thePuck});

  @override
  beginContact(Object other, Contact contact) {
    super.beginContact(other, contact);

    if (other is PlayerPaddle) {
      //FlameAudio.play('boing.mp3');
    }
  }

  @override
  void endContact(Object other, Contact contact) {
    super.beginContact(other, contact);
  }
}

class paddleContactCallback extends ContactCallbacks {
  final PlayerPaddle thePaddle;
  late AirHockeyGame parentGame = thePaddle.findParent() as AirHockeyGame;

  paddleContactCallback({required this.thePaddle});

  @override
  beginContact(Object other, Contact contact) {
    super.beginContact(other, contact);
  }

  @override
  void endContact(Object other, Contact contact) {
    super.beginContact(other, contact);
  }
}

class goalContactCallback extends ContactCallbacks {
  final Goal theGoal;
  late AirHockeyGame parentGame = theGoal.findParent() as AirHockeyGame;

  goalContactCallback({required this.theGoal});

  @override
  beginContact(Object other, Contact contact) {
    super.beginContact(other, contact);
    if (other is puckContactCallback) {
      if (theGoal.whichplayer == PlayerColor.redPlayer) {
        parentGame.PlayerScored(PlayerColor.bluePlayer);
      } else {
        parentGame.PlayerScored(PlayerColor.redPlayer);
      }
    }
  }

  @override
  void endContact(Object other, Contact contact) {
    super.beginContact(other, contact);
  }
}
