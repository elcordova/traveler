import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_travel/widgets/button_purple.dart';

class Description extends StatelessWidget {
  @override
  String namePlace;
  num start;
  String descriptionPlace;

  Description(this.namePlace, this.start, this.descriptionPlace);

  Widget build(BuildContext context) {
    // TODO: implement build


    final start_half = Container(
      margin: EdgeInsets.only(
          top: 323.0,
          right: 3.0
      ),
      child: Icon(
        Icons.star_half,
        color: Colors.red,
      ),
    );

    final start_border = Container(
      margin: EdgeInsets.only(
        top: 323.0,
        right: 3.0
      ),
      child: Icon(
      Icons.star_border,
      color: Colors.red,
      ),
    );

    final start = Container(
      margin: EdgeInsets.only(
        top: 323.0,
        right: 3.0
      ),
      child: Icon(
          Icons.star,
          color: Colors.red,
      ),
    );

    List<Widget> startsArray(num number) {
      List<Widget> lista = new List.filled(5, start_border);
      for(int i = 0; i < number; i++) {
        lista[i] = start;
      }
      num difference = 5-number;
      bool esEntero = number is int;
      if( difference != 0 && !esEntero ) {
        lista[number.toInt()] = start_half;
      }
      return lista;
    }

    final title_start = Row(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(
            top: 320.0,
            left: 20.0,
            right: 20.0
          ),
          child: Text(
            namePlace,
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.w900,
              fontFamily: 'Lato',
            ),
            textAlign: TextAlign.left,
          ),
        ),
        Row(
          children: startsArray(this.start),
        )

      ],
    );

    final only_text = Container(
      margin: EdgeInsets.only(
        left: 20.0,
        right: 20.0,
        top: 20.0
      ),
      child: Text(
        this.descriptionPlace,
        softWrap: true,
        style: TextStyle(
          fontFamily: "Lato",
          color: Colors.black54,
          fontWeight: FontWeight.w500,
        ),
      ),
    );

    final textDescription = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        title_start,
        only_text,
        ButtonPurple("Navigate")
      ],
    );

    return textDescription;
  }




}