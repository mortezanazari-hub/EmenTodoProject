import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Test> with TickerProviderStateMixin {
  Offset _offset = Offset.zero;
  late AnimationController _animationController;
  late Animation<Offset> _animation = Tween<Offset>(
    begin: Offset(0, 0),
    end: Offset(123, 0),
  ).animate(_animationController);

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = Tween<Offset>(
      begin: Offset(0, 0),
      end: Offset(123, 0),
    ).animate(_animationController);
    _animationController.forward(); // Start the animation automatically
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 350,
          height: 350,
          child: Stack(
            children: [
              Container(
                color: Colors.red,
                width: 200,
                height: 100,
              ),
              ClipRect(
                child: Transform.translate(
                  offset: _animation.value, // Use _animation.value here
                  child: GestureDetector(
                    onPanUpdate: (DragUpdateDetails details) {
                      setState(() {
                        _offset = Offset(
                          _animation.value.dx + details.delta.dx,
                          _animation.value.dy,
                        );
                        if (_offset.dx > 123) {
                          _offset = Offset(123, _offset.dy);
                        } else if (_offset.dx < 0) {
                          _offset = Offset(0, _offset.dy);
                        }
                        _animationController.value = _offset.dx / 123;
                      });
                    },
                    child: Container(
                      color: Colors.green,
                      width: 200,
                      height: 100,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
