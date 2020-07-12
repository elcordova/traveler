import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app_travel/Place/model/place.dart';
import 'package:flutter_app_travel/User/model/user.dart';
import 'package:flutter_app_travel/User/repository/cloud_firestore_api.dart';
import 'package:flutter_app_travel/User/ui/widgets/profile_place.dart';

class CloudFirestoreRepository {
  final _cloudFirestoreAPI = CloudFirestoreAPI();

  void updateUserDataFirestore(User user) =>
      _cloudFirestoreAPI.updateUserData(user);

  Future<void> updatePlaceData(Place place) =>
      _cloudFirestoreAPI.updatePlaceData(place);

  List<ProfilePlace> buildMyPlaces(
          List<DocumentSnapshot> placesListSnapshot, User user) =>
      _cloudFirestoreAPI.buildMyPlaces(placesListSnapshot);

  List<Place> buildPlaces(
          List<DocumentSnapshot> placeListSnapshot, User user) =>
      _cloudFirestoreAPI.buildPlaces(placeListSnapshot, user);

  Future likePlace(Place place, String uid) =>
      _cloudFirestoreAPI.likePlace(place, uid);
}
