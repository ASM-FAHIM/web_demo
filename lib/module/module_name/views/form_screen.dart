import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../global/widget/global_button.dart';

class NewRegister extends StatefulWidget {
  const NewRegister({Key? key}) : super(key: key);

  @override
  State<NewRegister> createState() => _NewRegisterState();
}

class _NewRegisterState extends State<NewRegister> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              //personal info
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Personal Information',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  SingeInfoField(
                    title: 'Patient record number :',
                    hintText: 'Enter number',
                  ),
                  SingeInfoField(
                    title: 'Patient full name :',
                    hintText: 'Enter full name',
                  ),
                  SingeInfoField(
                    title: 'Husband/Father\'s name :',
                    hintText: 'Enter name',
                  ),
                  SingeInfoField(
                    title: 'Select image :',
                    hintText: 'Enter image',
                  ),
                ],
              ),

              SizedBox(
                height: 20,
              ),

              //adress info
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Address Details',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  SingeInfoField(
                    title: 'District :',
                    hintText: 'Enter district',
                  ),
                  SingeInfoField(
                    title: 'Upozilla :',
                    hintText: 'Enter upozilla',
                  ),
                  SingeInfoField(
                    title: 'Union/Ward :',
                    hintText: 'Enter union/word',
                  ),
                  SingeInfoField(
                    title: 'House/Village :',
                    hintText: 'Enter house/village',
                  ),
                ],
              ),

              SizedBox(
                height: 20,
              ),

              //contact info
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Contact',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  SingeInfoField(
                    title: 'Phone #1 :',
                    hintText: 'Enter phone number',
                  ),
                  SingeInfoField(
                    title: 'Phone #2 :',
                    hintText: 'Enter phone number',
                  ),
                  SingeInfoField(
                    title: 'Name of a relative :',
                    hintText: 'Enter name',
                  ),
                ],
              ),

              SizedBox(
                height: 20,
              ),

              //marital info
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Others',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  SingeInfoField(
                    title: 'Marital status :',
                    hintText: 'dropdown should be here',
                  ),
                  SingeInfoField(
                    title: 'Number of children :',
                    hintText: 'Enter no. of child',
                  ),
                  SingeInfoField(
                    title: 'Age :',
                    hintText: 'Enter age',
                  ),
                  SingeInfoField(
                    title: 'Height(cm) :',
                    hintText: 'Enter height(cm)',
                  ),
                  SingeInfoField(
                    title: 'Blood group :',
                    hintText: 'Enter blood group',
                  ),
                  SingeInfoField(
                    title: 'How did you learn about the breast are facility? ',
                    hintText: 'Enter feedback',
                  ),
                  SingeInfoField(
                    title: 'Has anyone in your family had a breast cancer? ',
                    hintText: 'Enter feedback',
                  ),
                  SingeInfoField(
                    title: 'Patient registration date ',
                    hintText: 'Enter date',
                  ),
                  SingeInfoField(
                    title: 'Note ',
                    hintText: 'Enter any other informations',
                  ),
                ],
              ),

              SizedBox(
                height: 20,
              ),

              Container(
                width: 220,
                child: GlobalButton(
                  onPressed: (){
                    Get.snackbar('Success', 'Submitted successfylly');
                    //Navigator.push(context, MaterialPageRoute(builder: (context) => MainScreen()));
                  },
                  buttonText: 'Submit',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SingeInfoField extends StatelessWidget {
  String title;
  String hintText;
  SingeInfoField({
    Key? key,
    required this.title,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        Container(
          width: size.width / 6,
          child: Text(
            title,
            style: TextStyle(fontSize: 16),
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: hintText,
            ),
          ),
        ),
      ],
    );
  }
}
