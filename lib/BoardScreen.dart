import 'package:flutter/material.dart';
import 'package:xo_game/XObuttons.dart';

class BoardScreen extends StatefulWidget{
  static const String routeName='boardscreen';
  @override
  State<BoardScreen> createState() => _BoardScreenState();
}

class _BoardScreenState extends State<BoardScreen> {
  List<String>boardstate=[
    '','','',
    '','','',
    '','','',];
  int Player1Score=0;
  int Player2Score=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('XO Game'),
      ),
      body: Column(children: [
        Expanded(
          child: Container(
            child: Row(children: [
              Expanded(
                child: Column(children: [
                  Text('player 1(X)',style: TextStyle(fontSize: 30),),
                  Text('score: $Player1Score',style: TextStyle(fontSize: 30),),

                ],),
              ),
              Expanded(
                child: Column(children: [
                  Text('player 2(O)',style: TextStyle(fontSize: 30),),
                  Text('score: $Player2Score ',style: TextStyle(fontSize: 30),),
                ],),
              )
            ],),
          ),
        ),
       Expanded(
         child: Row(
           crossAxisAlignment: CrossAxisAlignment.stretch,
           children: [
             XObuttons(boardstate[0],OnPlayerClick,0),
             XObuttons(boardstate[1],OnPlayerClick,1),
             XObuttons(boardstate[2],OnPlayerClick,2),

         ],),
       ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              XObuttons(boardstate[3],OnPlayerClick,3),
              XObuttons(boardstate[4],OnPlayerClick,4),
              XObuttons(boardstate[5],OnPlayerClick,5),

            ],),
        ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              XObuttons(boardstate[6],OnPlayerClick,6),
              XObuttons(boardstate[7],OnPlayerClick,7),
              XObuttons(boardstate[8],OnPlayerClick,8)

            ],),
        ),
      ],),



    );
  }
  int counter=0;
  void OnPlayerClick(int index){
    if(boardstate[index].isNotEmpty){
      return;
    }
    if(counter%2==0){
      boardstate[index]='X';
    }
    else{
      boardstate[index]='O';
    }
    counter++;

    if(CheckWinner('X')){
      Player1Score++;
      Resetboard();
    }

     else if(CheckWinner('O')){
       Player2Score++;
       Resetboard();
    }
    else if(counter==9){
      Resetboard();
    }
   setState(() {});
  }

void Resetboard(){
  boardstate=[
    '','','',
    '','','',
    '','','',];
  counter=0;
  setState(() {

  });
}

  bool CheckWinner(String playersympol){
    //rows
   for(int i=0;i<9;i+=3){
     if(boardstate[i]==playersympol &&
         boardstate[i+1]==playersympol &&
         boardstate[i+2]==playersympol ){
       return true;
     }
   }
   //columns
   for(int i=0;i<3;i++){
     if(boardstate[i]==playersympol &&
         boardstate[i+3]==playersympol &&
         boardstate[i+6]==playersympol ){
       return true;
     }
   }

   if(boardstate[0]==playersympol &&
       boardstate[4]==playersympol &&
       boardstate[8]==playersympol ){
     return true;
   }
   if(boardstate[2]==playersympol &&
       boardstate[4]==playersympol &&
       boardstate[6]==playersympol ){
     return true;
   }
   return false;
  }


}