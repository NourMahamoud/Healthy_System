import 'package:doctifityapp/View/screens/main_screens/doctors_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_model/navigation_view_model.dart' show NavigationViewModel;
import 'main_screens/hosoitals_screen.dart';
import 'main_screens/home_screen.dart';
import 'main_screens/notification_screen.dart';

class MainNavigation extends StatelessWidget {
  const MainNavigation({super.key});

  final List<Widget> _screens = const [
    HomeScreen(),
    HospitalsScreen(),
    DoctorsScreen(),
    NotificationScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<NavigationViewModel>();

    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 700),
        switchInCurve: Curves.easeInOut,
        switchOutCurve: Curves.easeInOut,
        transitionBuilder: (child, animation) {
          final fade = Tween<double>(begin: 0, end: 1).animate(animation);
          final scale = Tween<double>(
            begin: 0.8,
            end: 1.0,
          ).animate(CurvedAnimation(parent: animation, curve: Curves.easeOut));
          final rotate = Tween<double>(begin: 0.1, end: 0).animate(animation);
          final slide = Tween<Offset>(
            begin: const Offset(0.3, 0.2),
            end: Offset.zero,
          ).animate(CurvedAnimation(parent: animation, curve: Curves.easeOut));

          return FadeTransition(
            opacity: fade,
            child: SlideTransition(
              position: slide,
              child: ScaleTransition(
                scale: scale,
                child: RotationTransition(turns: rotate, child: child),
              ),
            ),
          );
        },
        child: _screens[vm.currentIndex],
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: vm.currentIndex,
        onTap: (index) => vm.setIndex(index),
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        elevation: 15,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "Home"),

          BottomNavigationBarItem(
            icon: Icon(Icons.local_hospital_rounded),
            label: "Hospitals",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.medical_information_rounded),
            label: "Doctors",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: "Notifications",
          ),
        ],
      ),
    );
  }
}
