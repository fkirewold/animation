import 'package:flutter/material.dart';

void main()
{
  runApp(AnimationPage());
}

class AnimationPage extends StatefulWidget {
  const AnimationPage ({super.key});

  @override
  State<AnimationPage> createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller=AnimationController(vsync:this ,duration: const Duration(seconds:1));
    animation=Tween<double>(begin: 0,end: 300).animate(controller)
    ..addListener(
      (){
        setState(() {
          
        });
      }
    );
    controller.forward();

  }

@override
  void dispose() {
   super.dispose();
   controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body:Center(
          child: Container(
            height: animation.value,
            width: animation.value,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}