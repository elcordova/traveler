import 'package:flutter/material.dart';
import 'package:flutter_app_travel/custom_card.dart';

class CustomList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final policianList = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        CustomCard("assets/images/thanos.jpg", "Thanos", "equilibrio perfecto", true),
        CustomCard("assets/images/thanos.jpg", "Thanos", "equilibrio perfecto", true),
        CustomCard("assets/images/thanos.jpg", "Thanos", "equilibrio perfecto", true),
        CustomCard("assets/images/thanos.jpg", "Thanos", "equilibrio perfecto", true),
      ],
    );

    return Stack(
      children: <Widget>[
        policianList,
        Container(
          child: Text("texto"),
        )
      ],
    );
  }
}