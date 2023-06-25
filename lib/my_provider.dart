import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:to_do/models/user_model.dart';
import 'package:to_do/network/firebase/firebase_functions.dart';

class MyProvider extends ChangeNotifier {
  UserModel? myUser;
  User? firebaseUser;

  MyProvider()
  {
    firebaseUser= FirebaseAuth.instance.currentUser;
    if(firebaseUser != null)
      {
        initUser();
      }
  }


  void initUser()async{
    firebaseUser= FirebaseAuth.instance.currentUser;
  myUser= await FireBaseFunctions.readUser(firebaseUser!.uid);
  notifyListeners();
  }

  void logOut()
  {

    FirebaseAuth.instance.signOut();
    notifyListeners();

  }
}

