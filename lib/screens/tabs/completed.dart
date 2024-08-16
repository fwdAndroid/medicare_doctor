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
      body: ListView.builder(itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 120,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          "assets/logo.png",
                          height: 90,
                          width: 90,
                        ),
                        const SizedBox(
                          width: 7,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Mohammad Quasi",
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
                                      border: Border.all(color: completeColor),
                                      borderRadius: BorderRadius.circular(4)),
                                  child: Center(
                                    child: Text(
                                      "Completed",
                                      style: GoogleFonts.poppins(
                                          fontSize: 12, color: completeColor),
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
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "23 Sept 2023",
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
                                  "12:30 AM",
                                  style: GoogleFonts.poppins(
                                      color: dateColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300),
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Divider(
                color: dividerColor,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, bottom: 4),
              child: OutlinedButton(
                  style: OutlinedButton.styleFrom(foregroundColor: mainColor),
                  onPressed: () {},
                  child: Text(
                    "Review",
                    style: GoogleFonts.poppins(color: mainColor),
                  )),
            )
          ],
        );
      }),
    );
  }
}
