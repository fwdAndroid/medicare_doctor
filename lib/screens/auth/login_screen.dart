import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medicare_doctor/screens/auth/signup_screen.dart';
import 'package:medicare_doctor/screens/main/main_dashboard.dart';
import 'package:medicare_doctor/uitls/colors.dart';
import 'package:medicare_doctor/widgets/save_button.dart';
import 'package:social_login_buttons/social_login_buttons.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                "Hello Again!",
                style: GoogleFonts.poppins(
                    fontSize: 24, fontWeight: FontWeight.w600, color: black),
              ),
              Text(
                "Welcome back you’ve been missed!",
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
                      hintText: "Enter Email Address",
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
                      hintText: "Enter Password",
                      hintStyle: GoogleFonts.plusJakartaSans(
                          color: black, fontSize: 12)),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(
                      checkColor: Colors.white,
                      value: isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value!;
                        });
                      },
                    ),
                    Text(
                      'Remember Me',
                      style: GoogleFonts.plusJakartaSans(
                          color: black,
                          fontWeight: FontWeight.w500,
                          fontSize: 14),
                    ),
                  ],
                ),
                TextButton(onPressed: () {}, child: Text("Forgot Password"))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SaveButton(
              title: "Login",
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (builder) => MainDashboard()));
              },
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
                  MaterialPageRoute(builder: (builder) => SignupScreen()));
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text.rich(TextSpan(
                  text: 'Don’t have an account? ',
                  children: <InlineSpan>[
                    TextSpan(
                      text: 'Sign Up',
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
