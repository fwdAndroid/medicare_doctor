import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:medicare_doctor/uitls/colors.dart';
import 'package:medicare_doctor/website_medicare/web_widgets/header_widget.dart';

class WebMainDashboardDoctors extends StatefulWidget {
  const WebMainDashboardDoctors({super.key});

  @override
  State<WebMainDashboardDoctors> createState() =>
      _WebMainDashboardDoctorsState();
}

class _WebMainDashboardDoctorsState extends State<WebMainDashboardDoctors> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderBar(),
      body: Column(
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Completed Appointments',
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
                    .where("status", isEqualTo: "complete")
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Cancelled Appointments',
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
                    .where("status", isEqualTo: "cancel")
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

  // Adjust the crossAxisCount based on the screen width
  int _getCrossAxisCount(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth > 1200) {
      return 6; // 6 columns for large screens
    } else if (screenWidth > 800) {
      return 4; // 4 columns for medium screens
    } else {
      return 2; // 2 columns for small screens
    }
  }
}
