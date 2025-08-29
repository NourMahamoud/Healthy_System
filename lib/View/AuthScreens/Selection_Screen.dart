import 'package:doctifityapp/utills/ImagePath.dart';
import 'package:flutter/material.dart';

class SelectionScreen extends StatefulWidget {
  const SelectionScreen({super.key});

  @override
  State<SelectionScreen> createState() => _SelectionScreenState();
}

class _SelectionScreenState extends State<SelectionScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Container(
          child:SingleChildScrollView(
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("${Image_path().logo}",width: 100,height: 100,),
                  Text('Doctifity',style: Theme.of(context).textTheme.titleMedium,) ,
                ],
              ) ,
              SizedBox(height: 20,),
              Image.asset(Image_path().selection,),
              Text('Welcome to HealthLink',style: Theme.of(context).textTheme.titleLarge,),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text('Your seamless connection to healthcare services and expert care.',maxLines: 2,style:Theme.of(context).textTheme.bodySmall,textAlign: TextAlign.center,),
              ) ,
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Card(
                  color: Colors.white,
                  elevation: 2,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 15,
                    children: [
                    Icon(Icons.person,size: 70,),
                    Text('Register as a Patient',style: Theme.of(context).textTheme.titleLarge,),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text('Access your medical records, book appointments, and manage prescriptions with ease.',style: Theme.of(context).textTheme.bodySmall,maxLines: 3,textAlign: TextAlign.center,),

                    ) ,
                      ElevatedButton(onPressed: (){}, child:  Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 20,
                        children: [
                          Text('Get Started as Patient',style: TextStyle(color: Colors.white,fontSize: 15)) ,
                          Icon(Icons.arrow_forward,color: Colors.white,size: 20,),

                        ],
                      ),style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),

                        ),
                        fixedSize: Size(300, 50),
                      ),) ,
                      SizedBox(height: 10,),



                  ],),

                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Card(
                  color: Colors.white,
                  elevation: 2,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 15,
                    children: [
                      Image.asset(Image_path().doctor_headphone,height: 120,),
                    Text('Join as a Doctor or Staff',style: Theme.of(context).textTheme.titleLarge,),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text('Streamline patient management, collaborate with colleagues, and enhance your practice.',style: Theme.of(context).textTheme.bodySmall,maxLines: 2,textAlign: TextAlign.center,),

                    ) ,
                      ElevatedButton(onPressed: (){}, child:  Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 20,
                        children: [
                          Text('Join as Professional',style: TextStyle(color: Colors.white,fontSize: 15)) ,
                          Icon(Icons.arrow_forward,color: Colors.white,size: 20,),

                        ],
                      ),style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),

                        ),
                        fixedSize: Size(300, 50),
                      ),) ,
                      SizedBox(height: 10,),



                  ],),

                ),
              ),




              ],),
          ),
        ),
      ),
    );
  }
}
