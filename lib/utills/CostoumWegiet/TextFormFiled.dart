import 'package:doctifityapp/utills/ColorCodes.dart';
import 'package:flutter/material.dart';

class CostumTextformfiled extends StatelessWidget {
   CostumTextformfiled({super.key, required this.controller, required this.hintText, required this.labelText, required this.backgroundColor});
   final  TextEditingController controller ;
   final String hintText ;
   final String labelText ;
  final Color backgroundColor  ;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      controller:controller,
      keyboardType: TextInputType.number,
      style: Theme.of(context).textTheme.bodySmall,
      validator: (value) {
        if (value!.isEmpty) {
          return 'This field is required';
        }
        return null; } ,
      decoration: InputDecoration(

        fillColor: backgroundColor,
        filled: true,
        labelText: labelText,
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: backgroundColor,
          ),
        ),
      ),
    );
  }
}
