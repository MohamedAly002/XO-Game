import 'package:flutter/material.dart';

class XObuttons extends StatelessWidget{
  String text;
  Function buttonclick;
  int index;
  XObuttons(this.text,this.buttonclick,this.index);
  @override
  Widget build(BuildContext context) {
   return Expanded(child:
   Container(
     margin: EdgeInsets.all(1),
     child: ElevatedButton(onPressed: (){
       buttonclick(index);

     },
       child: Text('$text',style: const TextStyle(fontSize:32))
       ,),
   )
   );;
  }
}