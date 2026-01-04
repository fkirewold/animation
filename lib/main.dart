import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: ScaleDemo()));
}

class ScaleDemo extends StatefulWidget {
  const ScaleDemo({super.key});
  @override
  ScaleDemoState createState() => ScaleDemoState();
}

class ScaleDemoState extends State<ScaleDemo>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0.5, end: 1.5)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scale Animation')),
      body: Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Transform.scale(
              scale: _animation.value,
              child: child,
            );
          },
          child: GestureDetector(
            onTap: () {
              if (_controller.status == AnimationStatus.completed) {
                _controller.reverse();
              } else {
                _controller.forward();
              }
            },
            child: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.blue,
              child: Icon(
                _controller.status == AnimationStatus.completed
                    ? Icons.pause
                    : Icons.play_arrow,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
