import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app_travel/User/model/user.dart';
import 'package:flutter_app_travel/User/repository/auth_repository.dart';
import 'package:flutter_app_travel/User/repository/cloud_firestore_repository.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
class BlocUser implements Bloc {

  final _auth_repository = AuthRepository();
  //Flujo de datos - Streams
  //Stream - Firebase
  // StreamController
  Stream<FirebaseUser> streamFirebase = FirebaseAuth.instance.onAuthStateChanged;
  Stream<FirebaseUser> get authStatus => streamFirebase;

  //Caso de Uso
  //1. SignIn a la aplicacion google
  Future<FirebaseUser> SignIn() {
    return _auth_repository.signInFirebase();
  }

  //2. Registrar usuario en base de datos
  final _cloudFirestoreRepository = CloudFirestoreRepository();
  void updateUserData(User user)=> _cloudFirestoreRepository.updateUserDataFirestore(user);

  signOut() {
    _auth_repository.signOut();
  }


  @override
  void dispose() {
    // TODO: implement dispose
  }

}