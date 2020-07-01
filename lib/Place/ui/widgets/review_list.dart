import 'package:flutter/material.dart';
import 'package:flutter_app_travel/Place/ui/widgets/review.dart';

class ReviewList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final listaCommens = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Review('assets/images/laura_lisak.jpeg', 'Laura Lisak', "1 review 2 comments", "Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Lorem ipsum dolor sit amet, consectetur adipiscing elit."),
        Review('assets/images/pik_ao.jpeg', 'Pik Jochimin', "1 review 2 comments", "Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Lorem ipsum dolor sit amet, consectetur adipiscing elit."),
        Review('assets/images/circle_pop.jpeg', 'Regina Nielsen', "1 review 2 comments", "Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Lorem ipsum dolor sit amet, consectetur adipiscing elit."),
      ],
    );
    return listaCommens;
  }

}