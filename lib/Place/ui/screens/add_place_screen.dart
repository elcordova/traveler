import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_travel/Place/model/place.dart';
import 'package:flutter_app_travel/Place/ui/widgets/card_image_with_fab_icon.dart';
import 'package:flutter_app_travel/Place/ui/widgets/text_input_location.dart';
import 'package:flutter_app_travel/User/bloc/bloc_user.dart';
import 'package:flutter_app_travel/widgets/button_purple.dart';
import 'package:flutter_app_travel/widgets/gradient_back.dart';
import 'package:flutter_app_travel/widgets/text_input.dart';
import 'package:flutter_app_travel/widgets/title_header.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class AddPlaceScreen extends StatefulWidget {
  File imageFile;

  AddPlaceScreen({this.imageFile});

  @override
  State<StatefulWidget> createState() {
    return _AddPlaceScreen();
  }
}

class _AddPlaceScreen extends State<AddPlaceScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final userBloc = BlocProvider.of<UserBloc>(context);
    final _controllerTitlePlace = TextEditingController();
    final _controllerDescriptionPlace = TextEditingController();

    return Scaffold(
      body: Stack(
        children: <Widget>[
          GradientBack(height: 300.0),
          Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(
                  top: 25.0,
                  left: 25.0,
                ),
                child: SizedBox(
                  height: 45.0,
                  width: 45.0,
                  child: IconButton(
                    icon: Icon(Icons.keyboard_arrow_left,
                        color: Colors.white, size: 45),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
              Flexible(
                  child: Container(
                padding: EdgeInsets.only(top: 45.0, left: 20.0, right: 10.0),
                child: TitleHeader(title: "Add a new Place"),
              )),
            ],
          ),
          Container(
            margin: EdgeInsets.only(
              top: 120.0,
              bottom: 20,
            ),
            child: ListView(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  child: CardImageWithFabIcon(
                    pathImage: widget.imageFile.path,
                    iconData: Icons.camera_alt,
                    width: 350.0,
                    height: 250.0,
                    left: 0,
                    onPressFabIcon: null,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                  child: TextInput(
                    hintText: "Title",
                    inputType: null,
                    controller: _controllerTitlePlace,
                    maxLines: 1,
                  ),
                ),
                TextInput(
                  hintText: "Description",
                  inputType: TextInputType.multiline,
                  controller: _controllerDescriptionPlace,
                  maxLines: 4,
                ),
                Container(
                  margin: EdgeInsets.only(top: 20.0),
                  child: TextInputLocation(
                    hintText: "Add Location",
                    iconData: Icons.location_on,
                  ),
                ),
                Container(
                  width: 70.0,
                  child: ButtonPurple(
                      buttonText: "Add Place",
                      onPressed: () {
                        //1.Firebase Storage
                        //url
                        //id del usuario logueado
                        userBloc.currentUser.then((FirebaseUser user) {
                          if (user != null) {
                            String uid = user.uid;
                            String path =
                                "${uid}/${DateTime.now().toString()}.jpg";
                            userBloc
                                .uploadFile(path, widget.imageFile)
                                .then((StorageUploadTask storageUploadTask) {
                              storageUploadTask.onComplete.then(
                                  (StorageTaskSnapshot storageTaskSnapshot) {
                                storageTaskSnapshot.ref
                                    .getDownloadURL()
                                    .then((urlImagen) {
                                  print(urlImagen);
                                  //2.cloud firestore
                                  // Place: title, description, url,userOwner, likes
                                  userBloc
                                      .updatePlaceData(Place(
                                    name: _controllerTitlePlace.text,
                                    description:
                                        _controllerDescriptionPlace.text,
                                    urlImage: urlImagen,
                                    likes: 0,
                                  ))
                                      .whenComplete(() {
                                    print("TERMINO");
                                    Navigator.pop(context);
                                  });
                                });
                              });
                            });
                          }
                        });
                      }),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
