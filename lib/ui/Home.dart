import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomeState();
  }
}

class HomeState extends State<Home> {
  /*
      Mercury: 0.38
      Venus: 0.91
      Earth: 1.00
      Mars: 0.38
      Jupiter: 2.34
      Saturn: 1.06
      Uranus: 0.92
      Neptune: 1.19
      Pluto: 0.06
      */

  final TextEditingController _weightController = new TextEditingController();

  int radioValue = 0;
  double _weight = 0.0;
  String _planetNameWeight = "";

  void handleRadioValue(int value) {
    setState(() {
      radioValue = value;

      switch (radioValue) {
        case 0:
          _weight = calculateWeight(_weightController.text, 2.34);
          _planetNameWeight = "Weight On Planet Jupiter Is $_weight kg";
          break;

        case 1:
          _weight = calculateWeight(_weightController.text, .38);
          _planetNameWeight = "Weight On Planet Mars Is $_weight kg";
          break;

        case 2:
          _weight = calculateWeight(_weightController.text, .91);
          _planetNameWeight = "Weight On Planet Venus Is $_weight kg";
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Weight On Planet X"),
        centerTitle: true,
        backgroundColor: Colors.black87,
      ),
      backgroundColor: Colors.blueGrey,
      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
          padding: const EdgeInsets.all(2.5),
          children: <Widget>[
            new Image.asset(
              'images/planet.png',
              height: 133.0,
              width: 200.0,
            ),
            new Container(
              margin: const EdgeInsets.all(3.0),
              alignment: Alignment.center,
              child: new Column(
                children: <Widget>[
                  new TextField(
                    controller: _weightController,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                        labelText: 'Your Weight On Earth',
                        hintText: 'In Kilograms',
                        icon: new Icon(Icons.person_outline)),
                  ),
                  new Padding(padding: new EdgeInsets.all(5.0)),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Radio<int>(
                        value: 0,
                        groupValue: radioValue,
                        onChanged: handleRadioValue,
                        activeColor: Colors.orangeAccent,
                      ),
                      new Text(
                        "Jupiter",
                        style: new TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      new Radio<int>(
                          value: 1,
                          groupValue: radioValue,
                          onChanged: handleRadioValue,
                          activeColor: Colors.red),
                      new Text(
                        "Mars",
                        style: new TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      new Radio<int>(
                          value: 2,
                          groupValue: radioValue,
                          onChanged: handleRadioValue,
                          activeColor: Colors.yellowAccent),
                      new Text(
                        "Venus",
                        style: new TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  new Padding(
                    padding: new EdgeInsets.all(15.6),
                  ),
                  new Text(
                    "$_planetNameWeight",
                    style: new TextStyle(
                        color: Colors.yellowAccent,
                        fontSize: 19.4,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  double calculateWeight(String weight, double multiplier) {
    if (int.parse(weight).toString().isNotEmpty && int.parse(weight) > 0) {
      return int.parse(weight) * multiplier;
    } else {
      print("Invalid");

      return int.parse("100") * .38;
    }
  }
}
