import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medicare_doctor/uitls/colors.dart';

// ignore: must_be_immutable
class ServiceWidget extends StatelessWidget {
  VoidCallback onTap;
  String titleText;
  String priceTitle;
  String descTitle;
  String department;
  String doctorName;
  String doctorPhoto;
  ServiceWidget(
      {super.key,
      required this.onTap,
      required this.department,
      required this.titleText,
      required this.descTitle,
      required this.doctorName,
      required this.doctorPhoto,
      required this.priceTitle});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: white,
        elevation: 0,
        shape: RoundedRectangleBorder(
            side: BorderSide(
              color: borderColor,
            ),
            borderRadius: BorderRadius.circular(8)),
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(
              doctorPhoto,
            ),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                doctorName,
                style: GoogleFonts.manrope(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: mainColor),
              ),
              Row(
                children: [
                  Text(
                    "Service Name: ",
                    style: GoogleFonts.manrope(
                        fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  Text(
                    titleText,
                    style: GoogleFonts.manrope(
                        fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Department: ",
                    style: GoogleFonts.manrope(
                        fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  Text(
                    department,
                    style: GoogleFonts.manrope(
                        fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                ],
              ),
              Text(
                descTitle,
                overflow: TextOverflow.clip,
                style: GoogleFonts.nunitoSans(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: Color(0xff50555C)),
              )
            ],
          ),
          trailing: Text(
            priceTitle,
            style: GoogleFonts.manrope(
                fontWeight: FontWeight.bold, fontSize: 14, color: mainColor),
          ),
        ),
      ),
    );
  }
}
