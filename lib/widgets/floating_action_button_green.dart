import 'package:flutter/material.dart';

class FloatingActionButtonGreen extends StatefulWidget {
  final IconData iconData;
  final VoidCallback onPressed;

  FloatingActionButtonGreen({
    this.iconData,
    this.onPressed
  });
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FloatingActionButtonGreen();
  }

}

class _FloatingActionButtonGreen extends State<FloatingActionButtonGreen> {

  var isFavorite = false;
//  void onPressedFav() {
//    setState(() {
//      isFavorite = !isFavorite;
//    });
//    String texto = "Quitaste de favoritos";
//    if(isFavorite) {
//      texto = "Agregaste a tus favoritos";
//    }
//    Scaffold.of(context).showSnackBar(
//        SnackBar(
//          content: Text(texto),
//        )
//    );
//  }
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Color(0xFF11DA53),
      mini: true,
      tooltip: "Fav",
      onPressed: widget.onPressed,
      child: Icon(
        widget.iconData
      ),
      heroTag: null,
    );
  }

}