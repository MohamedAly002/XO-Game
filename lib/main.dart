import 'package:flutter/material.dart';
import 'package:xo_game/BoardScreen.dart';

void main(){
  runApp(MaterialApp(
title: 'XO Game',
routes: {
  BoardScreen.routeName:(_)=>BoardScreen(),
},
    initialRoute: BoardScreen.routeName,
  ));
}