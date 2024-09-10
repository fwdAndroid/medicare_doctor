import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medicare_doctor/screens/tabs/cancelled.dart';
import 'package:medicare_doctor/screens/tabs/completed.dart';
import 'package:medicare_doctor/screens/tabs/upcomming.dart';
import 'package:medicare_doctor/uitls/colors.dart';

class AppointmentPage extends StatefulWidget {
  final Map<String, dynamic> userData;
  const AppointmentPage({super.key, required this.userData});

  @override
  State<AppointmentPage> createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: Text(
            "Appointments",
            style: GoogleFonts.poppins(color: appColor),
          ),
          bottom: TabBar(
            indicatorColor: mainColor,
            labelColor: mainColor,
            labelStyle: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w300,
            ),
            unselectedLabelColor: textColor,
            unselectedLabelStyle: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w300,
            ),
            tabs: <Widget>[
              Tab(
                text: "Booked",
              ),
              Tab(
                text: "Completed",
              ),
              Tab(
                text: "Cancelled",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Upcomming(
              userData: widget.userData,
            ),
            Completed(
              userData: widget.userData,
            ),
            Cancelled(
              userData: widget.userData,
            )
          ],
        ),
      ),
    );
  }
}
