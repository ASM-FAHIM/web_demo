import 'package:flutter/material.dart';
        import 'package:web_project/module/module_name/views/login/login_screen.dart';

enum AppRoutes {
  dashboard,
  
}

extension AppRoutesExtention on AppRoutes {
  Widget buildWidget<T extends Object>({T? arguments}) {
    switch (this) {
      case AppRoutes.dashboard:
        return LoginScreen();
    
    }
  }
}

