import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medicare_doctor/uitls/colors.dart';
import 'package:medicare_doctor/widgets/save_button.dart';

class UpcommingAppointmentDetail extends StatefulWidget {
  final appointmentDate;
  final appointmentId;
  final appointmentTime;
  final doctorDepartment;
  final doctorExperience;
  final doctorFees;
  final doctorName;
  final doctorPhoto;
  final paitientName;
  final doctorid;
  final patientId;
  final patientDob;
  final patientDocument;
  final patientGender;
  final patientProblem;
  final rate;
  final review;
  final appointmentStatus;
  const UpcommingAppointmentDetail({
    super.key,
    required this.appointmentDate,
    required this.appointmentId,
    required this.appointmentStatus,
    required this.appointmentTime,
    required this.doctorDepartment,
    required this.doctorExperience,
    required this.doctorFees,
    required this.doctorName,
    required this.doctorPhoto,
    required this.doctorid,
    required this.paitientName,
    required this.patientDob,
    required this.patientDocument,
    required this.patientGender,
    required this.patientId,
    required this.patientProblem,
    required this.rate,
    required this.review,
  });

  @override
  State<UpcommingAppointmentDetail> createState() =>
      _UpcommingAppointmentDetailState();
}

class _UpcommingAppointmentDetailState
    extends State<UpcommingAppointmentDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                onPressed: () {},
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.network(
                        widget.doctorPhoto,
                        height: 90,
                        width: 90,
                        fit: BoxFit.cover,
                      ),
                    ),
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
                                widget.appointmentTime,
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
                            widget.appointmentTime,
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
                            widget.patientGender,
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
                            "\$" + " " + widget.doctorFees.toString(),
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
                            widget.patientProblem,
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
            child: SaveButton(title: "Complete", onTap: () {}),
          )
        ],
      ),
    );
  }
}
