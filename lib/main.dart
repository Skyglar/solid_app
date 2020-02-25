import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: Home()
));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Random random = new Random();
  Color _color = Colors.grey;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: GestureDetector(
        onTap: () {
          String color = generateRandomHexColor();
          print('$color');
          setState(() {
            _color = Color(int.parse('$color'));
          });
          print('clicked');
        },
        child: SizedBox.expand(
          child: AnimatedContainer(
            duration: Duration(milliseconds: 700),
            color: _color,
            child: Center(
              child: Text(
                'HELLo THERE',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Starjedi',
                  color: Colors.amber,
                  letterSpacing: 2.5,
                  shadows: [
                    Shadow( // bottomLeft
                        offset: Offset(-1.5, -1.5),
                        color: Colors.black
                    ),
                    Shadow( // bottomRight
                        offset: Offset(1.5, -1.5),
                        color: Colors.black
                    ),
                    Shadow( // topRight
                        offset: Offset(1.5, 1.5),
                        color: Colors.black
                    ),
                    Shadow( // topLeft
                        offset: Offset(-1.5, 1.5),
                        color: Colors.black
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  String generateRandomHexColor(){
    int length = 8;
    String chars = '0123456789ABCDEF';
    String hex = '0x';
    while(length-- > 0) hex += chars[(random.nextInt(16)) | 0];

    return hex;
  }
}