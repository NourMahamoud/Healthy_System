import 'package:doctifityapp/ModelView/HomePageProvider/UiProviderHomeScreen.dart';
import 'package:doctifityapp/utills/ImagePath.dart';
import 'package:flutter/Material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
   ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiHomePageProvider>(context) ;
    return Scaffold(
      body: SafeArea(child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            spacing: 10,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(ImagePath.male),
              ) ,
              Text(uiProvider.user.name) ,
              Card(
                elevation: 10,
                color: Colors.white,
                child: ListTile(
                  title: Text('My account '),
                  leading: Icon(Icons.account_circle_outlined),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: (){},
                ),


              ),

              Card(
                elevation: 10,
                color: Colors.white,
                child: ListTile(
                  title: Text('Change Languages '),
                  onTap: (){},
                  leading: Icon(Icons.translate),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),


              ),


              Card(
                elevation: 10,
                color: Colors.white,
                child: ListTile(
                  title: Text('Setting Notification'),
                  leading: Icon(Icons.settings),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
              ),
              Card(
                elevation: 10,
                color: Colors.white,
                child: ListTile(
                  title: Text('Privacy Policy '),
                  leading: Icon(Icons.article_outlined),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
              ),
              Card(
                elevation: 10,
                color: Colors.white,
                child: ListTile(
                  title: Text('Sign out'),
                  leading: Icon(Icons.logout),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: (){
           uiProvider.logOut(context) ;
                  },
                ),

              ),
              Card(
                elevation: 10,
                color: Colors.white,
                child: ListTile(
                  title: Text('delete My Account '),
                  onTap: (){
                    uiProvider.deleteMyAccount(context) ;
                  },
                  leading: Icon(Icons.delete ),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),

              ),
            ],
          ),
        ),
      )),
    );
  }
}
