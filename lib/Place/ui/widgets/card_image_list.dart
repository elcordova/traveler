import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_travel/Place/ui/widgets/card_image_with_fab_icon.dart';

class CardImageList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 350.0,
      child: ListView(
        padding: EdgeInsets.all(35),
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          CardImageWithFabIcon(pathImage: "assets/images/paisaje1.jpg", iconData: Icons.favorite_border),
          CardImageWithFabIcon(pathImage: "assets/images/paisaje2.jpg", iconData: Icons.favorite_border),
          CardImageWithFabIcon(pathImage: "assets/images/paisaje3.jpg", iconData: Icons.favorite_border),
          CardImageWithFabIcon(pathImage: "assets/images/paisaje4.jpg", iconData: Icons.favorite_border),
          CardImageWithFabIcon(pathImage: "assets/images/paisaje5.jpg", iconData: Icons.favorite_border),
          CardImageWithFabIcon(pathImage: "assets/images/paisaje6.jpg", iconData: Icons.favorite_border),
        ],
      ),
    );
  }

}