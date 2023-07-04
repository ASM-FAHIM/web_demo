import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import '../../../global/widget/global_button.dart';

class NewRegister extends StatefulWidget {
  const NewRegister({Key? key}) : super(key: key);

  @override
  State<NewRegister> createState() => _NewRegisterState();
}

class _NewRegisterState extends State<NewRegister> {
  late Uint8List selectedImgInBytes;
  String selectedFile = '';
  late XFile file;
  List<Uint8List> pickedImagesInBytes = [];
  List<String> imageUrls = [];
  int imageCounts = 0;

  _selectFile(bool imageFrom) async {
    FilePickerResult? fileResult =
    await FilePicker.platform.pickFiles(allowMultiple: true);

    if (fileResult != null) {
      selectedFile = fileResult.files.first.name;
      fileResult.files.forEach((element) {
        setState(() {
          pickedImagesInBytes.add(element.bytes!);
          selectedImgInBytes = fileResult.files.first.bytes!;
          imageCounts += 1;
        });
      });
    }
    print(selectedFile);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              //personal info
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Personal Information',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
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
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Container(
                        width: size.width / 6,
                        child: const Text(
                          'Profile image :',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      const SizedBox(width: 10),
                      SizedBox(
                        height: size.height / 24,
                        width: size.width / 10,
                        child: ElevatedButton(
                          onPressed: () {
                            debugPrint('Image clicked');
                            _selectFile(true);
                          },
                          style:
                          ElevatedButton.styleFrom(primary: const Color(0xffECF0E6)),
                          child: const Text(
                            'Choose File',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Container(
                          child: Text(
                            selectedFile == '' ? 'No image selected' : selectedFile,
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),

              const SizedBox(
                height: 20,
              ),

              //adress info
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Address Details',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
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

              const SizedBox(
                height: 20,
              ),

              //contact info
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Contact',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
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

              const SizedBox(
                height: 20,
              ),

              //marital info
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Others',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
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

              const SizedBox(
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
            style: const TextStyle(fontSize: 16),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: TextFormField(
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: hintText,
            ),
          ),
        ),
      ],
    );
  }
}
