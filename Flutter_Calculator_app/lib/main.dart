import 'package:flutter/material.dart';

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
      home: MyHomePage(),
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
  var input1controller = TextEditingController();
  var input2controller = TextEditingController();

  var result = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Simple Calculator'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(8),
              child: TextField(
                controller: input1controller,
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: TextField(
                controller: input2controller,
                keyboardType: TextInputType.number,
              ),
            ),
            Wrap(
              spacing: 5,
              runSpacing: 10,
              children: [
                ElevatedButton(
                    onPressed: () {
                      var num1 = int.parse(input1controller.text.toString());
                      var num2 = int.parse(input2controller.text.toString());

                      var sum = num1 + num2;

                      setState(() {
                        result = "The Addition of $num1 and $num2 yeilds $sum";
                      });
                    },
                    child: Text("Addition")),
                ElevatedButton(
                    onPressed: () {
                      var num1 = int.parse(input1controller.text.toString());
                      var num2 = int.parse(input2controller.text.toString());

                      var diff = num1 - num2;

                      setState(() {
                        result =
                            "The Subtraction of $num2 from $num1 yeilds $diff";
                      });
                    },
                    child: Text("Subtract")),
                ElevatedButton(
                    onPressed: () {
                      var num1 = int.parse(input1controller.text.toString());
                      var num2 = int.parse(input2controller.text.toString());

                      var product = num1 * num2;

                      setState(() {
                        result =
                            "The Product of $num1 and $num2 yeilds $product";
                      });
                    },
                    child: Text("Product")),
                ElevatedButton(
                    onPressed: () {
                      var num1 = int.parse(input1controller.text.toString());
                      var num2 = int.parse(input2controller.text.toString());

                      var division = num1 / num2;

                      setState(() {
                        result =
                            "The Division of $num1 and $num2 yeilds ${division.toStringAsFixed(3)}";
                      });
                    },
                    child: Text("Division")),
                ElevatedButton(
                    onPressed: () {
                      var num1 = int.parse(input1controller.text.toString());
                      var num2 = int.parse(input2controller.text.toString());

                      var mod = num1 % num2;

                      setState(() {
                        result = "The Modulous of $num1 and $num2 yeilds $mod";
                      });
                    },
                    child: Text("Modulous")),
              ],
            ),
            Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  result,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
