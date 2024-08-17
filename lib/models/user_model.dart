import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String uid;
  String email;
  String password;
  String fullName;
  String photoURL;
  String contactNumber;
  bool isblocked;
  final review;
  String department;
  int rate;
  String hospitalName;
  String experience;
  int price;
  int consultantFees;
  int numberreviews;
  String about;

  UserModel({
    required this.uid,
    required this.email,
    required this.isblocked,
    required this.password,
    required this.rate,
    required this.review,
    required this.photoURL,
    required this.department,
    required this.contactNumber,
    required this.fullName,
    required this.consultantFees,
    required this.experience,
    required this.hospitalName,
    required this.numberreviews,
    required this.price,
    required this.about,
  });

  ///Converting Object into Json Object
  Map<String, dynamic> toJson() => {
        'fullName': fullName,
        'isblocked': isblocked,
        'rate': rate,
        "review": review,
        'uid': uid,
        'email': email,
        'password': password,
        'contactNumber': contactNumber,
        'photoURL': photoURL,
        'consultantFees': consultantFees,
        'price': price,
        'about': about,
        'numberreviews': numberreviews,
        'hospitalName': hospitalName,
        'department': department,
        'experience': experience
      };

  ///
  static UserModel fromSnap(DocumentSnapshot snaps) {
    var snapshot = snaps.data() as Map<String, dynamic>;

    return UserModel(
        fullName: snapshot['fullName'],
        review: snapshot['review'],
        rate: snapshot['rate'],
        uid: snapshot['uid'],
        isblocked: snapshot['isblocked'],
        email: snapshot['email'],
        photoURL: snapshot['photoURL'],
        password: snapshot['password'],
        contactNumber: snapshot['contactNumber'],
        consultantFees: snapshot['consultantFees'],
        experience: snapshot['experience'],
        about: snapshot['about'],
        price: snapshot['price'],
        department: snapshot['department'],
        hospitalName: snapshot['hospitalName'],
        numberreviews: snapshot['numberreviews']);
  }
}
