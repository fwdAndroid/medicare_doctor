import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medicare_doctor/uitls/colors.dart';
import 'package:medicare_doctor/uitls/message_utils.dart';
import 'package:medicare_doctor/website_medicare/web_screens/web_auth/web_sign_in.dart';
import 'package:medicare_doctor/widgets/save_button.dart';

class WebForgotPassword extends StatefulWidget {
  const WebForgotPassword({super.key});

  @override
  State<WebForgotPassword> createState() => _WebForgotPasswordState();
}

class _WebForgotPasswordState extends State<WebForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: const [
                _FormSection(),
                _ImageSection(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _FormSection extends StatefulWidget {
  const _FormSection({Key? key}) : super(key: key);

  @override
  State<_FormSection> createState() => _FormSectionState();
}

class _FormSectionState extends State<_FormSection> {
  bool passwordVisible = false;
  TextEditingController _emailController = TextEditingController();
  bool _isLoading = false;
  bool isGoogle = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 448,
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Log in",
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 25.63),
          ),
          const SizedBox(height: 41),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Email Address",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            ),
          ),
          const SizedBox(height: 9),
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
                  hintStyle:
                      GoogleFonts.plusJakartaSans(color: black, fontSize: 12)),
            ),
          ),
          const SizedBox(height: 30),
          _isLoading
              ? CircularProgressIndicator()
              : SaveButton(
                  title: "Forogot Password",
                  onTap: () async {
                    if (_emailController.text.isEmpty) {
                      showMessageBar("Email is Required", context);
                    } else {
                      setState(() {
                        _isLoading = true;
                      });
                      await FirebaseAuth.instance
                          .sendPasswordResetEmail(
                              email: _emailController.text.trim())
                          .then((value) => {
                                FirebaseAuth.instance.signOut(),
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (builder) => WebSignInPage()))
                              });
                      showMessageBar(
                          "Email verification link is sent", context);
                      setState(() {
                        _isLoading = false;
                      });
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (builder) => WebSignInPage()));
                    }
                  },
                ),
        ],
      ),
    );
  }
}

class _ImageSection extends StatelessWidget {
  const _ImageSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              "assets/logos.png",
              height: 300,
            ),
          ),
        ],
      ),
    );
  }
}
