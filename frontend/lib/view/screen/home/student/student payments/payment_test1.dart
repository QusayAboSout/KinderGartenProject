import 'package:flutter/material.dart';


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late OverlayEntry _overlayEntry;

  @override
  void initState() {
    super.initState();
    // Show Overlay when the app starts
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _overlayEntry = _createOverlayEntry();
      Overlay.of(context)!.insert(_overlayEntry);
    });
  }

  @override
  void dispose() {
    _overlayEntry.remove();
    super.dispose();
  }

  OverlayEntry _createOverlayEntry() {
    return OverlayEntry(
      builder: (BuildContext context) {
        return Positioned(
          top: 50.0,
          left: 50.0,
          child: Container(
            padding: EdgeInsets.all(16.0),
            color: Colors.white,
            child: Text(
              'This is the message you want to show.',
              style: TextStyle(fontSize: 18.0),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My App'),
      ),
      body: Center(
        child: Text('Hello World!'),
      ),
    );
  }
}
