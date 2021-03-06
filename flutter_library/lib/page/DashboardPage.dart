import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DashboardPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new DashboardPageState();
  }
}

class DashboardPageState extends State<DashboardPage> {
  static const EventChannel eventChannel =
      EventChannel('sample.flutter.io/push_dashboard');

  String _name = 'unknown';

  @override
  void initState() {
    super.initState();
    eventChannel.receiveBroadcastStream().listen(_onEvent, onError: _onError);
  }

  void _onEvent(Object event) {
    setState(() {
      _name = event.toString();
    });
  }

  void _onError(Object error) {
    setState(() {
      _name = 'unknown';
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Text(_name),
      ),
    );
  }
}
