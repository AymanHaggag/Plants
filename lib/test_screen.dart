import 'package:flutter/material.dart';
import 'package:green/test_widget.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ClipPath(
        clipper: BirthDayCardClipper(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              Container(
                color: Colors.orangeAccent,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(style: TextStyle(fontSize: 25),"In Flutter, We can easily add the border-related designs by using BoxDecoration. But here I tried to explain the approach for creating a widget with a custom shape where you can wrap any child widget inside, like in the below image."),
                ),

                //Add the child widget....
              ),
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/tropical green leaves elements.png"),
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
