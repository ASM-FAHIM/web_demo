import 'package:flutter/material.dart';
import 'package:web_project/module/module_name/controller/home_controller.dart';
import 'package:get/get.dart';
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
              flex: 5,
                child: Container(
                  width: double.infinity,
                  height: SizeConfig.screenHeight,
                  color: AppColors.secondaryBg,
                  child: ListView(
                    children: [
                      Column(
                        children: [
                          const Text('Icon with tab'),
                          const Text('Data1'),
                          const Text('Data1'),
                          const Text('Data1'),
                          const Text('Data1'),
                          const Text('Data1'),
                          const Text('Data1'),
                          const Text('Data1'),
                        ],
                      )
                    ],
                  ),
                ),
            ),
            Expanded(
              flex: 15,
                child: Container(
                  width: double.infinity,
                  height: SizeConfig.screenHeight,
                  color: AppColors.secondaryBg,
                  child: Column(
                    children: [
                      DashTabBar(home: home),
                      Container(
                        height: size.height / 1.2,
                        color: Colors.red,
                        child: TabBarView(
                            controller: home.tabController,
                            children: [
                              const LoadScreen(),
                              const FormScreen(),
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



