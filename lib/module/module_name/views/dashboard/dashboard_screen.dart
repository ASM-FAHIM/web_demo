import 'package:flutter/material.dart';
import 'package:web_project/module/module_name/controller/home_controller.dart';
import 'package:get/get.dart';
import 'package:web_project/module/module_name/views/login/login_screen.dart';
import '../../../../constant/size_config.dart';
import '../../../../utils/styles/colors.dart';
import '../cart_screen.dart';
import '../form_screen.dart';
import '../load_screen.dart';
import 'components/dash_tabbar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  HomeController home = Get.put(HomeController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    home.fetchPendingSoList();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
                child: Container(
                  height: SizeConfig.screenHeight,
                  color: AppColors.secondaryBg,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SideBarButton(
                        onTap: (){
                          Get.to(()=> NewRegister());
                        },
                        imagePath: 'assets/images/new-reg.gif',
                        title: 'New register',
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SideBarButton(
                        onTap: (){
                          Get.to(()=> RegisteredPatient());
                        },
                        imagePath: 'assets/images/registered.gif',
                        title: 'Registered patient',
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SideBarButton(
                        onTap: (){
                          Get.offAll(()=> LoginScreen());
                        },
                        imagePath: 'assets/images/plus.jpg',
                        title: 'Logout',
                      ),
                    ],
                  ),
                ),
            ),
            Expanded(
              flex: 16,
                child: Container(
                  width: double.infinity,
                  height: SizeConfig.screenHeight,
                  color: AppColors.secondaryBg,
                  child: Column(
                    children: [
                      DashTabBar(home: home),
                      Container(
                        height: size.height / 1.1,
                        color: Colors.red,
                        child: TabBarView(
                            controller: home.tabController,
                            children: [
                              const NewRegister(),
                              const RegisteredPatient(),
                              const CartScreen(),
                            ],
                        ),
                      ),
                    ],
                  ),
                ),
            ),
          ],
        ),
      ),
    );
  }
}

class SideBarButton extends StatelessWidget {
  String imagePath;
  String title;
  VoidCallback onTap;
  SideBarButton({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Image.asset(imagePath),
          Text(title, style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),),
        ],
      ),
    );
  }
}



