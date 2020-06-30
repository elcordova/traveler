import 'package:flutter/material.dart';
import 'package:flutter_app_travel/card_image_list.dart';
import 'package:flutter_app_travel/gradient_back.dart';
import 'package:flutter_app_travel/top_profile.dart';

class HeaderAppBarProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: <Widget>[
        GradientBack("Perfil"),
        TopProfile(),
      ],
    );
  }

}