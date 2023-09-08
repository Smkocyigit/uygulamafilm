import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFF1D1D28),
        appBarTheme: AppBarTheme(

          backgroundColor: Colors.transparent,
          elevation: 0
        ),
      ),
      home: SplashScreen(),
    );
  }
}


