import 'package:flutter/Material.dart';

class CustomCard extends StatelessWidget {
   CustomCard({super.key, required this.title, required this.icon,required this.onTap});
  final String title;
  final IconData icon;
  Function onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading:  Icon( icon,
          color: Colors.blueAccent,
        ),

        title:  Text(title),
        onTap:() => onTap,
      ),
    );
  }
}
