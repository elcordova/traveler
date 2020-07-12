import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_travel/Place/model/place.dart';
import 'package:flutter_app_travel/Place/ui/widgets/card_image_with_fab_icon.dart';
import 'package:flutter_app_travel/User/model/user.dart';
import 'package:flutter_app_travel/User/ui/widgets/profile_place.dart';

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
    CollectionReference refPlaces = _db.collection(PLACES);
    await _auth.currentUser().then((FirebaseUser user) {
      DocumentReference _userRef = _db.collection(USERS).document(user.uid);
      refPlaces.add({
        'name': place.name,
        'description': place.description,
        'like': place.likes,
        'urlImage': place.urlImage,
        'userOwner': _userRef //reference
      }).then((value) {
        _userRef.updateData({
          'myPlaces': FieldValue.arrayUnion(
              [_db.document("$PLACES/${value.documentID}")])
        });
      });
    });
  }

  List<ProfilePlace> buildMyPlaces(List<DocumentSnapshot> placesListSnapshot) {
    List<ProfilePlace> profilePlaces = List<ProfilePlace>();
    placesListSnapshot.forEach((p) {
      profilePlaces.add(ProfilePlace(Place(
          name: p.data['name'],
          description: p.data['description'],
          urlImage: p.data['urlImage'],
          likes: p.data['like'])));
    });
    return profilePlaces;
  }

  List<Place> buildPlaces(
      List<DocumentSnapshot> placesListSnapshot, User user) {
    List<Place> places = List<Place>();

    placesListSnapshot.forEach((p) {
      Place place = Place(
          id: p.documentID,
          name: p.data["name"],
          description: p.data["description"],
          urlImage: p.data["urlImage"],
          likes: p.data["likes"]);
      List usersLikedRefs = p.data["usersLiked"];
      place.liked = false;
      usersLikedRefs?.forEach((drUL) {
        if (user.uid == drUL.documentID) {
          place.liked = true;
        }
      });
      places.add(place);
    });
    return places;
  }

  Future likePlace(Place place, String uid) async {
    await _db
        .collection(PLACES)
        .document(place.id)
        .get()
        .then((DocumentSnapshot ds) {
      int likes = ds.data["likes"] ?? 0;

      _db.collection(PLACES).document(place.id).updateData({
        'likes': place.liked ? likes + 1 : likes - 1,
        'usersLiked': place.liked
            ? FieldValue.arrayUnion([_db.document("${USERS}/${uid}")])
            : FieldValue.arrayRemove([_db.document("${USERS}/${uid}")])
      });
    });
  }
}
