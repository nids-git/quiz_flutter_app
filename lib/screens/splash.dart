import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../common_widget/widget_text.dart';

class SplashScreen extends StatelessWidget{
  const SplashScreen(this.startQuiz ,{super.key});
 final void Function() startQuiz;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.purple,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/images/quiz_logo.png',
                  width: 300,
                  color: Color.fromARGB(128, 255, 255, 255)),
              SizedBox(height: 80),
              Text("Learn flutter the fun way!", style: GoogleFonts.lato(
                  color: Color.fromARGB(128, 255, 255, 255),
                  fontSize: 24,
                  fontWeight: FontWeight.bold
              ),),
              SizedBox(height: 30),
              OutlinedButton.icon(
                  onPressed: startQuiz,
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white
                ),
                icon: Icon(Icons.arrow_forward, color: Colors.white),
                  label: CommonTextStyling(text:"Start Quiz"),
              ),
            ],
          )
      ),
    );
  }

}