import 'package:doctifityapp/ModelView/CompleteAcountProvider/CompleteAcountProvider.dart';
import 'package:doctifityapp/utills/ColorCodes.dart';
import 'package:doctifityapp/utills/CostoumWegiet/CoustumeChioce.dart';
import 'package:doctifityapp/utills/CostoumWegiet/CustomTextFormField.dart';
import 'package:doctifityapp/utills/ScreenSize.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:provider/provider.dart';

class CompleteAccountPage extends StatelessWidget {
   CompleteAccountPage({super.key, required this.rule, required this.email, required this.name, required this.id,});

    final  String  rule ;
    final String email ;
    final String name ;
    final String id ;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CompleteAccountProvider(rule: rule, email: email, name: name, id:id ),
      child: const CompleteacountPage(),
    );
  }
}
class CompleteacountPage extends StatelessWidget {
  const CompleteacountPage({super.key});
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CompleteAccountProvider>(context);
    final screenWidth = ScreenSize.width(context);
    final screenHeight = ScreenSize.height(context);
    return Scaffold(
      backgroundColor: App_Colors.offWhite,
      body: SafeArea(
        child: Container(
          color: App_Colors.offWhite,
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                 spacing:screenHeight * 0.02 ,
                children: [
                  Text(
                    'Let`s Complete Your Account',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Visibility(
                    visible: provider.rule == 'Doctor',
                      child:Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.all(screenWidth * 0.05),
                    width: screenWidth *0.9 ,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 4,
                          offset: const Offset(0, 3),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      spacing: screenHeight * 0.04,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(child: Text('Doctor Information' ,style: Theme.of(context).textTheme.titleLarge,)),
                        SizedBox(height: screenHeight * 0.02),
                        Text('your Specialization',style: Theme.of(context).textTheme.displayLarge,),
                        CustomTextFormField (backgroundColor: App_Colors.offWhite,controller: provider.specialization, hintText:'Specialization' ,labelText: 'Input your Specialization',validator: (s){
                          s!.isEmpty ? 'Please Enter Your Specialization'  : null;
                        },),
                        SizedBox(height: screenHeight * 0.02),
                        Text('Clinic Address',style: Theme.of(context).textTheme.displayLarge,),
                        CustomTextFormField (backgroundColor: App_Colors.offWhite,controller: provider.clinicAddress, hintText:'Clinic Address' ,labelText: 'Input your Clinic Address',validator: (val)=>val!.isEmpty ? 'Please Enter Your Clinic Address' : null ,),
                        SizedBox(height: screenHeight * 0.02),
                        Text('Clinic Number',style: Theme.of(context).textTheme.displayLarge,),
                        SizedBox(
                          width: screenWidth * 0.8,
                          child: InternationalPhoneNumberInput(
                            validator: (val)=> val!.isEmpty ? 'Please Enter Your Clinic Number' : null ,
                            textFieldController: provider.clinicNumber,
                            onInputChanged: (PhoneNumber number) {},
                            initialValue:  PhoneNumber(isoCode: 'EG'),
                            inputDecoration: InputDecoration(
                              fillColor: App_Colors.offWhite,
                              filled: true,
                              labelText: 'Clinic Number',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            selectorConfig: const SelectorConfig(
                              selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                            ),
                            ignoreBlank: false,
                          ),
                        ),

                      ],
                    ),

                  ) ),
                  Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.all(screenWidth * 0.05),
                    width: screenWidth *0.9 ,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 4,
                          offset: const Offset(0, 3),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      spacing: screenHeight * 0.04,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(child: Text('Personal Information',style: Theme.of(context).textTheme.titleLarge,),) ,
                        SizedBox(height: screenHeight * 0.02),
                        Text(
                          'Enter Your National Id',
                          style: Theme.of(context).textTheme.displayLarge,
                        ),
                        SizedBox(height: screenHeight *0.02,),
                        CustomTextFormField (backgroundColor: App_Colors.offWhite,controller: provider.nationalId, hintText:'National Id' ,labelText: 'Input your National Id',validator: (val)=>val!.isEmpty ? 'Please Enter Your National Id' : null ,),
                        Text(
                          'Enter Your Phone Number',
                          style: Theme.of(context).textTheme.displayLarge,
                        ),
                        SizedBox(
                          width: screenWidth * 0.8,
                          child: InternationalPhoneNumberInput(
                            validator: (val)=> val!.isEmpty ? 'Please Enter Your Phone Number' : null ,
                            textFieldController: provider.yourPhoneNumber,
                            onInputChanged: (PhoneNumber number) {},
                            initialValue:  PhoneNumber(isoCode: 'EG'),
                            inputDecoration: InputDecoration(
                              fillColor: App_Colors.offWhite,
                              filled: true,
                              labelText: 'Phone Number',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            selectorConfig: const SelectorConfig(
                              selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                            ),
                            ignoreBlank: false,
                          ),
                        ),
                        Text(
                          'Emergency Contact',
                          style: Theme.of(context).textTheme.displayLarge,
                        ),
                        SizedBox(
                          width: screenWidth * 0.8,
                          child: InternationalPhoneNumberInput(
                            textFieldController: provider.emergencyPhoneNumber,
                            onInputChanged: (PhoneNumber number) {},
                            onInputValidated: (bool value) {
                              print(value);
                            },
                            initialValue:  PhoneNumber(isoCode: 'EG'),
                            inputDecoration: InputDecoration(
                              fillColor: App_Colors.offWhite,
                              filled: true,
                              labelText: 'Phone Number',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            selectorConfig: const SelectorConfig(
                              selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                            ),
                            ignoreBlank: false,
                          ),
                        ),
                        Text(
                          'Age ',
                          style: Theme.of(context).textTheme.displayLarge,
                        ),
                        CustomTextFormField (backgroundColor: App_Colors.offWhite,controller: provider.age, hintText:'Age' ,labelText: 'Input your Age',validator: (val)=>val!.isEmpty ? 'Please Enter Your Age' : null ,keyboardType: TextInputType.number,),

                        Text(
                          'Gender ',
                          style: Theme.of(context).textTheme.displayLarge,
                        ),
                        Center(
                          child: SegmentedButton(
                            emptySelectionAllowed: true,
                            multiSelectionEnabled: false,
                            segments: <ButtonSegment<String>>[
                              ButtonSegment<String>(
                                value: 'Male',
                                label: const Text('Male'),
                              ),
                              ButtonSegment<String>(
                                value: 'Female',
                                label: const Text('Female'),
                              ),
                            ],
                            selected: provider.selectedGender != null
                                ? <String>{provider.selectedGender!}
                                : <String>{},
                            onSelectionChanged: (Set<String> newSelection) {
                              if (newSelection.isNotEmpty) {
                                provider.chooseGander(newSelection.first);
                              } else {
                                provider.chooseGander(null);
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  Container(
                    padding: EdgeInsets.all(screenWidth * 0.05),
                    width: screenWidth *0.9 ,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 4,
                          offset: const Offset(0, 3),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      spacing: screenHeight * 0.02,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(child: Text('Health Information',style: Theme.of(context).textTheme.titleLarge,)) ,
                        Text(
                          'Blood Type ',
                          style: Theme.of(context).textTheme.displayLarge,
                        ),
                        SizedBox(
                          width: screenWidth * 0.8,
                          child: MenuAnchor(
                            style: MenuStyle(
                              backgroundColor:  WidgetStatePropertyAll(App_Colors.offWhite,
                              ),
                              minimumSize: WidgetStatePropertyAll(
                                Size(screenWidth * 0.75, screenHeight * 0.05),
                              ),
                            ),
                            menuChildren: [
                              for (var item in provider.bloodType)
                                MenuItemButton(
                                  child: Text(
                                    item,
                                    style: Theme.of(context).textTheme.labelSmall,
                                  ),
                                  onPressed: () {
                                    provider.selectBloodType(item);
                                  },
                                ),
                            ],
                            controller: provider.menuController,
                            child: Container(
                              color: App_Colors.offWhite,
                              child: ListTile(
                                onTap: () {
                                  if (provider.menuController.isOpen) {
                                    provider.menuController.close();
                                  } else {
                                    provider.menuController.open();
                                  }
                                },
                                trailing: Icon(
                                  Icons.arrow_drop_down_sharp,
                                  color: App_Colors.generalColor,
                                ),
                                title: Text(
                                  'Select blood type ',
                                  style: Theme.of(context).textTheme.displayLarge,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Text(
                          'disease',
                          style: Theme.of(context).textTheme.displayLarge,
                        ),
                        SizedBox(
                          width: screenWidth * 0.8,
                          child: Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: List.generate(provider.healthRecords.length, (index) {
                              return Chip(
                                label: Text(
                                  provider.healthRecords[index].condition,
                                  style: Theme.of(context).textTheme.labelSmall,
                                ),
                                deleteIcon: const Icon(Icons.close, size: 16),
                                onDeleted: () => provider.removeHealthRecord(index),
                                backgroundColor: App_Colors.offWhite,
                              );
                            }),
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        SizedBox(
                          width: screenWidth * 0.6,
                          child: ElevatedButton.icon(
                            onPressed: () {
                              provider.addHealthRecord(context);
                            },
                            icon: const Icon(FontAwesomeIcons.notesMedical, size: 18),
                            label: const Text('Add Your disease'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue[50],
                              foregroundColor: Colors.blue[700],
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                        ),
                        Text(
                          'Medicine',
                          style: Theme.of(context).textTheme.displayLarge,
                        ),
                        SizedBox(
                          width: screenWidth * 0.8,
                          child: Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: List.generate(provider.medicineList.length, (index) {
                              return Chip(
                                label: Text(
                                  provider.medicineList[index]['medicine'],
                                  style: Theme.of(context).textTheme.labelSmall,
                                ),
                                deleteIcon: const Icon(Icons.close, size: 16),
                                onDeleted: () => provider.removeMedicine(index),
                                backgroundColor: App_Colors.offWhite,
                              );
                            }),
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        SizedBox(
                          width: screenWidth * 0.6,
                          child: ElevatedButton.icon(
                            onPressed: () {
                              provider.addMedicine(context ) ;
                            },
                            icon: const Icon(FontAwesomeIcons.notesMedical, size: 18),
                            label: const Text('Add Your Medications'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue[50],
                              foregroundColor: Colors.blue[700],
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                        ),
                        ChooseAndWrite(question: 'Are you drink Alchole ?', value: provider.alchol, onChanged: (val){
                          provider.alachol =!provider.alchol ;
                        }) ,

                        ChooseAndWrite(question: 'you Smoker?', value: provider.smoke, onChanged: (val){
                          val ? provider.addHealthRecord(context) : null ;
                          provider.smoke=!provider.smoke ;
                        }),

                      ],
                    ),
                  ),
                  ElevatedButton(onPressed: (){
                    provider.saveData(context);
                  },style: ElevatedButton.styleFrom(
                    backgroundColor: App_Colors.generalColor,
                    foregroundColor: App_Colors.offWhite,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    fixedSize: Size(screenWidth *0.75, screenHeight * 0.05),
                  ), child: const Text("Save"),),
                  SizedBox(height: screenHeight * 0.02),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}