import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Animations',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Animations'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double height = 150;
  double width = 150;

  void _animate() {
    setState(() {
      height = height == 150 ? 250 : 150;
      width = width == 150 ? 250 : 150;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: AnimatedContainer(
        duration: Duration(milliseconds: 1000),
        height: height,
        width: width,
        color: Colors.green,
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: _animate,
        tooltip: 'Play',
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}
