import 'package:flutter/material.dart';
class FloatingHeaderButton extends StatefulWidget {
  Icon icon;
  Color color;

  FloatingHeaderButton(this.color, this.icon);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FloatingHeaderButton(color, icon);
  }
}

class _FloatingHeaderButton extends State<FloatingHeaderButton>{
  Icon icon;
  Color color;
  _FloatingHeaderButton(Color color, Icon icon);
  void onPressedFav() {
    Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text("icono pulsado"),
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: color,
      mini: false,
      tooltip: "Fav",
      onPressed: onPressedFav,
      child: this.icon
    );
  }

}