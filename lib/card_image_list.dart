import 'package:flutter/cupertino.dart';
import 'package:flutter_app_travel/card_image.dart';

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
          CardImage("assets/images/paisaje1.jpg"),
          CardImage("assets/images/paisaje2.jpg"),
          CardImage("assets/images/paisaje3.jpg"),
          CardImage("assets/images/paisaje4.jpg"),
          CardImage("assets/images/paisaje5.jpg"),
          CardImage("assets/images/paisaje6.jpg"),
        ],
      ),
    );
  }

}