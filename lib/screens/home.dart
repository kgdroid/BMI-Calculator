import 'package:bmi_calculator/screens/result.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double value = 1;
  int weight = 0;
  int age = 0;

  static const activeCardColor = Colors.lightBlue;
  static const inActiveCardColor = Colors.blueAccent;

  Color maleCard = inActiveCardColor;
  Color femaleCard = inActiveCardColor;

  double bmi(int weight, int value) {
    if (value > 0 && weight > 0) {
      double height = value * .01;
      return weight / (height * height);
    }
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        title: const Text('BMI CALCULATOR'),
      ),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            //Male Female button starts
            width: double.infinity,
            margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      maleCard = activeCardColor;
                      femaleCard = inActiveCardColor;
                    });
                  },
                  child: Container(
                    height: 180,
                    width: 150,
                    decoration: BoxDecoration(
                      color: maleCard,
                      border: Border.all(
                        color: Colors.transparent,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Text(
                          '👨',
                          style: TextStyle(fontSize: 60, shadows: [
                            Shadow(
                                blurRadius: 1.0,
                                color: Colors.black12,
                                offset: Offset(5.0, 6.0))
                          ]),
                        ),
                        Text(
                          'Male',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w300,
                              color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      femaleCard = activeCardColor;
                      maleCard = inActiveCardColor;
                    });
                  },
                  child: Container(
                    height: 180,
                    width: 150,
                    decoration: BoxDecoration(
                      color: femaleCard,
                      border: Border.all(
                        color: Colors.transparent,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Text(
                          '👩',
                          style: TextStyle(fontSize: 60, shadows: [
                            Shadow(
                                blurRadius: 1.0,
                                color: Colors.black12,
                                offset: Offset(5.0, 6.0))
                          ]),
                        ),
                        Text(
                          'Female',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w300,
                              color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ), //MAle Female Ends
          Container(
            // Height starts
            height: 180,
            width: double.infinity,
            margin: const EdgeInsets.only(left: 20.0, right: 20.0),
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              border: Border.all(
                color: Colors.transparent,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  'Height (cm)',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w300),
                ),
                Text(
                  value.round().toString(),
                  style: const TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                //Slider,
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  width: double.infinity,
                  child: CupertinoSlider(
                    value: value,
                    min: 0,
                    max: 250,
                    divisions: 250,
                    activeColor: Colors.redAccent,
                    onChanged: (value) => setState(() => this.value = value),
                  ),
                )
              ],
            ),
          ), //Height Ends
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
            child: Row(
              //Weight and Age
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    border: Border.all(
                      color: Colors.transparent,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //Weight
                    children: [
                      const Text(
                        'Weight',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w300,
                            color: Colors.white),
                      ),
                      Text(
                        weight.toString(),
                        style: const TextStyle(
                            fontSize: 40,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              if (weight > 0) {
                                weight--;
                              }
                              setState(() {
                                weight = weight;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              fixedSize: const Size(50, 50),
                              shape: const CircleBorder(),
                            ),
                            child: const Text(
                              '-',
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              if (weight < 200) {
                                weight++;
                              }
                              setState(() {
                                weight = weight;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              fixedSize: const Size(50, 50),
                              shape: const CircleBorder(),
                            ),
                            child: const Text(
                              '+',
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ), //Weight ends
                //Age starts
                Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    border: Border.all(
                      color: Colors.transparent,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //Weight
                    children: [
                      const Text(
                        'Age',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w300,
                            color: Colors.white),
                      ),
                      Text(
                        age.toString(),
                        style: const TextStyle(
                            fontSize: 40,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              if (age > 0) {
                                age--;
                              }
                              setState(() {
                                age = age;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              fixedSize: const Size(50, 50),
                              shape: const CircleBorder(),
                            ),
                            child: const Text(
                              '-',
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              if (age < 100) {
                                age++;
                              }
                              setState(() {
                                age = age;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              fixedSize: const Size(50, 50),
                              shape: const CircleBorder(),
                            ),
                            child: const Text(
                              '+',
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ), //Age ends
              ],
            ),
          ), // Weight and Age ends
          Container(
            child: TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ResultPage(ans: bmi(weight, value.toInt()))));
              },
              style: TextButton.styleFrom(
                primary: Colors.redAccent,
                backgroundColor: Colors.redAccent,
                padding: const EdgeInsets.all(10.0),
                minimumSize: const Size(double.infinity, 20.0),
              ),
              child: const Text(
                'Calculate',
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
