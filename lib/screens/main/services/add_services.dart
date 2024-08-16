import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medicare_doctor/screens/main/main_dashboard.dart';
import 'package:medicare_doctor/services/database_methods.dart';
import 'package:medicare_doctor/uitls/colors.dart';
import 'package:medicare_doctor/uitls/message_utils.dart';
import 'package:medicare_doctor/widgets/save_button.dart';
import 'package:medicare_doctor/widgets/text_form_field.dart';

class AddServices extends StatefulWidget {
  const AddServices({super.key});

  @override
  State<AddServices> createState() => _AddServicesState();
}

class _AddServicesState extends State<AddServices> {
  TextEditingController serviceNameController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController discountController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

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
    'Gynecology',
    'Psychology',
    'Medicine',
    'Oncology',
    'ENT'
  ];

  // Image
  Uint8List? _image;

  // Loading bar
  bool isAdded = false;

  // Error message for discount
  String? discountErrorMessage;

  @override
  void initState() {
    super.initState();
    discountController.addListener(_validateDiscount);
  }

  @override
  void dispose() {
    discountController.removeListener(_validateDiscount);
    super.dispose();
  }

  void _validateDiscount() {
    final input = discountController.text;
    if (input.isNotEmpty) {
      final value = int.tryParse(input);
      setState(() {
        discountErrorMessage = (value != null && value > 100)
            ? 'Discount cannot be more than 100%'
            : null;
      });
    } else {
      setState(() {
        discountErrorMessage = null;
      });
    }
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
          ),
        ),
        title: Text(
          "Add Service",
          style: GoogleFonts.workSans(
            color: white,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: mainColor,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection("doctors")
            .where("uid", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData || snapshot.data == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final documents = (snapshot.data as QuerySnapshot?)?.docs ??
              <QueryDocumentSnapshot>[];

          if (documents.isEmpty) {
            return const Center(
              child: Text(
                "No Doctor yet",
                style: TextStyle(color: Colors.black),
              ),
            );
          }

          return ListView.builder(
            itemCount: documents.length,
            itemBuilder: (context, index) {
              final docs = (snapshot.data as QuerySnapshot?)?.docs ??
                  <QueryDocumentSnapshot>[];
              final datas = docs.isNotEmpty
                  ? docs[index].data() as Map<String, dynamic>?
                  : null;
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8, top: 8),
                    child: TextFormInputField(
                      maxLenght: 15,
                      controller: serviceNameController,
                      hintText: "Service Name",
                      textInputType: TextInputType.emailAddress,
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
                      hint: Text("Department"),
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
                            style: GoogleFonts.nunitoSans(fontSize: 16),
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
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8, top: 8),
                    child: TextFormInputField(
                      controller: priceController,
                      hintText: "Price",
                      textInputType: TextInputType.number,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      maxLength: 30,
                      controller: descriptionController,
                      maxLines: 4,
                      decoration: InputDecoration(
                        filled: true,
                        contentPadding: EdgeInsets.all(8),
                        fillColor: Color(0xffF6F7F9),
                        hintText: "Description",
                        hintStyle: GoogleFonts.nunitoSans(fontSize: 16),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  isAdded
                      ? Center(
                          child: CircularProgressIndicator(
                            color: mainColor,
                          ),
                        )
                      : SaveButton(
                          title: "Save",
                          onTap: () async {
                            if (_image == null) {
                              showMessageBar("Image is Required", context);
                            } else if (serviceNameController.text.isEmpty) {
                              showMessageBar(
                                  "Service Name is Required", context);
                            } else if (priceController.text.isEmpty) {
                              showMessageBar("Price is Required", context);
                            } else if (descriptionController.text.isEmpty) {
                              showMessageBar(
                                  "Description is Required", context);
                            } else {
                              setState(() {
                                isAdded = true;
                              });

                              String result =
                                  await DatabaseMethods().addService(
                                serviceName: serviceNameController.text,
                                department: dropdownvalue,
                                doctorName: datas!['fullName'],
                                doctorPhoto: datas['photoURl'],
                                description: descriptionController.text,
                                servicePrice: int.parse(priceController.text),
                              );
                              setState(() {
                                isAdded = false;
                              });
                              // Handle the result accordingly
                              if (result == 'success') {
                                showMessageBar(
                                    "Services Added Successfully", context);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (builder) => MainDashboard(),
                                  ),
                                );
                              } else {
                                // Show an error message
                                showMessageBar("Failed", context);
                              }
                            }
                          },
                        ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
