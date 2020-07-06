import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app_travel/Place/model/place.dart';
import 'package:flutter_app_travel/User/model/user.dart';

class CloudFirestoreAPI {
  final String USERS = "users";
  final String PLACES = "places";


  final Firestore _db = Firestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void updateUserData(User user) async {
    DocumentReference ref = _db.collection(USERS).document(user.uid);
    return ref.setData({
      'uid': user.uid,
      'name': user.name,
      'email': user.email,
      'photo': user.photo,
      'myPlaces': user.myPlaces,
      'myFavoritePlaces': user.myFavoritePlaces,
      'lastSignIn': DateTime.now()
    }, merge: true);
  }
  
  Future<void> updatePlaceData(Place place) async { 
    CollectionReference refPlaces =_db.collection(PLACES);
    await _auth.currentUser().then((FirebaseUser user) {
      DocumentReference _userRef = _db.collection(USERS).document(user.uid);
      refPlaces.add({
        'name': place.name,
        'description': place.description,
        'like': place.likes,
        'userOwner': _userRef //reference
      });
    });
  }
}