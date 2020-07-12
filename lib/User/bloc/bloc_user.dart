import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_app_travel/Place/model/place.dart';
import 'package:flutter_app_travel/Place/repository/firebase_storage_repository.dart';
import 'package:flutter_app_travel/Place/ui/widgets/card_image_with_fab_icon.dart';
import 'package:flutter_app_travel/User/model/user.dart';
import 'package:flutter_app_travel/User/repository/auth_repository.dart';
import 'package:flutter_app_travel/User/repository/cloud_firestore_api.dart';
import 'package:flutter_app_travel/User/repository/cloud_firestore_repository.dart';
import 'package:flutter_app_travel/User/ui/widgets/profile_place.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class UserBloc implements Bloc {
  final _auth_repository = AuthRepository();
  //Flujo de datos - Streams
  //Stream - Firebase
  // StreamController
  Stream<FirebaseUser> streamFirebase =
      FirebaseAuth.instance.onAuthStateChanged;
  Stream<FirebaseUser> get authStatus => streamFirebase;
  Future<FirebaseUser> get currentUser => FirebaseAuth.instance.currentUser();

  //Caso de Uso
  //1. SignIn a la aplicacion google
  Future<FirebaseUser> SignIn() => _auth_repository.signInFirebase();

  //2. Registrar usuario en base de datos
  final _cloudFirestoreRepository = CloudFirestoreRepository();
  void updateUserData(User user) =>
      _cloudFirestoreRepository.updateUserDataFirestore(user);
  Future<void> updatePlaceData(Place place) =>
      _cloudFirestoreRepository.updatePlaceData(place);

  Stream<QuerySnapshot> placesListStream =
      Firestore.instance.collection(CloudFirestoreAPI().PLACES).snapshots();
  Stream<QuerySnapshot> get placesStream => placesListStream;

  final _firabaseStorageRepository = FirebaseStorageRepository();
  Future<StorageUploadTask> uploadFile(String path, File image) =>
      _firabaseStorageRepository.uploadFile(path, image);

  List<ProfilePlace> buildMyPlaces(
          List<DocumentSnapshot> placesListSnapshot, User user) =>
      _cloudFirestoreRepository.buildMyPlaces(placesListSnapshot, user);
  Stream<QuerySnapshot> myPlacesListStream(String uid) => Firestore.instance
      .collection(CloudFirestoreAPI().PLACES)
      .where("userOwner",
          isEqualTo: Firestore.instance
              .document("${CloudFirestoreAPI().USERS}/${uid}"))
      .snapshots();

  List<Place> buildPlaces(
          List<DocumentSnapshot> placeListSnapshot, User user) =>
      _cloudFirestoreRepository.buildPlaces(placeListSnapshot, user);

  Future likePlace(Place place, String uid) =>
      _cloudFirestoreRepository.likePlace(place, uid);

  signOut() {
    _auth_repository.signOut();
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
