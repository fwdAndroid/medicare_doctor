import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

  //For Provider Sign In
  Future<String> loginDoctor(String email, String password) async {
    String res = 'Login failed';
    try {
      // Hash the entered password
      // var bytes = utf8.encode(password);
      // var hashedPassword = sha256.convert(bytes).toString();

      // Retrieve the doctor data from Firestore
      var docSnapshot = await FirebaseFirestore.instance
          .collection('doctors')
          .where('email', isEqualTo: email)
          .get();

      if (docSnapshot.docs.isNotEmpty) {
        var userData = docSnapshot.docs.first.data();
        if (userData['pass'] == password) {
          res = 'success'; // Login successful
        } else {
          res = 'Incorrect password';
        }
      } else {
        res = 'User not found';
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
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
