import 'package:flutter/material.dart';

class MoreAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;
  final bool showBack;
  final List<Widget>? actions;
  final Color? backGroundColor;
  final Color? showBackColor;

  const MoreAppBar({
    super.key,
    required this.title,
    required this.showBack,
    this.actions,
    this.backGroundColor,
    this.showBackColor,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backGroundColor ?? Colors.white,
        title: title, 
        centerTitle: false,
        elevation: 5,
        titleTextStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        leading: showBack
            ? IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.arrow_back , color: showBackColor,),
              )
            : null,
        actions: actions,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
