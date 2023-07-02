import 'package:flutter/material.dart';
import 'package:web_project/global/widget/global_button.dart';
import 'package:get/get.dart';
import 'package:web_project/module/module_name/views/dashboard/dashboard_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(50),
        child: Row(
          children: [
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/healthCare.jpg"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/images/images.png'),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text('Hello Again!'),
                    SizedBox(
                      height: 20,
                    ),
                    Text('Hello Again CHANGE THE QUALITY OF YOUR LIFE +8801999999999'),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Enter email',
                        labelText: 'Email',
                        labelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.email_outlined)
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Enter password',
                        labelText: 'Password',
                        labelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.lock_outline)
                      ),
                    ),
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        Row(
                          children: [
                            Theme(
                              data: Theme.of(context)
                                  .copyWith(unselectedWidgetColor: Colors.black),
                              child: Checkbox(
                                value: true,
                                activeColor: Colors.blue,
                                checkColor: Colors.black,
                                onChanged: (value) {},
                              ),
                            ),
                            Text(
                              "Remember me",
                            ),
                          ],
                        ),
                        Spacer(),
                        Text('Forget password ?'),
                      ],
                    ),

                    SizedBox(height: 20,),
                    Container(
                      width: 220,
                      child: GlobalButton(
                          onPressed: (){
                            Get.to(()=> MainScreen());
                            //Navigator.push(context, MaterialPageRoute(builder: (context) => MainScreen()));
                          },
                          buttonText: 'Login',
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

