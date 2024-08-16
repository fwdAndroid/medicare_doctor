import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medicare_doctor/screens/main/main_dashboard.dart';
import 'package:medicare_doctor/uitls/colors.dart';
import 'package:medicare_doctor/uitls/image_utils.dart';
import 'package:medicare_doctor/widgets/save_button.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController customerFullNameContoller = TextEditingController();
  TextEditingController customerPhoneNumberController = TextEditingController();
  bool _isLoading = false;
  Uint8List? _image;
  String? imageUrl;
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    // Fetch data from Firestore
    DocumentSnapshot doc = await FirebaseFirestore.instance
        .collection('doctors')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    // Update the controllers with the fetched data
    setState(() {
      customerFullNameContoller.text = data['fullName'];
      customerPhoneNumberController.text = data['contactNumber'];
      imageUrl = data['photoURL'];
    });
  }

  Future<void> selectImage() async {
    Uint8List ui = await pickImage(ImageSource.gallery);
    setState(() {
      _image = ui;
    });
  }

  Future<String> uploadImageToStorage(Uint8List image) async {
    Reference ref = FirebaseStorage.instance
        .ref()
        .child('doctors')
        .child('${FirebaseAuth.instance.currentUser!.uid}.jpg');
    UploadTask uploadTask = ref.putData(image);
    TaskSnapshot snapshot = await uploadTask;
    return await snapshot.ref.getDownloadURL();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: white,
              )),
          title: Text(
            "Edit Profile",
            style: GoogleFonts.workSans(
                color: white, fontSize: 18, fontWeight: FontWeight.w500),
          ),
          automaticallyImplyLeading: false,
          backgroundColor: mainColor,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () => selectImage(),
                  child: _image != null
                      ? CircleAvatar(
                          radius: 59, backgroundImage: MemoryImage(_image!))
                      : imageUrl != null
                          ? CircleAvatar(
                              radius: 59,
                              backgroundImage: NetworkImage(imageUrl!))
                          : Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset("assets/person.png"),
                            ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: customerFullNameContoller,
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
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8),
                child: TextFormField(
                  controller: customerPhoneNumberController,
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
              Center(
                child: _isLoading
                    ? CircularProgressIndicator(
                        color: mainColor,
                      )
                    : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SaveButton(
                            title: "Confirm",
                            onTap: () async {
                              setState(() {
                                _isLoading = true;
                              });

                              String? downloadUrl;
                              if (_image != null) {
                                downloadUrl =
                                    await uploadImageToStorage(_image!);
                              } else {
                                downloadUrl = imageUrl;
                              }

                              await FirebaseFirestore.instance
                                  .collection("doctors")
                                  .doc(FirebaseAuth.instance.currentUser!.uid)
                                  .update({
                                "fullName":
                                    customerFullNameContoller.text.trim(),
                                "contactNumber":
                                    customerPhoneNumberController.text.trim(),
                                "photoURL": downloadUrl
                              });
                              setState(() {
                                _isLoading = false;
                              });
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (builder) => MainDashboard()));
                            }),
                      ),
              ),
            ],
          ),
        ));
  }
}
