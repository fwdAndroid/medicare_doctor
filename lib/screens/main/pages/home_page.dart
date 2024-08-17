import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medicare_doctor/uitls/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("doctors")
                  .doc(FirebaseAuth.instance.currentUser!.uid)
                  .snapshots(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (!snapshot.hasData || snapshot.data == null) {
                  return Center(child: Text('No data available'));
                }
                var snap = snapshot.data;
                return CircleAvatar(
                  backgroundImage: NetworkImage(snap['photoURL']),
                );
              }),
          title: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("doctors")
                  .doc(FirebaseAuth.instance.currentUser!.uid)
                  .snapshots(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (!snapshot.hasData || snapshot.data == null) {
                  return Center(child: Text('No data available'));
                }
                var snap = snapshot.data;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hello!",
                      style: GoogleFonts.poppins(color: appColor, fontSize: 14),
                    ),
                    Text(
                      snap['fullName'],
                      style: GoogleFonts.poppins(
                          color: appColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                );
              }),
          automaticallyImplyLeading: false,
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.notifications),
            )
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: white,
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.search,
                    color: hintColor,
                  ),
                  hintText: "Search by Doctor name or department",
                  hintStyle:
                      GoogleFonts.poppins(fontSize: 14, color: hintColor),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                      borderSide: BorderSide(color: borderColor)),
                  focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                      borderSide: BorderSide(color: borderColor)),
                  disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                      borderSide: BorderSide(color: borderColor)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                      borderSide: BorderSide(color: borderColor)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                      borderSide: BorderSide(color: borderColor)),
                ),
              ),
            ),
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
                      .where("doctorid",
                          isEqualTo: FirebaseAuth.instance.currentUser!.uid)
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
                'Services we offer',
                style: GoogleFonts.poppins(
                    color: appColor, fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Row(
                children: [
                  Card(
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/logo.png",
                          height: 100,
                          width: 100,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              bottom: 8.0, top: 8, left: 8, right: 8),
                          child: Text(
                            'Instant \n Consultation',
                            style: GoogleFonts.poppins(
                                color: appColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            bottom: 8.0,
                          ),
                          child: Text(
                            'Start from 50\$',
                            style: GoogleFonts.poppins(
                                color: textColor,
                                fontSize: 10,
                                fontWeight: FontWeight.w600),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/logo.png",
                          height: 100,
                          width: 100,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              bottom: 8.0, top: 8, left: 8, right: 8),
                          child: Text(
                            'Book a \n Specialist',
                            style: GoogleFonts.poppins(
                                color: appColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            bottom: 8.0,
                          ),
                          child: Text(
                            'Start from 100\$',
                            style: GoogleFonts.poppins(
                                color: textColor,
                                fontSize: 10,
                                fontWeight: FontWeight.w600),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/logo.png",
                          height: 100,
                          width: 100,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              bottom: 8.0, top: 8, left: 8, right: 8),
                          child: Text(
                            'Order \n Medicine',
                            style: GoogleFonts.poppins(
                                color: appColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            bottom: 8.0,
                          ),
                          child: Text(
                            'Delivery In 1 hour',
                            style: GoogleFonts.poppins(
                                color: textColor,
                                fontSize: 10,
                                fontWeight: FontWeight.w600),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
