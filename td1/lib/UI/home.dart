

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../modele/question.dart';
import 'myButtons.dart';

class MyWidget extends StatefulWidget {
  final Color color;
  final double myTextsize;

  const MyWidget(this.color, this.myTextsize);

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  late int _currentQuestion = 0;
  final List _questions = [Question.name("The question number 1 is a very long question and her answer is true.", true, "images/flag.png"),
    Question.name("The question number 2 is true again.", true,
        "images/img.jpg"),
    Question.name("The question number 3 is false.", false, "images/img.jpg"),
    Question.name("The question number 4 is false again.", false,
        "images/flag.png"),
    Question.name("The question number 5 is true.", true, "images/flag.png"),
    Question.name("The question number 6 is true again.", true,
        "images/img.jpg"),];

  _previousQuestion() {
    setState(() {
      _currentQuestion = (_currentQuestion -1)%_questions.length;
    });
  }

  _nextQuestion() {
    setState(() {
      _currentQuestion = (_currentQuestion +1)%_questions.length;
    });
  }

  _changeQuestion(int n){
    setState(() {
      _currentQuestion = (_currentQuestion + n) %_questions.length;
    });
  }

  void _handleValue(bool value) {
    debugPrint(value.toString());
    if (value == _questions[_currentQuestion].isCorrect) {
      debugPrint("good");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
        content: Text("GOOD ANSWER!!!",style: TextStyle(fontSize: 20)),
        duration: Duration(milliseconds: 500),
        backgroundColor: Colors.lightGreen,
        width: 180.0,
        padding: EdgeInsets.symmetric(
        horizontal: 8.0,
        ),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        ),)
      );
    }
    else {
      debugPrint("bad");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
        content: Text("BAD ANSWER!!!",style: TextStyle(fontSize: 20),),
        duration: Duration(milliseconds: 500),
        backgroundColor: Colors.red,
        width: 180.0,
        padding: EdgeInsets.symmetric(
        horizontal: 8.0,
        ),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        ),)
      );
    }
    _nextQuestion();
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle myButtonStyle = ElevatedButton.styleFrom(
        backgroundColor: Colors.blueGrey.shade900,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        )
    );

    return Scaffold(
        appBar: AppBar(
          title: const Text("Quizz App"),
          centerTitle: true,
          backgroundColor: Colors.lightBlue,
        ),
        backgroundColor: widget.color,
        body: NotificationListener<IndexChanged>(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(_questions[_currentQuestion].image, width: 250, height: 180,),
                Container(
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                            color: Colors.black,style: BorderStyle.solid
                        )
                    ),
                    height: 120.0,
                    child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                            _questions[_currentQuestion].questionText,
                            textDirection: TextDirection.ltr,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                              fontSize: widget.myTextsize,
                            )))),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MyIconButton(myIcon: Icons.arrow_back, value: -1),
                      MyTextButton(
                      myText: "TRUE", myValue: true, returnValue: _handleValue),
                      MyTextButton(
                      myText: "FALSE", myValue: false, returnValue: _handleValue),
                    MyIconButton(myIcon: Icons.arrow_forward, value: 1),
                  ],
                ),
              ],
            ),
          ),
              onNotification: (n) {
                _changeQuestion(n.val);
                return true;
    },
        ));
  }
}


