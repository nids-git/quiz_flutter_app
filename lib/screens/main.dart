import 'package:flutter/material.dart';
import 'package:quiz_flutter_app/screens/quiz.dart';
import 'package:quiz_flutter_app/screens/splash.dart';

void main(){
  runApp(Quiz());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold();
    /*MaterialApp(
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );*/
  }
}
