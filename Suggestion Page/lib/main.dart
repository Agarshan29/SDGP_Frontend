import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: AnswerPopup(),
        ),
      ),
    );
  }
}

class AnswerPopup extends StatefulWidget {
  @override
  _AnswerPopupState createState() => _AnswerPopupState();
}

class _AnswerPopupState extends State<AnswerPopup> {
  String message = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'What is your current climate zone?',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0),
            ButtonTheme(
              minWidth: 200.0,
              height: 50.0,
              child: ElevatedButton(
                child: Text('Wet'),
                onPressed: () {
                  setState(() {
                    message = 'Your recommended seeds are Beans and Brinjals';
                  });
                  _showPopup();
                },
              ),
            ),
            SizedBox(height: 10.0),
            ButtonTheme(
              minWidth: 200.0,
              height: 50.0,
              child: ElevatedButton(
                child: Text('Intermediate'),
                onPressed: () {
                  setState(() {
                    message = 'Your recommended seeds are Beetroot and Bittergourd';
                  });
                  _showPopup();
                },
              ),
            ),
            SizedBox(height: 10.0),
            ButtonTheme(
              minWidth: 200.0,
              height: 50.0,
              child: ElevatedButton(
                child: Text('Dry'),
                onPressed: () {
                  setState(() {
                    message = 'Your recommended seeds are Pumpkin and Red Onion';
                  });
                  _showPopup();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showPopup() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Message'),
          content: Text(message),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
