import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_piaui_app/src/home/home_page.dart';
import 'package:flutter_piaui_app/src/login/login_page.dart';
import 'package:flutter_piaui_app/src/shared/auth/auth_controller.dart';
import 'package:provider/provider.dart';

class AuthHandlerNavigator extends StatefulWidget {
  @override
  _AuthHandlerNavigatorState createState() => _AuthHandlerNavigatorState();
}

class _AuthHandlerNavigatorState extends State<AuthHandlerNavigator> {
  @override
  Widget build(BuildContext context) {
    final _authController = Provider.of<AuthController>(context);

    return Observer(
      builder: (ctx) {
        if (_authController.authStream.data != null) {
          return Home();
        } else {
          return LoginPage();
        }
      },
    );
  }
}
