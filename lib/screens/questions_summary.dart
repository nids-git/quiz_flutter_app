
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class QuestionsSummary extends StatelessWidget{

  const QuestionsSummary({
    super.key,
    required this.questionSummary
  });

  final List<Map<String, Object>> questionSummary;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: questionSummary.map(
              (data){
                return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  CircleAvatar(
                    backgroundColor: data['user_answer']==data['correct_answer'] ? Colors.white : Colors.lightBlue,
                      child: Text(((data['question_index'] as int)+1).toString())),
                  SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(data['question'] as String,
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500,
                          color: Colors.white),
                        textAlign: TextAlign.left,),
                        SizedBox(height: 5),
                        Text('Your Ans-${data['user_answer']}',
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500,
                          color: data['user_answer']==data['correct_answer']
                              ? Colors.white
                              : Colors.lightBlue)),
                        Text('Correct Ans-${data['correct_answer']}',
                        style: TextStyle(
                            color: Colors.greenAccent),),
                        SizedBox(height: 15),
                      ],
                    ),
                  ),
                ]
                );
              }
          ).toList()
        ),
      ),
    );
  }

}