import 'package:flutter/material.dart';

class FloatingActionButtonGreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FloatingActionButtonGreen();
  }

}

class _FloatingActionButtonGreen extends State<FloatingActionButtonGreen> {

  var isFavorite = false;
  void onPressedFav() {
    setState(() {
      isFavorite = !isFavorite;
    });
    String texto = "Quitaste de favoritos";
    if(isFavorite) {
      texto = "Agregaste a tus favoritos";
    }
    Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text(texto),
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Color(0xFF11DA53),
      mini: true,
      tooltip: "Fav",
      onPressed: onPressedFav,
      child: Icon(
        isFavorite ? Icons.favorite :Icons.favorite_border,
      ),
    );
  }

}