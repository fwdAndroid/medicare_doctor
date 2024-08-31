import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medicare_doctor/screens/main/setting_pages/privacy_policy.dart';
import 'package:medicare_doctor/screens/main/setting_pages/support.dart';
import 'package:medicare_doctor/uitls/colors.dart';
import 'package:medicare_doctor/website_medicare/web_screens/edit/web_edit_profile.dart';
import 'package:medicare_doctor/website_medicare/web_screens/web_auth/web_forgot_password.dart';
import 'package:medicare_doctor/website_medicare/web_widgets/header_widget.dart';
import 'package:medicare_doctor/widgets/logout_widget.dart';
import 'package:medicare_doctor/widgets/save_button.dart';

import 'package:share/share.dart';

class WebMainDashboardAccount extends StatefulWidget {
  const WebMainDashboardAccount({super.key});

  @override
  State<WebMainDashboardAccount> createState() =>
      _WebMainDashboardAccountState();
}

class _WebMainDashboardAccountState extends State<WebMainDashboardAccount> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool get isGoogleSignIn =>
      _auth.currentUser?.providerData[0].providerId == 'google.com';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // StreamBuilder(
            //     stream: FirebaseFirestore.instance
            //         .collection("users")
            //         .doc(FirebaseAuth.instance.currentUser!.uid)
            //         .snapshots(),
            //     builder: (context, AsyncSnapshot snapshot) {
            //       if (snapshot.connectionState == ConnectionState.waiting) {
            //         return Center(child: CircularProgressIndicator());
            //       }
            //       if (!snapshot.hasData || snapshot.data == null) {
            //         return Center(child: Text('No data available'));
            //       }
            //       var snap = snapshot.data;

            //       return Padding(
            //         padding: const EdgeInsets.all(8.0),
            //         child: Column(
            //           children: [
            //             CircleAvatar(
            //               radius: 50,
            //               backgroundImage: NetworkImage(snap['photoURL']),
            //             ),
            //             Text(
            //               snap['fullName'],
            //               style: GoogleFonts.workSans(
            //                   fontWeight: FontWeight.w600, fontSize: 22),
            //             ),
            //             Text(
            //               snap['email'],
            //               style: GoogleFonts.workSans(
            //                   fontWeight: FontWeight.w400, fontSize: 16),
            //             ),
            //           ],
            //         ),
            //       );
            //     }),
            const SizedBox(
              height: 8,
            ),
            Container(
              decoration: BoxDecoration(
                  color: white,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12))),
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  ListTile(
                    onTap: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (builder) => AppointmentHistory()));
                    },
                    leading: Icon(
                      Icons.post_add,
                      color: appColor,
                    ),
                    title: Text(
                      "Appointment History",
                      style: GoogleFonts.workSans(
                          fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: appColor,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8),
                    child: Divider(
                      color: borderColor,
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (builder) => WebEditProfile()));
                    },
                    leading: Icon(
                      Icons.edit,
                      color: appColor,
                    ),
                    title: Text(
                      "Edit Profile",
                      style: GoogleFonts.workSans(
                          fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: appColor,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8),
                    child: Divider(
                      color: borderColor,
                    ),
                  ),
                  if (!isGoogleSignIn)
                    ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (builder) => WebForgotPassword()));
                      },
                      leading: Icon(
                        Icons.language_outlined,
                        color: appColor,
                      ),
                      title: Text(
                        "Change Password",
                        style: GoogleFonts.workSans(
                            fontWeight: FontWeight.w500, fontSize: 16),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: appColor,
                      ),
                    ),
                  if (!isGoogleSignIn)
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8),
                      child: Divider(
                        color: borderColor,
                      ),
                    ),
                  ListTile(
                    onTap: () {
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (builder) => Payment()));
                    },
                    leading: Icon(
                      Icons.payment,
                      color: appColor,
                    ),
                    title: Text(
                      "Payment Method",
                      style: GoogleFonts.workSans(
                          fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: appColor,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8),
                    child: Divider(
                      color: borderColor,
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (builder) => NotificationScreen()));
                    },
                    leading: Icon(
                      Icons.notifications,
                      color: appColor,
                    ),
                    title: Text(
                      "Notifications",
                      style: GoogleFonts.workSans(
                          fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: appColor,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8),
                    child: Divider(
                      color: borderColor,
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      shareInviteLink(context);
                    },
                    leading: Icon(
                      Icons.group,
                      color: appColor,
                    ),
                    title: Text(
                      "Invite Friends",
                      style: GoogleFonts.workSans(
                          fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: appColor,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8),
                    child: Divider(
                      color: borderColor,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    color: mainColor,
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Text(
                        "About App",
                        style: GoogleFonts.workSans(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff5496FB)),
                      ),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (builder) => PrivacyPolicy()));
                    },
                    leading: Icon(
                      Icons.privacy_tip,
                      color: appColor,
                    ),
                    title: Text(
                      "Privacy Policy ",
                      style: GoogleFonts.workSans(
                          fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: appColor,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8),
                    child: Divider(
                      color: borderColor,
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (builder) => Support()));
                    },
                    leading: Icon(
                      Icons.help,
                      color: appColor,
                    ),
                    title: Text(
                      "Help & Support",
                      style: GoogleFonts.workSans(
                          fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: appColor,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8),
                    child: Divider(
                      color: borderColor,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SaveButton(
                  title: "Logout",
                  onTap: () {
                    showDialog<void>(
                      context: context,
                      barrierDismissible: false, // user must tap button!
                      builder: (BuildContext context) {
                        return LogoutWidget();
                      },
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }

  void shareInviteLink(BuildContext context) {
    // Replace 'YOUR_INVITE_LINK' with your actual invite link
    final String inviteLink = 'https://yourapp.com/invite?ref=friend123';

    Share.share(
      'Join our app using my invite link: $inviteLink',
      subject: 'Join us on the app!',
    );
  }
}
