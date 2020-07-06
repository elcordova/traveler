import 'package:flutter_app_travel/Place/model/place.dart';
import 'package:flutter_app_travel/User/model/user.dart';
import 'package:flutter_app_travel/User/repository/cloud_firestore_api.dart';
class CloudFirestoreRepository {
  final _cloudFirestoreAPI = CloudFirestoreAPI();

  void updateUserDataFirestore(User user) => _cloudFirestoreAPI.updateUserData(user);

  Future<void> updatePlaceData(Place place) => _cloudFirestoreAPI.updatePlaceData(place);
}