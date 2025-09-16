import 'package:doctifityapp/View/HomePageScreens/Appointments_screen.dart';
import 'package:doctifityapp/View/HomePageScreens/notification_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:doctifityapp/ModelView/HomePageProvider/LogicProviderHomeScreen.dart';

class HomePageScreenProviderBuilder extends StatelessWidget {
   HomePageScreenProviderBuilder({super.key, required this.id});
  final String id ;


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (_)=> LogicProviderHomeScreen(id: id,context: context),
      child: HomePageScreen(),);



  }
}

class HomePageScreen extends StatelessWidget {
  HomePageScreen({super.key});


  @override
  Widget build(BuildContext context) {
    final vm = context.watch<LogicProviderHomeScreen>();

    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 700),
        switchInCurve: Curves.easeInOut,
        switchOutCurve: Curves.easeInOut,
        transitionBuilder: (child, animation) {
          final fade = Tween<double>(begin: 0, end: 1).animate(animation);
          final scale = Tween<double>(begin: 0.8, end: 1.0).animate(
            CurvedAnimation(parent: animation, curve: Curves.easeOut),
          );
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
        child:vm.getChangeScreens() ,
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
            icon: Icon(Icons.bed_outlined),
            label: "Doctors",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: "Hospitals",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "My Account",
          ),
        ],
      ),
    );
  }
}
