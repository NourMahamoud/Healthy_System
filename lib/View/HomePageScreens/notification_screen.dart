import 'package:doctifityapp/View/widgets/more_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/notification_card.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List<Map<String, dynamic>> notifications = [
    {
      "icon": const Icon(Icons.notifications, color: Colors.blue),
      "title": "New Update",
      "content": "Your app has been updated successfully.",
    },
    {
      "icon": const Icon(Icons.warning, color: Colors.orange),
      "title": "Missing Data",
      "content": "Your Information is not complete",
    },
    {
      "icon": const Icon(Icons.message, color: Colors.green),
      "title": "New Message",
      "content": "You have received a new message.",
    },
  ];
  void showNotification(index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Row(
            spacing: 10,
            children: [
              notifications[index]["icon"],
              Text(notifications[index]["title"]),
            ],
          ),
          content: Text(notifications[index]["content"]),
        );
      },
    );
  }

  void deleteNotification(int index) {
    setState(() {
      notifications.removeAt(index);
    });

    final isEmpty = notifications.isEmpty;

    final snackBar = SnackBar(
      duration: const Duration(seconds: 2),
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: isEmpty
                ? [Colors.redAccent, Colors.deepOrange]
                : [Colors.blueAccent, Colors.lightBlue],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(
              isEmpty ? Icons.info_outline : Icons.delete_forever,
              color: Colors.white,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                isEmpty
                    ? "You don't have any notifications"
                    : "Notification Deleted",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    if (isEmpty) {
      Future.delayed(const Duration(milliseconds: 300), () {
        //context.read<NavigationViewModel>().setIndex(0);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MoreAppBar(title: Text("Notification" , style: TextStyle(color: Colors.black , fontWeight: FontWeight.bold , fontSize: 20),), showBack: false),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: ListView.builder(
          itemCount: notifications.length,
          itemBuilder: (context, index) {
            final notif = notifications[index];
            return NotificationCard(
              icon: notif["icon"],
              title: notif["title"],
              content: notif["content"],
              onClick: () {
                showNotification(index);
              },
              onDelete: () {
                deleteNotification(index);
              },
            );
          },
        ),
      ),
    );
  }
}
