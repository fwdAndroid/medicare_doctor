import 'package:flutter/material.dart';
import 'package:medicare_doctor/uitls/colors.dart';

// ignore: must_be_immutable
class SaveButton extends StatelessWidget {
  String title;
  final void Function()? onTap;

  SaveButton({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
          fixedSize: Size(361, 49),
          backgroundColor: mainColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
      child: Text(
        title,
        style: TextStyle(
            fontSize: 14,
            fontFamily: "Mulish",
            fontWeight: FontWeight.w500,
            color: white),
      ),
    );
  }
}

// ignore: must_be_immutable
class OutlineButton extends StatelessWidget {
  String title;
  final void Function()? onTap;

  OutlineButton({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onTap,
      style: OutlinedButton.styleFrom(
          side: BorderSide(color: Color(0xffE94057), width: 1),
          fixedSize: Size(46, 20),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
      child: Text(
        title,
        style: TextStyle(
            fontFamily: "Mulish",
            fontWeight: FontWeight.w600,
            color: Color(0xffE94057)),
      ),
    );
  }
}
