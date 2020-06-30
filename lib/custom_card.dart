import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  String pathImage = "/assets/images/laura_lisak.jpeg";
  String name = "Alvarito";
  String fraseCelebre = "mensaje a la nacion";
  bool action = true;
  CustomCard(this.pathImage, this.name, this.fraseCelebre, this.action);

  @override
  Widget build(BuildContext context) {


    final profilePicCard = Container(
      margin: EdgeInsets.only(
        top: 20.0,
        left: 20.0,
      ),
      height: 100.0,
      width: 80.0,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(pathImage)
        )
      ),
    );
    final contentCard = Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(
            left: 10.0,
            top: 5.0
          ),
          child: Text(
            this.name,
            style: TextStyle(
              color: Colors.black87,
              fontSize: 20.0,
              fontWeight: FontWeight.w400
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(
              left: 10.0,
              top: 5.0
          ),
          child: Text(
            this.fraseCelebre,
            style: TextStyle(
                color: Colors.black,
                fontSize: 15.0,
                fontWeight: FontWeight.w900
            ),
          ),
        ),
      ],
    );

    final actionCard = Container(
      height: 40.0,
      width: 40.0,
      margin: EdgeInsets.only(
        left: 70
      ),
      child: Icon(
        Icons.star,
        color: Colors.red,
        size: 50,
      ),
    );

    // TODO: implement build
    return Row(
      children: <Widget>[
        profilePicCard,
        contentCard,
        actionCard
      ],
    );
  }

}