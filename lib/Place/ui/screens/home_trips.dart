import 'package:flutter/material.dart';
import 'package:flutter_app_travel/Place/ui/widgets/review_list.dart';

import '../widgets/description_place.dart';
import 'header_app_bar_home.dart';
class HomeTrips extends StatelessWidget {

  final String descriptionDummy = "Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a. Sed porttitor lectus nibh. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Proin eget tortor risus. Lorem ipsum dolor sit amet, consectetur adipiscing elit.";


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: <Widget>[
        ListView(
          children: <Widget>[
            Description("Machala", 1.1, descriptionDummy),
            ReviewList()
          ],
        ),
        HeaderAppBarHome()
      ],
    );
  }

}