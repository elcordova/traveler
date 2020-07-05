import 'package:flutter/cupertino.dart';
import 'package:flutter_app_travel/User/model/user.dart';

class Place {
  String id;
  String name;
  String description;
  String uriImage;
  int likes;
  User userOwner;

  Place({
    @required this.name,
    @required this.description,
    @required this.uriImage,
    @required this.userOwner,
    this.likes,

  });
}