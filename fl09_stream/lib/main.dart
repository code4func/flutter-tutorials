import 'package:fl09_stream/my_bloc.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  MyBloc bloc = new MyBloc();

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bloc.counterStream.listen((data) {
      print(data.toString());
    });

    return Scaffold(
      appBar: AppBar(
        title: Text("STREAM"),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        child: Center(
          child: StreamBuilder(
              stream: bloc.counterStream,
              builder: (context, snapshot) => Text(
                    snapshot.hasData ? snapshot.data.toString() : "0",
                    style: TextStyle(fontSize: 40, color: Colors.amber),
                  )),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          bloc.increment();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class MyText extends StatefulWidget {
  
  String title;
  MyText(this.title)

  @override
  _MyTextState createState() => _MyTextState();
}

class _MyTextState extends State<MyText> {
  @override
  Widget build(BuildContext context) {
    return Text();
  }
}
