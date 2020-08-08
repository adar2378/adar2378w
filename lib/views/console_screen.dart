import 'package:flutter/material.dart';

class ConsoleScreen extends StatefulWidget {
  @override
  _ConsoleScreenState createState() => _ConsoleScreenState();
}

class _ConsoleScreenState extends State<ConsoleScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Welcome", style: TextStyle(
        fontFamily: "Press Start 2P"
      ),),
    );
  }
}