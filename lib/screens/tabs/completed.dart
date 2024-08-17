import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medicare_doctor/uitls/colors.dart';

class Completed extends StatefulWidget {
  const Completed({super.key});

  @override
  State<Completed> createState() => _CompletedState();
}

class _CompletedState extends State<Completed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("appointments")
              .where("doctorid",
                  isEqualTo: FirebaseAuth.instance.currentUser!.uid)
              .where("appointmentStatus", isEqualTo: "complete")
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
                  final List<DocumentSnapshot> documents = snapshot.data!.docs;
                  final Map<String, dynamic> data =
                      documents[index].data() as Map<String, dynamic>;
                  return Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 170,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.network(
                                      data['doctorPhoto'],
                                      height: 90,
                                      width: 90,
                                    ),
                                    const SizedBox(
                                      width: 7,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              data['paitientName'],
                                              style: GoogleFonts.poppins(
                                                  fontSize: 16,
                                                  color: appColor,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            const SizedBox(
                                              width: 3,
                                            ),
                                            Container(
                                              width: 80,
                                              height: 24,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: completeColor),
                                                  borderRadius:
                                                      BorderRadius.circular(4)),
                                              child: Center(
                                                child: Text(
                                                  "Completed",
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 12,
                                                      color: completeColor),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        Text(
                                          "+82312412414424",
                                          style: GoogleFonts.poppins(
                                              fontSize: 14,
                                              color: appColor,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        const SizedBox(
                                          height: 30,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
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
                                              data['appointmentTime'],
                                              style: GoogleFonts.poppins(
                                                  color: dateColor,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w300),
                                            )
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 8.0, bottom: 4),
                                          child: OutlinedButton(
                                              style: OutlinedButton.styleFrom(
                                                  foregroundColor: mainColor),
                                              onPressed: () {},
                                              child: Text(
                                                "Review",
                                                style: GoogleFonts.poppins(
                                                    color: mainColor),
                                              )),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                });
          }),
    );
  }
}
