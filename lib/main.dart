import 'package:flutter/material.dart';
import 'package:flutter_calculator/buttons.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

 const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

    final List<String> buttons = [
    'C', 'DEL', '%', '/',
    '9', '8', '7', '*',
    '6', '5', '4', '-',
    '3', '2', '1', '+',
    '0', '.', 'ANS', '=', 
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: Column(
        children: [
          Expanded(child: Container(

            )
          ),
          Expanded(
            flex: 2,
            child: Container(
                child: GridView.builder(
                  itemCount: buttons.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
                  itemBuilder: (BuildContext context, int index){
                  if(index == 0){
                    return MyButton(
                      color: Colors.green,
                      textColor: Colors.white,
                      buttonText: buttons[index],
                    );
                  }
                  else if(index == 1){
                    return MyButton(
                      color: Colors.red,
                      textColor: Colors.white,
                      buttonText: buttons[index],
                    );
                  } else {
                    return MyButton(
                    color: isOperator(buttons[index]) ? Colors.deepPurple : Colors.deepPurple[50],
                    textColor: isOperator(buttons[index]) ? Colors.white : Colors.deepPurple, 
                    buttonText: buttons[index],
                  );
                  }
                  
                }),
              )
          ),
        ],
      ),
    );
  }

  bool isOperator(String x){
    if(x == '%' || x == '/' || x == '*' || x == '-' || x == '+' || x == '='){
      return true;
    }
    return false;
  }

}
