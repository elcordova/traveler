import 'package:flutter/material.dart';
import 'package:flutter_app_travel/Place/ui/widgets/card_image_list.dart';
import 'package:flutter_app_travel/User/bloc/bloc_user.dart';
import 'package:flutter_app_travel/User/model/user.dart';
import 'package:flutter_app_travel/widgets/gradient_back.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class HeaderAppBarHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    UserBloc userBloc;
    userBloc = BlocProvider.of(context);
    return StreamBuilder(
        stream: userBloc.authStatus,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
            case ConnectionState.none:
              return Center(child: CircularProgressIndicator());
            case ConnectionState.active:
            case ConnectionState.done:
              return showPlacesData(snapshot);
            default:
              return showPlacesData(snapshot);
          }
        });
  }

  Widget showPlacesData(AsyncSnapshot snapshot) {
    if (!snapshot.hasData || snapshot.hasError) {
      return Stack(children: [
        GradientBack(height: 250.0),
        Text("Usuario no logeado. Haz Login")
      ]);
    } else {
      User user = User(
          email: snapshot.data.email,
          name: snapshot.data.displayName,
          photo: snapshot.data.photoUrl,
          uid: snapshot.data.uid);
      return Stack(
          children: [GradientBack(height: 250.0), CardImageList(user)]);
    }
  }
}
