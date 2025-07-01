import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_flutter_app/data/questions.dart';
import 'package:quiz_flutter_app/screens/questions_summary.dart';

class ResultsScreen extends StatelessWidget{

  const ResultsScreen({super.key,
    required this.restartQuiz,
    required this.chosenAnswers
  });

  final void Function() restartQuiz;
  final List<String> chosenAnswers;

  List<Map<String, Object>> getSummaryData(){
    final List<Map<String, Object>> summary = [];

    for(var i = 0 ; i<chosenAnswers.length; i++){
      summary.add({
        'question_index' : i,
        'question' : questions[i].text,
        'correct_answer' : questions[i].answers[0],
        'user_answer' : chosenAnswers[i]
      });
    }

    return summary;
  }


  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numberOfQuestions = questions.length;
    final correctAnswers = summaryData.where((data){
      return (data['user_answer'] == data['correct_answer']);
    }).length;

    return  Container(
      height: double.infinity,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 35, vertical: 50),
      color: Colors.purple,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $correctAnswers out of $numberOfQuestions questions correctly!',
              style: GoogleFonts.lato(
                  color: Color.fromARGB(128, 255, 255, 255),
                  fontSize: 24,
                  fontWeight: FontWeight.bold
              ),
              textAlign: TextAlign.center,),
            SizedBox(height: 30),
            QuestionsSummary(questionSummary: summaryData,),
            SizedBox(height: 30),
            TextButton.icon(
                onPressed: restartQuiz,
                icon: Icon(Icons.refresh, size: 20,color: Colors.lightBlue,),
                label: Text('Restart Quiz',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ))
          ],
        ),
      ),

    );
  }

}