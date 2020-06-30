import 'package:flutter/material.dart';
import 'package:flutter_app_travel/buttons_profile.dart';
import 'package:flutter_app_travel/review.dart';
class TopProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          height: 100.0,
          margin: EdgeInsets.only(
            top: 70.0,
            left: 10.0
          ),
          child: Review('assets/images/pik_ao.jpeg', 'Laura Sisulak', "elcordova@hey.com", ''),
        ),
        ButtonsProfile(),
      ],
    );
  }

}