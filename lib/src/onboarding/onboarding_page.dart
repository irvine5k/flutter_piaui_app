import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_piaui_app/src/auth/auth_handler_navigator.dart';
import 'package:flutter_piaui_app/src/shared/colors.dart';
import 'package:intro_views_flutter/Models/page_view_model.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingPage extends StatelessWidget {
  final pages = [
    PageViewModel(
      pageColor: Color(0xF6F6F7FF),
      bubbleBackgroundColor: AppColors.primaryColor,
      title: Container(),
      body: Column(
        children: <Widget>[
          Text('Construir aplicativos'),
          Text(
            'De forma rápida e fácil com Flutter',
            style: TextStyle(color: Colors.black54, fontSize: 16.0),
          ),
        ],
      ),
      mainImage: Image.asset(
        'assets/board1.png',
        alignment: Alignment.center,
      ),
      textStyle: TextStyle(color: Colors.black),
    ),
    PageViewModel(
      pageColor: Color(0xF6F6F7FF),
      iconColor: null,
      bubbleBackgroundColor: AppColors.primaryColor,
      title: Container(),
      body: Column(
        children: <Widget>[
          Text('A comunidade do Piauí'),
          Text(
            'Encontros mensais para compartilhar conhecimento.',
            style: TextStyle(color: Colors.black54, fontSize: 16.0),
          ),
        ],
      ),
      mainImage: Image.asset(
        'assets/board2.png',
        alignment: Alignment.center,
      ),
      textStyle: TextStyle(color: Colors.black),
    ),
    PageViewModel(
      pageColor: Color(0xF6F6F7FF),
      iconColor: null,
      bubbleBackgroundColor: AppColors.primaryColor,
      title: Container(),
      body: Column(
        children: <Widget>[
          Text('Flutter Piauí'),
          Text(
            'Entre nessa você também e vamos fazer referência juntos.',
            style: TextStyle(color: Colors.black54, fontSize: 16.0),
          ),
        ],
      ),
      mainImage: Image.asset(
        'assets/board3.png',
        alignment: Alignment.center,
      ),
      textStyle: TextStyle(color: Colors.black),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            IntroViewsFlutter(
              pages,
              onTapDoneButton: () {
                Navigator.pushReplacement(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => AuthHandlerNavigator(),
                  ),
                );
              },
              showSkipButton: false,
              doneText: Text(
                "Começar",
              ),
              pageButtonsColor: AppColors.primaryColor,
              pageButtonTextStyles: TextStyle(
                // color: Colors.indigo,
                fontSize: 16.0,
                fontFamily: "Regular",
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SeenFirtPage extends StatefulWidget {
  @override
  _SeenFirtPageState createState() => _SeenFirtPageState();
}

class _SeenFirtPageState extends State<SeenFirtPage> {
  Future _checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);

    if (_seen) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => AuthHandlerNavigator()));
    } else {
      await prefs.setBool('seen', true);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => OnboardingPage()));
    }
  }

  @override
  void initState() {
    _checkFirstSeen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryColor,
    );
  }
}
