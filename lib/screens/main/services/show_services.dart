import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medicare_doctor/screens/main/services/add_services.dart';
import 'package:medicare_doctor/uitls/colors.dart';
import 'package:medicare_doctor/widgets/servce_widget.dart';

class ShowServices extends StatefulWidget {
  const ShowServices({super.key});

  @override
  State<ShowServices> createState() => _ShowServicesState();
}

class _ShowServicesState extends State<ShowServices> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: mainColor,
          child: Icon(
            Icons.add,
            color: white,
          ),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (builder) => AddServices()));
          }),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("doctorServices")
              .where("uid", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.data!.docs.isEmpty) {
              return Center(
                child: Text(
                  "No Service Available",
                  style: TextStyle(color: black),
                ),
              );
            }
            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  final List<DocumentSnapshot> documents = snapshot.data!.docs;
                  final Map<String, dynamic> data =
                      documents[index].data() as Map<String, dynamic>;
                  return ServiceWidget(
                    onTap: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (builder) => MyServiceDetail(
                      //               description: data['description'],
                      //               providerName: data['providerName'],
                      //               serviceCategory: data['serviceCategory'],
                      //               serviceDiscount:
                      //                   data['serviceDiscount'].toString(),
                      //               serviceImage: data['serviceImage'],
                      //               serviceLocation: data['serviceLocation'],
                      //               serviceName: data['serviceName'],
                      //               servicePrice: data['servicePrice'],
                      //               uid: data['uid'],
                      //               uuid: data['uuid'],
                      //             )));
                    },
                    department: data['department'],
                    doctorName: data['doctorName'],
                    doctorPhoto: data['doctorPhoto'],
                    titleText: data['serviceName'],
                    descTitle: data['description'],
                    priceTitle: "\$" + data['servicePrice'].toString(),
                  );
                });
          }),
    );
  }
}
