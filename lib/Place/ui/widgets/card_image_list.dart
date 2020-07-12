import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_travel/Place/model/place.dart';
import 'package:flutter_app_travel/Place/ui/widgets/card_image_with_fab_icon.dart';
import 'package:flutter_app_travel/User/bloc/bloc_user.dart';
import 'package:flutter_app_travel/User/model/user.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class CardImageList extends StatefulWidget {
  @override
  User currentUser;

  CardImageList(this.currentUser);

  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CardImageList();
  }
}

class _CardImageList extends State<CardImageList> {
  @override
  UserBloc userBloc;
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of<UserBloc>(context);
    // TODO: implement build
    return Container(
        height: 350.0,
        child: StreamBuilder(
          stream: userBloc.placesStream,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
              case ConnectionState.none:
                return CircularProgressIndicator();
              case ConnectionState.active:
              case ConnectionState.done:
                return listViewPlaces(userBloc.buildPlaces(
                    snapshot.data.documents, widget.currentUser));
              default:
            }
          },
        ));
  }

  Widget listViewPlaces(List<Place> places) {
    IconData iconDataLiked = Icons.favorite;
    IconData iconDataLike = Icons.favorite_border;
    return ListView(
        padding: EdgeInsets.all(35),
        scrollDirection: Axis.horizontal,
        children: places.map((place) {
          return CardImageWithFabIcon(
            pathImage: place.urlImage,
            height: 250.0,
            iconData: place.liked ? iconDataLiked : iconDataLike,
            onPressFabIcon: () {
              setLiked(place);
            },
            internet: true,
          );
        }).toList());
  }

  void setLiked(Place place) {
    setState(() {
      place.liked = !place.liked;
      userBloc.likePlace(place, widget.currentUser.uid);
    });
  }
}
