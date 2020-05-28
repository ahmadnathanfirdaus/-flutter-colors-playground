import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Play with Colors'),
        centerTitle: true,
      ),
      body: Body(),
    );
  }
}

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int selectedIndex = 0;
  List<String> colors = [
    'Red', 'Green', 'Blue', 'Yellow', 'White'
  ];
  Color selectedColor = Colors.red;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Container(
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: colors.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                          if (colors[index] == 'Red') selectedColor = Colors.red;
                          if (colors[index] == 'Green') selectedColor = Colors.green;
                          if (colors[index] == 'Blue') selectedColor = Colors.blue;
                          if (colors[index] == 'Yellow') selectedColor = Colors.yellow;
                          if (colors[index] == 'White') selectedColor = Colors.white;
                        });
                      },
                      child: Padding(
                        padding:
                        EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                        child: Row(
                          children: <Widget>[
                            Text(colors[index],
                              style: TextStyle(
                                letterSpacing: 1.2,
                                fontSize: 22,
                                color: index == selectedIndex ? selectedColor : Colors.white30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  })),
        ),
        Expanded(
            flex: 3,
            child: Container(
              color: Colors.black,
              child: Center(
                child: Text(
                  'Hello World',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: selectedColor,
                  ),
                ),
              ),
            )
        )
      ],
    );
  }
}
