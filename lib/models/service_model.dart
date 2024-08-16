import 'package:cloud_firestore/cloud_firestore.dart';

class ServiceModel {
  String uid;
  String serviceName;
  String doctorName;
  String doctorPhoto;
  String department;
  int servicePrice;
  String description;
  String uuid;

  ServiceModel({
    required this.uid,
    required this.serviceName,
    required this.uuid,
    required this.department,
    required this.doctorName,
    required this.doctorPhoto,
    required this.description,
    required this.servicePrice,
  });

  ///Converting OBject into Json Object
  Map<String, dynamic> toJson() => {
        'uid': uid,
        'uuid': uuid,
        'serviceName': serviceName,
        'doctorName': doctorName,
        'doctorPhoto': doctorPhoto,
        'department': department,
        'servicePrice': servicePrice,
        'description': description,
      };

  ///
  static ServiceModel fromSnap(DocumentSnapshot snaps) {
    var snapshot = snaps.data() as Map<String, dynamic>;

    return ServiceModel(
      doctorPhoto: snapshot['doctorPhoto'],
      uid: snapshot['uid'],
      uuid: snapshot['uuid'],
      description: snapshot['description'],
      serviceName: snapshot['serviceName'],
      department: snapshot['department'],
      doctorName: snapshot['doctorName'],
      servicePrice: snapshot['servicePrice'],
    );
  }
}
