import 'package:flutter/cupertino.dart';
class QuestionMap extends StatefulWidget {
  const QuestionMap({Key? key}) : super(key: key);

  @override
  State<QuestionMap> createState() => _QuestionMapState();
}

class _QuestionMapState extends State<QuestionMap> {
  int questionIndex =0;
  void answerQuestion(){
    if(questionIndex==2){

    }else {
      setState(() {
        questionIndex++;
      });
    }
    print(questionsData[questionIndex]);
  }
  var questionsData = [
    {
      'questionText': 'what\`s your favorite color?',
      'answer': ['black','blue','pink']
    },
    {
      'questionText': 'what\`s your favorite animal?',
      'answer': ['tiger','lion','elephant']

    }
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget> [
       Text(
         questionsData[questionIndex]['questionText'] as String,
         textDirection: TextDirection.ltr,

       ),
    //     ...(Text([questionIndex]['answers'] as List<String>)).map({
    // return Question(answerQuestion,answers)
    // }).toList()
      ],
    );
  }
}
