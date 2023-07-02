import 'package:flutter/material.dart';

import '../../../controller/home_controller.dart';

class DashTabBar extends StatelessWidget {
  const DashTabBar({
    Key? key,
    required this.home,
  }) : super(key: key);

  final HomeController home;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      labelColor: Colors.purple,
        indicatorColor: Colors.purple,
        indicatorSize: TabBarIndicatorSize.label,
        unselectedLabelColor: Colors.black,
      controller: home.tabController,
      tabs: home.myTabs,
    );
  }
}