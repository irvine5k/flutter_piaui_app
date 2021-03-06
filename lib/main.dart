import 'package:flutter/material.dart';
import 'package:flutter_piaui_app/src/onboarding/onboarding_page.dart';
import 'package:flutter_piaui_app/src/shared/auth/auth_controller.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthController>(
          create: (_) => AuthController(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SeenFirtPage(),
      ),
    );
  }
}
