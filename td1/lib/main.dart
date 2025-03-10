import 'package:flutter/material.dart';
import 'UI/home.dart';
import 'modele/question.dart';

void main() {
  runApp(MaterialApp(
      theme: ThemeData(
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey.shade900,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  shape:
                  const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ))
          )),
      debugShowCheckedModeBanner: false,
      title: "Application Quizz",
      home: const
      MyWidget(Colors.teal,22.0)
  ));
}

