import 'package:flutter/material.dart';
import 'package:quiz_flutter_app/screens/questions.dart';
import 'package:quiz_flutter_app/screens/results_screen.dart';
import 'package:quiz_flutter_app/screens/splash.dart';

import '../data/questions.dart';

class Quiz extends StatefulWidget{
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();

}

class _QuizState extends State<Quiz>{
 var activeScreen = 'Start-Screen';
 List<String> selectedAnswers = [];

  void switchScreen(){
    setState(() {
      activeScreen = 'Questions-Screen';
    });
  }

  void chooseAnswers(String answer){
    selectedAnswers.add(answer);
    if(selectedAnswers.length == questions.length){
      setState(() {
        activeScreen = 'Results-Screen';
      });
    }
  }

  void restartQuiz(){
    setState(() {
      selectedAnswers = [];
      activeScreen = 'Questions-Screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activeScreenWidget = SplashScreen(switchScreen);
    if(activeScreen == 'Questions-Screen'){
      activeScreenWidget = Questions(onSelectAnswer : chooseAnswers);
    }
    if(activeScreen == 'Results-Screen'){
      activeScreenWidget = ResultsScreen(chosenAnswers: selectedAnswers,
        restartQuiz: restartQuiz,);
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 78, 13, 151),
              Color.fromARGB(255, 107, 15, 168)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight)
          ),
          child: activeScreenWidget,
        ),
      ),
    );
  }

}