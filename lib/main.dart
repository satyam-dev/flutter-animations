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
  double _bottomOffset = 500;
  double _borderRadiusEnd = 20;

  void _animate() {
    setState(() {
      _bottomOffset = _bottomOffset == 500 ? 0 : 500;
      _borderRadiusEnd = _borderRadiusEnd == 20 ? 100 : 20;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:TweenAnimationBuilder(
        tween: Tween<double>(begin: 20, end: _borderRadiusEnd),
        duration: Duration(seconds: 1),
        curve: Curves.easeInOutBack,
        builder: (_, double value, __) {
          return Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(value), color: Colors.red),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _animate,
        tooltip: 'Play',
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}
