import 'package:flutter/material.dart';
import 'package:flutter_app_travel/User/bloc/bloc_user.dart';
import 'package:flutter_app_travel/User/model/user.dart';
import 'package:flutter_app_travel/User/ui/screens/profile_header.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'User/ui/widgets/profile_places_list.dart';
import 'User/ui/widgets/profile_background.dart';

class ProfileTrips extends StatelessWidget {
  UserBloc userBloc;

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of<UserBloc>(context);
    return StreamBuilder(
      stream: userBloc.authStatus,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch(snapshot.connectionState) {
          case ConnectionState.waiting:
          case ConnectionState.none:
            return CircularProgressIndicator();
          case ConnectionState.active:
          case ConnectionState.done:
            return showProfileData(snapshot);
          default:
        }
      },
    );


//
  }

  Widget showProfileData(AsyncSnapshot snapshot) {
    List<Widget> container;
    if(snapshot.hasError || !snapshot.hasData){
      container = <Widget>[
        Text("usuario no logeado, Haz login")
      ];
    }else{
      print("Logeado");
      var user = User(
        uid: snapshot.data.uid,
        name: snapshot.data.displayName,
        email: snapshot.data.email,
        photo: snapshot.data.photoUrl
      );
      container = <Widget>[
        ProfileHeader(user: user),
        ProfilePlacesList(user: user)
      ];
    }
    return Stack(
      children: <Widget>[
        ProfileBackground(),
        ListView(
          children: container
        ),
      ],
    );

  }
}
