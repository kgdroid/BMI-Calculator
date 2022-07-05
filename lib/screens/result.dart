import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final double ans;

  const ResultPage({Key? key, required this.ans}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String str = '';
    String explain = '';
    Color colorText = Colors.transparent;
    if (ans >= 25.0) {
      str = 'Overweight';
      explain = "You need to excersise";
      colorText = Colors.redAccent;
    } else if (ans >= 18.5 && ans < 25.0) {
      str = 'Normal';
      explain = "Keep it up";
      colorText = Colors.green;
    } else {
      str = 'Underweight';
      explain = "Eat some burgers";
      colorText = Colors.amberAccent;
    }
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Your Result',
            style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
          ),
          Container(
            child: Column(children: [
              Text(
                str,
                style: TextStyle(
                    color: colorText,
                    fontSize: 30,
                    fontWeight: FontWeight.w400),
              ),
              Text(
                ans.toStringAsFixed(2),
                style:
                    const TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
              ),
              Text(
                explain,
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.w300),
              ),
            ]),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: TextButton.styleFrom(
              primary: Colors.redAccent,
              backgroundColor: Colors.redAccent,
              padding: const EdgeInsets.all(10.0),
              minimumSize: const Size(double.infinity, 20.0),
            ),
            child: const Text(
              'Re-Calculate',
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
