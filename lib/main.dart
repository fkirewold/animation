import 'package:flutter/material.dart';

void main()
{
  runApp(AnimationPage());
}

class AnimationPage extends StatelessWidget {
  const AnimationPage ({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
      ),
    );
  }
}