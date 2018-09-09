import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:thisisatest/second_screens.dart';

class CurrentLocation {
  double latitude = 0.0;
  double longitude = 0.0;
}

class FancyFab extends StatefulWidget {
  final Function() onPressed;
  final Function() onTodoPressed;
  final String tooltip;
  final IconData icon;
  final Function() onRefresh;
  final CurrentLocation current;

  FancyFab({this.onPressed, this.onTodoPressed, this.tooltip, this.icon, this.onRefresh, this.current});

  @override
  _FancyFabState createState() => _FancyFabState();
}

class _FancyFabState extends State<FancyFab>
    with SingleTickerProviderStateMixin {
  bool isOpened = false;
  AnimationController _animationController;
  Animation<Color> _buttonColor;
  Animation<double> _animateIcon;
  Animation<double> _translateButton;
  Curve _curve = Curves.easeOut;
  double _fabHeight = 56.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Transform(
          transform: Matrix4.translationValues(
            0.0,
            _translateButton.value * 3.0,
            0.0,
          ),
          child: addplace(),
        ),
        Transform(
          transform: Matrix4.translationValues(
            0.0,
            _translateButton.value * 2.0,
            0.0,
          ),
          child: addtodo(),
        ),
        Transform(
          transform: Matrix4.translationValues(
            0.0,
            _translateButton.value,
            0.0,
          ),
          child: refresh(),
        ),
        toggle(),
      ],
    );
  }

  @override
  initState() {
    _animationController =
    AnimationController(vsync: this, duration: Duration(milliseconds: 500))
      ..addListener(() {
        setState(() {});
      });
    _animateIcon =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
    _buttonColor = ColorTween(
      begin: new Color(0xFF6D4C41),
      end: new Color(0xFF7CB342),
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.00,
        1.00,
        curve: Curves.linear,
      ),
    ));
    _translateButton = Tween<double>(
      begin: _fabHeight,
      end: -14.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.0,
        0.75,
        curve: _curve,
      ),
    ));
    super.initState();
  }

  @override
  dispose() {
    _animationController.dispose();
    super.dispose();
  }

  animate() {
    if (!isOpened) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
    isOpened = !isOpened;
  }

  Widget addplace() {
    return Container(
      child: FloatingActionButton(
        backgroundColor: new Color(0xFFFFA000),
        onPressed: this.widget.onPressed,//Navigator.push(context, MaterialPageRoute(builder: (context) => SecondScreen())),
      elevation: 10.0,
        child: Icon(Icons.add_location),
        heroTag: null,
      ),
    );
  }

  Widget addtodo() {
    return Container(
      child: FloatingActionButton(
        backgroundColor: new Color(0xFFFFA000),
        onPressed: this.widget.onTodoPressed,
        elevation: 10.0,
        child: Icon(Icons.add),
        heroTag: null,
      ),
    );
  }

  Widget refresh() {
    return Container(
      child: FloatingActionButton(
        backgroundColor: new Color(0xFFFFA000),
        onPressed: this.widget.onRefresh,
        elevation: 10.0,
        child: Icon(Icons.refresh),
        heroTag: null,
      ),
    );
  }

  Widget toggle() {
    return Container(
      child: FloatingActionButton(
        backgroundColor: _buttonColor.value,
        onPressed: animate,
        child: AnimatedIcon(
          icon: AnimatedIcons.menu_close,
          progress: _animateIcon,
        ),
      ),
    );
  }

  launchurl_todo() async {
    const url =
        'https://docs.google.com/forms/d/e/1FAIpQLSebQcXWRiB9FuwVLM9LF5-Jv658ZCn4zoHuOD1qVkk9ITOqRQ/viewform';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'URL $url へいけませんでした';
    }
  }
}

