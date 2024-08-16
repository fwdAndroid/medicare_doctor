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
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello!',
                style: GoogleFonts.poppins(color: appColor, fontSize: 14),
              ),
              Text(
                'Zenifer Aniston',
                style: GoogleFonts.poppins(
                    color: appColor, fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ],
          ),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      bottom: 8.0, top: 8, left: 8, right: 8),
                  child: Text(
                    'Departments',
                    style: GoogleFonts.poppins(
                        color: appColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      bottom: 8.0, top: 8, left: 8, right: 8),
                  child: Text(
                    'See All',
                    style: GoogleFonts.poppins(
                        color: mainColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  "assets/nero.png",
                  height: 95,
                ),
                Image.asset(
                  "assets/card.png",
                  height: 95,
                ),
                Image.asset(
                  "assets/gyn.png",
                  height: 95,
                ),
                Image.asset(
                  "assets/ped.png",
                  height: 95,
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  "assets/aller.png",
                  height: 95,
                ),
                Image.asset(
                  "assets/dent.png",
                  height: 95,
                ),
                Image.asset(
                  "assets/uro.png",
                  height: 95,
                ),
                Image.asset(
                  "assets/gestrology.png",
                  height: 95,
                )
              ],
            )
          ],
        ));
  }
}
