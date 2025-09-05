import 'package:flutter/material.dart';

class MoreAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBack;
  final List<Widget>? actions;

  const MoreAppBar({
    super.key,
    required this.title,
    required this.showBack,
    this.actions,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(title, style: TextStyle(color: Colors.black87 , fontSize: 20 , fontWeight: FontWeight.bold)),
        centerTitle: false,
        elevation: 5,
        titleTextStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        leading: showBack
            ? IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.arrow_back),
              )
            : null,
        actions: actions,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
