import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:medicare_doctor/models/user_model.dart';
import 'package:medicare_doctor/services/storage_methods.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

//Get Users Details
// Future<UserModel> getUserDetails() async {
//    User currentUser = _auth.currentUser!;
//    DocumentSnapshot documentSnapshot =await firebaseFirestore.collection('users').doc(currentUser.uid).get();
//    return UserModel.fromSnap(documentSnapshot);
// }

  //Register Provider
  Future<String> signUpUser(
      {required String email,
      required String pass,
      required String contact,
      required String username,
      required bool isblocked,
      required String about,
      required String experience,
      required String department,
      required String hospitalName,
      required Uint8List file}) async {
    String res = 'Wrong Email or Password';
    try {
      if (email.isNotEmpty || pass.isNotEmpty || username.isNotEmpty) {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: pass);
        String photoURL = await StorageMethods().uploadImageToStorage(
          'ProfilePics',
          file,
        );
        //Add User to the database with modal
        UserModel userModel = UserModel(
            isblocked: false,
            rate: 0,
            review: {},
            fullName: username,
            consultantFees: 0,
            experience: experience,
            about: about,
            hospitalName: hospitalName,
            numberreviews: 0,
            price: 0,
            uid: cred.user!.uid,
            email: email,
            contactNumber: contact,
            password: pass,
            department: department,
            photoURL: photoURL);
        await firebaseFirestore
            .collection('doctors')
            .doc(cred.user!.uid)
            .set(userModel.toJson());
        res = 'success';
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  //For Provider Sign In
  Future<String> loginUpUser({
    required String email,
    required String pass,
  }) async {
    String res = ' Wrong Email or Password';
    try {
      if (email.isNotEmpty || pass.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(email: email, password: pass);

        res = 'successs';
      }
    } on FirebaseException catch (e) {
      if (e == 'WrongEmail') {
        print(e.message);
      }
      if (e == 'WrongPassword') {
        print(e.message);
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  //Google SignIn
  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
