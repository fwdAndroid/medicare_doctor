import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medicare_doctor/uitls/colors.dart';

class DoctorPage extends StatefulWidget {
  const DoctorPage({super.key});

  @override
  State<DoctorPage> createState() => _DoctorPageState();
}

class _DoctorPageState extends State<DoctorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          "Departments",
          style: GoogleFonts.poppins(fontSize: 18, color: appColor),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Departments",
              style: GoogleFonts.poppins(
                  color: appColor, fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
          Image.asset("assets/dep/png"),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Common Symptoms",
              style: GoogleFonts.poppins(
                  color: appColor, fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
          Image.asset("assets/cs.png"),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Top Rated Doctors",
                  style: GoogleFonts.poppins(
                      color: appColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "See All",
                      style: GoogleFonts.poppins(color: mainColor),
                    ))
              ],
            ),
          ),
          SizedBox(
            height: 236,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 140,
                          child: Stack(
                            children: [
                              Image.asset("assets/newlogo.png"),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(
                                      Icons.circle,
                                      color: mainColor,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 4.0, top: 8, right: 4),
                          child: Text(
                            "Dr. Alex Zender",
                            style: GoogleFonts.poppins(
                                fontSize: 12, color: appColor),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 4.0, right: 4),
                          child: Text(
                            "Cardiology Specialist",
                            style: GoogleFonts.poppins(
                                fontSize: 12, color: textColor),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 4.0, right: 4, bottom: 4),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                  ),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  Text(
                                    "5.0",
                                    style: GoogleFonts.poppins(
                                        fontSize: 12, color: textColor),
                                  ),
                                  Text(
                                    "(150)",
                                    style: GoogleFonts.poppins(
                                        fontSize: 12, color: textColor),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 61,
                              ),
                              Align(
                                  alignment: Alignment.topRight,
                                  child: Icon(Icons.favorite_outline))
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
