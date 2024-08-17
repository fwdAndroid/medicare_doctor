import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medicare_doctor/screens/auth/login_screen.dart';
import 'package:medicare_doctor/screens/main/main_dashboard.dart';
import 'package:medicare_doctor/services/auth_methods.dart';
import 'package:medicare_doctor/uitls/colors.dart';
import 'package:medicare_doctor/uitls/image_utils.dart';
import 'package:medicare_doctor/uitls/message_utils.dart';
import 'package:medicare_doctor/widgets/save_button.dart';
import 'package:image_picker/image_picker.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _contactController = TextEditingController();
  TextEditingController _hospitalController = TextEditingController();
  TextEditingController _aboutController = TextEditingController();
  TextEditingController _experienceController = TextEditingController();

  String dropdownvalue = 'Neurology';

  // List of items in our dropdown menu
  var items = [
    'Neurology',
    'Cardiology',
    'Gynecology',
    'Pediatrics',
    'Allergy',
    'Dentist',
    'Urology',
    'Gastrology',
    'Psychology',
    'Medicine',
    'Oncology',
    'ENT'
  ];

  bool isChecked = false;
  bool passwordVisible = false;
  //Image
  Uint8List? _image;
  //loader
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    passwordVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () => selectImage(),
              child: Stack(
                children: [
                  _image != null
                      ? CircleAvatar(
                          radius: 59, backgroundImage: MemoryImage(_image!))
                      : GestureDetector(
                          onTap: () => selectImage(),
                          child: CircleAvatar(
                            radius: 59,
                            backgroundImage: AssetImage('assets/person.png'),
                          ),
                        ),
                ],
              ),
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
                    controller: _nameController,
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
                    obscureText: passwordVisible,
                    controller: _passwordController,
                    style: GoogleFonts.plusJakartaSans(color: black),
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(
                              () {
                                passwordVisible = !passwordVisible;
                              },
                            );
                          },
                        ),
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
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 16.0, left: 16),
                  child: Align(
                    alignment: AlignmentDirectional.topStart,
                    child: Text(
                      'Contact Number',
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
                    controller: _contactController,
                    keyboardType: TextInputType.number,
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
                        hintText: "Contact Number ",
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
                      'Hospital Name',
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
                    controller: _hospitalController,
                    keyboardType: TextInputType.number,
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
                        hintText: "Contact Number ",
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
                      'Experience',
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
                    controller: _experienceController,
                    keyboardType: TextInputType.number,
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
                        hintText: "Contact Number ",
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
                      'Hospital Name',
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
                    controller: _hospitalController,
                    keyboardType: TextInputType.text,
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
                        hintText: "Hospital Name ",
                        hintStyle: GoogleFonts.plusJakartaSans(
                            color: black, fontSize: 12)),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Align(
                    alignment: AlignmentDirectional.topStart,
                    child: Text(
                      'Department',
                      style: GoogleFonts.plusJakartaSans(
                          color: black,
                          fontWeight: FontWeight.w500,
                          fontSize: 14),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xffF6F7F9),
                  ),
                  margin: const EdgeInsets.only(
                      left: 8.0, right: 8, top: 4, bottom: 5),
                  padding: const EdgeInsets.only(left: 8.0, right: 8, top: 4),
                  child: DropdownButton(
                    isExpanded: true,
                    value: dropdownvalue,
                    underline: SizedBox(),
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      color: appColor,
                    ),
                    items: items.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(
                          items,
                          style: GoogleFonts.nunitoSans(fontSize: 12),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownvalue = newValue!;
                      });
                    },
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
                      'About Me',
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
                    controller: _aboutController,
                    keyboardType: TextInputType.text,
                    style: GoogleFonts.plusJakartaSans(color: black),
                    maxLines: 5,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: borderColor)),
                        errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: borderColor)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: borderColor)),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: borderColor)),
                        hintText: "About Me ",
                        hintStyle: GoogleFonts.plusJakartaSans(
                            color: black, fontSize: 12)),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: isLoading
                  ? Center(
                      child: CircularProgressIndicator(
                        color: mainColor,
                      ),
                    )
                  : SaveButton(
                      title: "Sign Up",
                      onTap: () async {
                        if (_image == null) {
                          showMessageBar("Photo is Required", context);
                        } else if (_nameController.text.isEmpty) {
                          showMessageBar(
                              "Name of the doctor is required", context);
                        } else if (_emailController.text.isEmpty) {
                          showMessageBar("Email is required", context);
                        } else if (_passwordController.text.isEmpty) {
                          showMessageBar("Password is required ", context);
                        } else if (_contactController.text.isEmpty) {
                          showMessageBar(
                              "Contact Number is required ", context);
                        } else if (_experienceController.text.isEmpty) {
                          showMessageBar("Experience is required ", context);
                        } else if (_hospitalController.text.isEmpty) {
                          showMessageBar("Hospital Name is required ", context);
                        } else if (_aboutController.text.isEmpty) {
                          showMessageBar(
                              "Doctor description is required ", context);
                        } else {
                          setState(() {
                            isLoading = true;
                          });
                          await AuthMethods().signUpUser(
                              isblocked: false,
                              email: _emailController.text.trim(),
                              department: dropdownvalue,
                              pass: _passwordController.text.trim(),
                              username: _nameController.text.trim(),
                              contact: _contactController.text.trim(),
                              about: _aboutController.text.trim(),
                              experience: _experienceController.text.trim(),
                              hospitalName: _hospitalController.text.trim(),
                              file: _image!);
                          setState(() {
                            isLoading = false;
                          });
                          showMessageBar("Registration Complete", context);
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (builder) => MainDashboard()));
                        }
                      },
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
      ),
    );
  }

  //Functions
  selectImage() async {
    Uint8List ui = await pickImage(ImageSource.gallery);
    setState(() {
      _image = ui;
    });
  }
}
