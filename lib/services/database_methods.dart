import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:medicare_doctor/models/service_model.dart';
import 'package:uuid/uuid.dart';

class DatabaseMethods {
  // Add Service
  Future<String> addService(
      {required String serviceName,
      required String department,
      required int servicePrice,
      required String description,
      required String doctorName,
      required String doctorPhoto}) async {
    String res = 'Some error occurred';
    try {
      if (serviceName.isNotEmpty || department.isNotEmpty) {
        var uuid = Uuid().v4();

        //Add User to the database with modal
        ServiceModel userModel = ServiceModel(
            doctorName: doctorName,
            uid: FirebaseAuth.instance.currentUser!.uid,
            serviceName: serviceName,
            description: description,
            uuid: uuid,
            servicePrice: servicePrice,
            department: department,
            doctorPhoto: doctorPhoto);
        await FirebaseFirestore.instance
            .collection('doctorServices')
            .doc(uuid)
            .set(userModel.toJson());
        res = 'success';
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
}
