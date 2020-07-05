import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:flutter_app_travel/User/model/user.dart';
import 'package:flutter_app_travel/platzi_trips_cupertino.dart';
import 'package:flutter_app_travel/widgets/button_green.dart';
import 'package:flutter_app_travel/widgets/gradient_back.dart';
import 'package:flutter_app_travel/User/bloc/bloc_user.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
class SignInScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SignInScreen();
  }
}

class _SignInScreen extends State<SignInScreen> {

  BlocUser userBloc;
  double screenWidth;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    screenWidth = MediaQuery.of(context).size.width;
    userBloc = BlocProvider.of(context);
    return _handlerCurrentSesion();
  }

  Widget _handlerCurrentSesion(){
    return StreamBuilder(
      stream: userBloc.authStatus,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if(!snapshot.hasData || snapshot.hasError){
          return signInGoogleUI();
        } else {
          return PlatziTripsCupertino();
        }
      },
    );
  }

  Widget signInGoogleUI() {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          GradientBack( height: null ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Flexible(
                child: Container(
                  width: screenWidth,
                  child: Text(
                    "Welcome \n This is your travel App",
                    style: TextStyle(
                        fontSize: 37,
                        fontFamily: "Lato",
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
              ButtonGreen( text: "Login with Gmail", onPressed: () {
                userBloc.signOut();
                userBloc.SignIn()
                    .then(
                        (FirebaseUser user){
                          userBloc.updateUserData(User(
                            uid: user.uid,
                            name: user.displayName,
                            email: user.email,
                            photo: user.photoUrl
                          ));
                        });
              }, width: 300.0,
              heigth: 50.0,)
            ],
          )
        ],
      ),
    );
  }
}
