import 'package:flutter/material.dart';
import 'package:torch/torch.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: LampPage(),
    );
  }
}

class LampPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LampPageState();
  }
}

class LampPageState extends State<LampPage> with WidgetsBindingObserver {
  String asset = 'assets/bulb_off.png';
  bool bulb = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: <Widget>[
      Center(
        child: Container(
          color: Color.fromARGB(255, 33, 33, 33),
          child: GestureDetector(
            onTap: () {
              setState(() {
                bulb = !bulb;
              });
              bulb == true ? Torch.turnOn() : Torch.turnOff();
            },
            child: Image.asset(
              bulb == true ? 'assets/bulb_on.png' : 'assets/bulb_off.png',
              width: 100,
            ),
          ),
          alignment: Alignment(0.0, 0.0),
        ),
      ),
      Center(
          child: Container(
        child: Text("www.BERGER-APPS.de",
            maxLines: 1, style: TextStyle(fontSize: 20, color: Colors.white)),
        alignment: Alignment(0.0, 0.3),
      )),
    ]));
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // Torch.turnOff();
//    setState(() {
//      bulb = false;
//    });
    super.didChangeAppLifecycleState(state);
  }
}
