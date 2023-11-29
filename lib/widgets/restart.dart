import 'package:flutter/material.dart';

class AppRestart extends StatefulWidget {
  AppRestart({this.child});

  final Widget? child;

  static void restartApp(BuildContext context) {
    context.findAncestorStateOfType<_AppRestartState>()?.restartApp();
  }

  @override
  State<StatefulWidget> createState() {
    return _AppRestartState();
  }
}

class _AppRestartState extends State<AppRestart> {
  Key key = UniqueKey();

  void restartApp() {
    setState(() {
      key = UniqueKey();
    });
  }


  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: key,
      child: widget.child ?? Container(),
    );
  }
}