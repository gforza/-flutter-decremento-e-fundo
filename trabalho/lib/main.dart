import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  Color _backgroundColor = Colors.white;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
    debugPrint("Botão de decremento pressionado");
  }

  void _changeBackgroundColor() {
    List<Color> colors = [Colors.red, Colors.green, Colors.blue, Colors.yellow, Colors.purple, Colors.orange];
    setState(() {
      _backgroundColor = colors[Random().nextInt(colors.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contador Flutter'),
      ),
      body: Container(
        color: _backgroundColor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Valor atual:',
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              if (_counter > 10)
                Text(
                  'Número máximo ultrapassado!',
                  style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                ),
              Container(
                padding: EdgeInsets.all(10),
                color: Colors.grey[200],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: _incrementCounter,
                      child: Text('+'),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: _decrementCounter,
                      child: Text('-'),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _changeBackgroundColor,
                child: Text('Mudar Cor de Fundo'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
