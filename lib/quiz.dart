import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/question_screen.dart';
import 'package:quiz_app/results_screen.dart';
import 'package:quiz_app/start_screen.dart';

const Alignment startAlignment = Alignment.bottomLeft;
const Alignment endAlignment = Alignment.topRight;

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = "start-screen";

  void switchScreen() {
    setState(() {
      activeScreen = "questions-screen";
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = "results-screen";
      });
    }
  }

  void onRestart() {
    setState(() {
      activeScreen = "start-screen";
      selectedAnswers = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == "questions-screen") {
      screenWidget = QuestionScreen(onSelectAnswer: chooseAnswer);
    } else if (activeScreen == "results-screen") {
      screenWidget = ResultsScreen(chosenAnswers: selectedAnswers, onRestart: onRestart,);
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: startAlignment,
                  end: endAlignment,
                  colors: [
                Color.fromARGB(255, 8, 126, 145),
                Color.fromARGB(255, 38, 205, 234)
              ])),
          child: screenWidget,
        ),
      ),
    );
  }
}
