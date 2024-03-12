import 'package:flutter/material.dart' hide Draggable;
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame_forge2d/flame_forge2d.dart';

import 'airhocky_game.dart';
import 'contacthandlers.dart';

enum PlayerColor { redPlayer, bluePlayer, noPlayer }

class PlayerPaddle extends BodyComponent with Draggable {
  Vector2 position;
  double radius;
  Vector2 linearVelocity;
  PlayerColor whichplayer;

  MouseJoint? mouseJoint;
  late AirHockeyGame parentGame = findParent() as AirHockeyGame;

  PlayerPaddle(
      {required this.position,
      required this.radius,
      required this.linearVelocity,
      required this.whichplayer});

  @override
  Body createBody() {
    if (whichplayer == PlayerColor.redPlayer) {
      setColor(Colors.red);
    } else {
      setColor(Colors.blue);
    }

    final shape = CircleShape()..radius = radius;
    final mycontact = paddleContactCallback(thePaddle: this);
    final fixtureDef =
        FixtureDef(shape, density: 1.0, restitution: 0.0, friction: 1.0);
    final bodyDef = BodyDef(
        position: position,
        linearVelocity: linearVelocity,
        type: BodyType.dynamic,
        userData: mycontact);
    return world.createBody(bodyDef)..createFixture(fixtureDef);
  }

  @override
  bool onDragStart(DragStartInfo info) {
    return false;
  }

  // void setPaddlePosition(Vector2 position) {
  //   final mouseJointDef = MouseJointDef()
  //     ..maxForce = body.mass * 1000
  //     ..frequencyHz = 10
  //     ..dampingRatio = 0.0
  //     ..target.setFrom(body.position)
  //     ..collideConnected = false
  //     ..bodyA = parentGame.gameBody
  //     ..bodyB = body;
  //
  //   if (mouseJoint == null) {
  //     mouseJoint = MouseJoint(mouseJointDef);
  //     world.createJoint(mouseJoint!);
  //   }
  //
  //   mouseJoint?.setTarget(position);
  // }

  void setPaddlePosition(Vector2 position) {
    // Check if the world is locked before setting the position
    if (!parentGame.world.isLocked) {
      final mouseJointDef = MouseJointDef()
        ..maxForce = body.mass * 1000
        ..frequencyHz = 10
        ..dampingRatio = 0.0
        ..target.setFrom(body.position)
        ..collideConnected = false
        ..bodyA = parentGame.gameBody
        ..bodyB = body;

      if (mouseJoint == null) {
        // Only create the joint if it doesn't exist
        mouseJoint = MouseJoint(mouseJointDef);
        // Check again if the world is still not locked before creating the joint
        if (!parentGame.world.isLocked) {
          parentGame.world.createJoint(mouseJoint!);
        }
      }

      mouseJoint?.setTarget(position);
    }
  }

  @override
  bool onDragUpdate(DragUpdateInfo info) {
    setPaddlePosition(info.eventPosition.game);
    return false;
  }

  @override
  bool onDragEnd(DragEndInfo info) {
    if (mouseJoint == null) {
      return true;
    }
    body.linearVelocity = body.linearVelocity / 20;
    return false;
  }
}
