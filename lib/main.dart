import 'package:app_bars/animated_app_bar.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}


/// Simple home page with Card and Text
class MyHomePage extends StatefulWidget {
    @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AnimatedAppBar("Mars News"),
        body: Center(
          child: Card(
            color: Colors.grey[300],
            elevation: 10.0,
            child: Container(
                height: 100.0,
                width: 100.0,
                alignment: Alignment.center,
                child: Text('Hello World!')
            ),
          ),
        )
    );
  }
}



