import 'package:flutter/material.dart';
import 'package:flutter_app_travel/floating_header_button.dart';

class ButtonsProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      children: <Widget>[
        FloatingHeaderButton(Colors.lightGreenAccent, Icon(Icons.bookmark)),
        FloatingHeaderButton(Colors.lightGreenAccent, Icon(Icons.bookmark)),
        FloatingHeaderButton(Colors.lightGreenAccent, Icon(Icons.bookmark)),
        FloatingHeaderButton(Colors.lightGreenAccent, Icon(Icons.bookmark)),
        FloatingHeaderButton(Colors.lightGreenAccent, Icon(Icons.bookmark)),
      ],
    );
  }

}