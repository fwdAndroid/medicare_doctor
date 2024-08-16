import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medicare_doctor/uitls/colors.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          "Appointment History",
          style: GoogleFonts.poppins(fontSize: 18, color: appColor),
        ),
      ),
      body: ListView.builder(itemBuilder: (context, index) {
        return Card(
          elevation: 1,
          color: white,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8),
                    child: Image.asset(
                      "assets/newlogo.png",
                      height: 90,
                      width: 90,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Dr. Alex Zender",
                        style:
                            GoogleFonts.poppins(fontSize: 16, color: appColor),
                      ),
                      Text(
                        "Cardiology",
                        style:
                            GoogleFonts.poppins(fontSize: 14, color: appColor),
                      ),
                      Text(
                        "MBBS, FCPS(Cardiology)",
                        style:
                            GoogleFonts.poppins(fontSize: 14, color: textColor),
                      ),
                      Row(
                        children: [
                          Text(
                            "23 Sept 2023",
                            style: GoogleFonts.poppins(
                                fontSize: 14, color: dateColor),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            "|",
                            style: GoogleFonts.poppins(
                                fontSize: 14, color: dateColor),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            "09:30 PM",
                            style: GoogleFonts.poppins(
                                fontSize: 14, color: dateColor),
                          ),
                        ],
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8),
                    child: Image.asset(
                      "assets/move.png",
                      height: 40,
                      width: 40,
                    ),
                  )
                ],
              )
            ],
          ),
        );
      }),
    );
  }
}
