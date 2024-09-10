import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medicare_doctor/screens/detail/upcomming_appointment_detail.dart';
import 'package:medicare_doctor/uitls/colors.dart';

class HomePage extends StatefulWidget {
  final Map<String, dynamic> userData;

  const HomePage({super.key, required this.userData});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(widget.userData['photoURL']),
          ),
          title: Text(
            widget.userData['doctorName'],
            style: GoogleFonts.poppins(
                color: appColor, fontSize: 16, fontWeight: FontWeight.w600),
          ),
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
                      .collection("doctor_appointment")
                      .where("doctorId", isEqualTo: widget.userData['uuid'])
                      .where("status", isEqualTo: "confirm")
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
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          final List<DocumentSnapshot> documents =
                              snapshot.data!.docs;
                          final Map<String, dynamic> data =
                              documents[index].data() as Map<String, dynamic>;

                          return Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (builder) =>
                                              UpcommingAppointmentDetail(
                                                  appointmentEndTime: data[
                                                      'appointmentEndTime'],
                                                  appointmentDate:
                                                      data['appointmentDate'],
                                                  appointmentId:
                                                      data['appointmentId'],
                                                  price:
                                                      data['price'].toString(),
                                                  appointmentStartTime: data[
                                                      'appointmentStartTime'],
                                                  doctorName:
                                                      data['doctorName'],
                                                  doctorid: data['doctorid'],
                                                  paitientName:
                                                      data['paitientName'],
                                                  paitientDate:
                                                      data['paitientDate'],
                                                  file: data['file'],
                                                  gender: data['gender'],
                                                  paitientUid:
                                                      data['paitientUid'],
                                                  paitientProblem:
                                                      data['paitientProblem'],
                                                  status: data["status"])));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ListTile(
                                    trailing: Container(
                                      width: 80,
                                      height: 24,
                                      decoration: BoxDecoration(
                                          border: Border.all(color: contColor),
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                      child: Center(
                                        child: Text(
                                          "Upcoming",
                                          style: GoogleFonts.poppins(
                                              fontSize: 12, color: mainColor),
                                        ),
                                      ),
                                    ),
                                    subtitle: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          data['appointmentDate'],
                                          style: GoogleFonts.poppins(
                                              color: dateColor,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w300),
                                        ),
                                        const SizedBox(
                                          width: 6,
                                        ),
                                        Text(
                                          "|",
                                          style: GoogleFonts.poppins(
                                              color: dateColor,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w300),
                                        ),
                                        const SizedBox(
                                          width: 6,
                                        ),
                                        Text(
                                          data['appointmentStartTime'],
                                          style: GoogleFonts.poppins(
                                              color: dateColor,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w300),
                                        )
                                      ],
                                    ),
                                    title: Text(
                                      data['paitientName'],
                                      style: GoogleFonts.poppins(
                                          fontSize: 16,
                                          color: appColor,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  // Column(
                                  //   children: [
                                  //     Row(
                                  //       crossAxisAlignment: CrossAxisAlignment.start,
                                  //       children: [
                                  //         Column(
                                  //           crossAxisAlignment:
                                  //               CrossAxisAlignment.start,
                                  //           children: [
                                  //             Row(
                                  //               children: [

                                  //                 const SizedBox(
                                  //                   width: 3,
                                  //                 ),

                                  //             Text(
                                  //               "+82312412414424",
                                  //               style: GoogleFonts.poppins(
                                  //                   fontSize: 14,
                                  //                   color: appColor,
                                  //                   fontWeight: FontWeight.w400),
                                  //             ),
                                  //             const SizedBox(
                                  //               height: 30,
                                  //             ),

                                  //       ],
                                  //     )
                                  //   ],
                                  // ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Divider(
                                  color: dividerColor,
                                ),
                              )
                            ],
                          );
                        });
                  }),
            ),
          ],
        ));
  }
}
