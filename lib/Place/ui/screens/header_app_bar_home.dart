import 'package:flutter/material.dart';
import 'package:flutter_app_travel/Place/ui/widgets/card_image_list.dart';
import 'package:flutter_app_travel/widgets/gradient_back.dart';

class HeaderAppBarHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: <Widget>[
        GradientBack( height: 250.0 ),
        CardImageList()
      ],
    );
  }

}