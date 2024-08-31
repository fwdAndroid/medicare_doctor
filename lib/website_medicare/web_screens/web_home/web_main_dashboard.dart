import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:medicare_doctor/uitls/colors.dart';
import 'package:medicare_doctor/website_medicare/web_widgets/header_widget.dart';

class MainDashboardWeb extends StatefulWidget {
  const MainDashboardWeb({super.key});

  @override
  State<MainDashboardWeb> createState() => _MainDashboardWebState();
}

class _MainDashboardWebState extends State<MainDashboardWeb> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
        print(user.uid);
      } else {
        print("User not signed in");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Upcoming Appointments',
              style: GoogleFonts.poppins(
                  color: appColor, fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(
            height: 150,
            width: MediaQuery.of(context).size.width,
            child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("appointments")
                    // .where("doctorid",
                    //     isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                    .where("status", isEqualTo: "send")
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
                        "No Appointment Available",
                        style: TextStyle(color: black),
                      ),
                    );
                  }
                  return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        final List<DocumentSnapshot> documents =
                            snapshot.data!.docs;
                        final Map<String, dynamic> data =
                            documents[index].data() as Map<String, dynamic>;
                        return Card(
                          color: mainColor,
                          child: SizedBox(
                            width: 218,
                            height: 100,
                            child: Column(
                              children: [
                                ListTile(
                                  leading: CircleAvatar(
                                    backgroundImage:
                                        NetworkImage(data['patientDocument']),
                                  ),
                                  title: Text(
                                    data['paitientName'],
                                    style: GoogleFonts.openSans(
                                        color: white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Text(
                                    data['patientProblem'],
                                    style: GoogleFonts.openSans(
                                        color: white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      data['appointmentDate'],
                                      style: GoogleFonts.poppins(
                                          color: white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w300),
                                    ),
                                    const SizedBox(
                                      width: 6,
                                    ),
                                    Text(
                                      "|",
                                      style: GoogleFonts.poppins(
                                          color: white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w300),
                                    ),
                                    const SizedBox(
                                      width: 6,
                                    ),
                                    Text(
                                      data['appointmentTime'],
                                      style: GoogleFonts.poppins(
                                          color: white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w300),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                }),
          ),
        ],
      ),
    );
  }
}
