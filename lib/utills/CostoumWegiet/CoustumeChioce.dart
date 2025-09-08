import 'package:doctifityapp/utills/ColorCodes.dart';
import 'package:doctifityapp/utills/CostoumWegiet/TextFormFiled.dart';
import 'package:doctifityapp/utills/ScreenSize.dart';
import 'package:flutter/material.dart';

class ChooseAndWrite extends StatelessWidget {
   ChooseAndWrite({super.key, required this.question, required this.hint, required this.label, required this.answerController, required this.isTrue, required this.onChanged});
  final String question ;
  bool isTrue ;
  final String hint ;
  final String label ;
   final TextEditingController answerController ;
   final Function(bool) onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
      Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround ,
      children: [
        Expanded(
          child: Text(
            question,
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        Row(
          children: [
            Text('No') ,
            Switch(value: isTrue, onChanged: (value){
              onChanged(value) ;

            }, activeColor: App_Colors.lightBlue,),
            Text('yes')
          ],
        ) ,
      ],

    ),
        const SizedBox(height: 12),
        Visibility(
          visible: isTrue,
          child: SizedBox(
            width: ScreenSize.width(context) *0.78,
            height: 50,
            child: CostumTextformfiled(controller: answerController, hintText: hint, labelText: label,backgroundColor: App_Colors.offWhite,),
          ),
        ),
      ]);
  }
}
