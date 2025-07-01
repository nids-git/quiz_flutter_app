import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_flutter_app/common_widget/answer_button.dart';
import 'package:quiz_flutter_app/data/questions.dart';

class Questions extends StatefulWidget{
  const Questions({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<Questions> createState() => _QuestionsState();

}

class _QuestionsState extends State<Questions>{
  var currentIndex = 0;

  void answerQuestion(String selectedAnswer){
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      currentIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentIndex];

    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 35, vertical: 50),
      color: Colors.purple,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                  color: Color.fromARGB(128, 255, 255, 255),
                  fontSize: 24,
                fontWeight: FontWeight.bold
              ),
          textAlign: TextAlign.center,),
          SizedBox(height: 10),
          ...currentQuestion.getShuffledList().map((answer){
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              width: double.infinity,
              child: AnswerButton(answerText: answer, onTap: (){
                answerQuestion(answer);
              }),
            );
          })
          // ListView.builder(
          //   shrinkWrap: true,
          //   itemCount: 4,
          //     itemBuilder: (context, index){
          //   return Container(
          //     margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          //     child: AnswerButton(answerText: "answerText", onTap: ((){
          //
          //     })),
          //   );
          // })
        ],
      ),

    );
  }

}