import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medicare_doctor/screens/main/main_dashboard.dart';
import 'package:medicare_doctor/uitls/colors.dart';
import 'package:medicare_doctor/uitls/message_utils.dart';
import 'package:medicare_doctor/videocall/video_call.dart';
import 'package:medicare_doctor/widgets/save_button.dart';

class UpcommingAppointmentDetail extends StatefulWidget {
  final appointmentDate;
  final appointmentEndTime;
  final appointmentId;
  final appointmentStartTime;
  final price;
  final doctorName;
  final paitientName;
  final doctorid;
  final paitientUid;
  final paitientDate;
  final file;
  final gender;
  final paitientProblem;
  final status;
  const UpcommingAppointmentDetail({
    super.key,
    required this.appointmentDate,
    required this.appointmentEndTime,
    required this.appointmentId,
    required this.status,
    required this.appointmentStartTime,
    required this.price,
    required this.doctorName,
    required this.doctorid,
    required this.paitientName,
    required this.paitientDate,
    required this.file,
    required this.gender,
    required this.paitientUid,
    required this.paitientProblem,
  });

  @override
  State<UpcommingAppointmentDetail> createState() =>
      _UpcommingAppointmentDetailState();
}

class _UpcommingAppointmentDetailState
    extends State<UpcommingAppointmentDetail> {
  bool isLoading = false;
  String currentStatus = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchAppointmentStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (builder) => VideoCall(
                              friendName: widget.paitientName,
                              callingid: widget.paitientUid)));
                },
                icon: Icon(
                  Icons.video_call,
                  color: mainColor,
                )),
          )
        ],
        centerTitle: true,
        title: Text(
          "Appointment History",
          style: GoogleFonts.poppins(fontSize: 18, color: appColor),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 100,
              width: 360,
              decoration: BoxDecoration(
                color: circle,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: dividerColor,
                ),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: Image.network(
                    //     widget.doctorPhoto,
                    //     height: 90,
                    //     width: 90,
                    //     fit: BoxFit.cover,
                    //   ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            widget.paitientName,
                            style: GoogleFonts.poppins(
                                color: appColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w700),
                          ),
                          Row(
                            children: [
                              Text(
                                widget
                                    .appointmentDate, // Display the formatted date
                                style: GoogleFonts.poppins(
                                  color: textColor,
                                  fontSize: 12,
                                ),
                              ),
                              Text(
                                widget.appointmentStartTime,
                                style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Text("")
                  ],
                ),
              ),
            ),
          ),
          //Appointment Schedule
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 100,
              width: 360,
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Appointment Schedule",
                        style: GoogleFonts.poppins(
                            color: appColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0, left: 8),
                      child: Row(
                        children: [
                          Text(
                            "Date:     ", // Display the formatted date
                            style: GoogleFonts.poppins(
                              color: appColor,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            widget.appointmentDate,
                            style: GoogleFonts.poppins(
                              color: dateColor,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0, left: 8),
                      child: Row(
                        children: [
                          Text(
                            "Time:     ", // Display the formatted date
                            style: GoogleFonts.poppins(
                              color: appColor,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            widget.appointmentStartTime,
                            style: GoogleFonts.poppins(
                              color: dateColor,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 200,
              width: 360,
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Patient Details",
                        style: GoogleFonts.poppins(
                            color: appColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0, left: 8),
                      child: Row(
                        children: [
                          Text(
                            "Name:     ", // Display the formatted date
                            style: GoogleFonts.poppins(
                              color: appColor,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            widget.paitientName,
                            style: GoogleFonts.poppins(
                              color: dateColor,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0, left: 8),
                      child: Row(
                        children: [
                          Text(
                            "Gender:     ", // Display the formatted date
                            style: GoogleFonts.poppins(
                              color: appColor,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            widget.gender,
                            style: GoogleFonts.poppins(
                              color: dateColor,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0, left: 8),
                      child: Row(
                        children: [
                          Text(
                            "Fees:     ", // Display the formatted date
                            style: GoogleFonts.poppins(
                              color: appColor,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            "\$" + " " + widget.price.toString(),
                            style: GoogleFonts.poppins(
                              color: dateColor,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0, left: 8),
                      child: Row(
                        children: [
                          Text(
                            "Patient Problem:     ", // Display the formatted date
                            style: GoogleFonts.poppins(
                              color: appColor,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            widget.paitientProblem,
                            style: GoogleFonts.poppins(
                              color: dateColor,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          isLoading
              ? Center(child: CircularProgressIndicator())
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: currentStatus != 'complete'
                      ? SaveButton(
                          title: "Complete",
                          onTap: _markAsComplete,
                        )
                      : Container(), // Or use SizedBox.shrink() if you don't want to occupy space
                ),
        ],
      ),
    );
  }

  Future<void> _fetchAppointmentStatus() async {
    setState(() {
      isLoading = true;
    });

    try {
      final doc = await FirebaseFirestore.instance
          .collection("doctor_appointment")
          .doc(widget.appointmentId)
          .get();

      if (doc.exists) {
        setState(() {
          currentStatus = doc.data()?['status'] ?? widget.status;
        });
      }
    } catch (e) {
      // Handle error if needed
      print('Error fetching appointment status: $e');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> _markAsComplete() async {
    setState(() {
      isLoading = true;
    });

    try {
      await FirebaseFirestore.instance
          .collection("doctor_appointment")
          .doc(widget.appointmentId)
          .update({"status": "complete"});

      setState(() {
        currentStatus = "complete";
      });

      showMessageBar("Appointment Marked As Completed", context);
    } catch (e) {
      // Handle error if needed
      print('Error updating appointment status: $e');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }
}
