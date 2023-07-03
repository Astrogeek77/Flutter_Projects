import 'package:flutter/material.dart';
import 'package:splashscreen/Splash_Screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const String _title = 'Flutter Stateful Clicker Counter';
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.
  // This class is the configuration for the state.
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // parametrs for BMI App
  var weightController = TextEditingController();
  var heightController = TextEditingController();

  var bgColor = Colors.cyan.shade100;
  var result = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI Calculator'),
        ),
        body: Center(
          child: Container(
              width: double.infinity,
              height: double.infinity,
              color: bgColor,
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // Text("Hello "),
                    // Text("Flutter!",
                    //     style: TextStyle(
                    //         fontSize: 30,
                    //         fontWeight: FontWeight.bold,
                    //         color: Colors.amber)),

                    Text("Health is Wealth!",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87)),
                    Container(
                      height: 40,
                    ),
                    TextField(
                      controller: weightController,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11),
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 2,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11),
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 2,
                          ),
                        ),
                        label: Text("Weight (in Kg)",
                            style: TextStyle(color: Colors.black)),
                        prefixIcon:
                            Icon(Icons.line_weight, color: Colors.black),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    Container(
                      height: 20,
                    ),
                    TextField(
                      controller: heightController,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11),
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 2,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11),
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 2,
                          ),
                        ),
                        label: Text("Height (in cm)",
                            style: TextStyle(color: Colors.black)),
                        prefixIcon: Icon(Icons.height, color: Colors.black),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    Container(
                      height: 20,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          var weight = weightController.text.toString();
                          var height = heightController.text.toString();

                          // check if any feild is null or empty
                          if ((weight != "") && (height != "")) {
                            var iW = int.parse(weight);
                            var iH = int.parse(height);

                            var mH = iH / 100;
                            var bmi = iW / (mH * mH);

                            var msg = "";

                            if (bmi < 16) {
                              msg = "You have Severely Thin!!";
                              bgColor = Colors.orange.shade300;
                            } else if (bmi >= 16 && bmi < 18.5) {
                              msg = "You are underweight!";
                              bgColor = Colors.orange.shade100;
                            } else if (bmi >= 18.5 && bmi < 25) {
                              msg = "You are Normal and Healthy! :)";
                              bgColor = Colors.green.shade200;
                            } else if (bmi > 25 && bmi < 40) {
                              msg = "You are OverWeight!";
                              bgColor = Colors.red.shade100;
                            } else {
                              msg = "You have Severly Obese!!";
                              bgColor = Colors.red.shade300;
                            }

                            result =
                                "$msg \n Your Calculated BMI is ${bmi.toStringAsFixed(3)}.";
                            setState(() {});
                          } else {
                            result =
                                "Please Enter all the Required Feilds with valid values";
                            setState(() {});
                          }
                        },
                        child: Text(
                          "Calculate",
                        )),
                    Container(
                      height: 20,
                    ),
                    Text(
                      result,
                      style: TextStyle(fontSize: 25, color: Colors.black87),
                    )
                  ],
                ),
              )),
        ));
  }
}
