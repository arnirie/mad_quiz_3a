import 'package:flutter/material.dart';
import 'package:mad_quiz_3a/components/questions.dart';
import 'package:mad_quiz_3a/components/title_home.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool toPlay = false;

  void startPlay() {
    setState(() {
      toPlay = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFffb31c),
      body: toPlay ? Questions() : TitleHome(startPlay),
    );
  }
}
