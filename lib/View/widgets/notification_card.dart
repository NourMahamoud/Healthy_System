import 'package:flutter/material.dart';

class NotificationCard extends StatelessWidget {
  final Icon icon;
  final String title;
  final String content;
  final VoidCallback? onClick;
  final VoidCallback? onDelete;

  const NotificationCard({
    super.key,
    required this.icon,
    required this.title,
    required this.content,
    this.onClick,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick ?? () {},
      onDoubleTap: onDelete, // delete on double tap
      child: Card(
        color: Colors.white70,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        elevation: 5,
        child: ListTile(
          title: Text(title),
          subtitle: Text(content),
          leading: icon,
          trailing: IconButton(
            onPressed: onDelete,
            icon: const Icon(Icons.delete, color: Colors.red),
          ),
        ),
      ),
    );
  }
}
