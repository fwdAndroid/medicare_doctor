import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medicare_doctor/screens/auth/login_screen.dart';
import 'package:medicare_doctor/uitls/colors.dart';
import 'package:medicare_doctor/widgets/save_button.dart';
import 'package:social_login_buttons/social_login_buttons.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SizedBox(
            height: 30,
          ),
          Image.asset(
            "assets/newlogo.png",
            height: 104,
            width: 104,
            fit: BoxFit.cover,
          ),
          Column(
            children: [
              Text(
                "Welcome to Teledoc",
                style: GoogleFonts.poppins(
                    fontSize: 24, fontWeight: FontWeight.w600, color: black),
              ),
              Text(
                "Welcome to Teledoc",
                style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: textColor),
              ),
            ],
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16.0, left: 16),
                child: Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Text(
                    'Name',
                    style: GoogleFonts.plusJakartaSans(
                        color: black,
                        fontWeight: FontWeight.w500,
                        fontSize: 14),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 10, right: 10),
                padding: const EdgeInsets.all(8),
                child: TextFormField(
                  controller: _emailController,
                  style: GoogleFonts.plusJakartaSans(color: black),
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: borderColor)),
                      errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: borderColor)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: borderColor)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: borderColor)),
                      hintText: "Enter Full Name",
                      hintStyle: GoogleFonts.plusJakartaSans(
                          color: black, fontSize: 12)),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16.0, left: 16),
                child: Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Text(
                    'Email',
                    style: GoogleFonts.plusJakartaSans(
                        color: black,
                        fontWeight: FontWeight.w500,
                        fontSize: 14),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 10, right: 10),
                padding: const EdgeInsets.all(8),
                child: TextFormField(
                  controller: _emailController,
                  style: GoogleFonts.plusJakartaSans(color: black),
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: borderColor)),
                      errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: borderColor)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: borderColor)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: borderColor)),
                      hintText: "Create Email ",
                      hintStyle: GoogleFonts.plusJakartaSans(
                          color: black, fontSize: 12)),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 16),
                child: Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Text(
                    'Password',
                    style: GoogleFonts.plusJakartaSans(
                        color: black,
                        fontWeight: FontWeight.w500,
                        fontSize: 14),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 10, right: 10),
                padding: const EdgeInsets.all(8),
                child: TextFormField(
                  controller: _passwordController,
                  style: GoogleFonts.plusJakartaSans(color: black),
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: borderColor)),
                      errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: borderColor)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: borderColor)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: borderColor)),
                      hintText: "Create Password",
                      hintStyle: GoogleFonts.plusJakartaSans(
                          color: black, fontSize: 12)),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SaveButton(
              title: "Sign Up",
              onTap: () {},
            ),
          ),
          Image.asset(
            "assets/or.png",
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8),
            child: SocialLoginButton(
              text: "Continue with Google",
              buttonType: SocialLoginButtonType.google,
              onPressed: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8),
            child: SocialLoginButton(
              text: "Continue with Facebook",
              buttonType: SocialLoginButtonType.facebook,
              onPressed: () {},
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (builder) => LoginScreen()));
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text.rich(TextSpan(
                  text: 'Already have an account? ',
                  children: <InlineSpan>[
                    TextSpan(
                      text: 'Sign In',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: mainColor),
                    )
                  ])),
            ),
          ),
        ],
      ),
    );
  }
}
