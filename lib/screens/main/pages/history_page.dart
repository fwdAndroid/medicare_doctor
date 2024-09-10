import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medicare_doctor/screens/main/setting_pages/notification_screen.dart';
import 'package:medicare_doctor/screens/main/setting_pages/privacy_policy.dart';
import 'package:medicare_doctor/screens/main/setting_pages/support.dart';
import 'package:medicare_doctor/uitls/colors.dart';
import 'package:medicare_doctor/widgets/logout_widget.dart';
import 'package:medicare_doctor/widgets/save_button.dart';
import 'package:share/share.dart';

class HistoryPage extends StatefulWidget {
  final Map<String, dynamic> userData;

  const HistoryPage({super.key, required this.userData});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool get isGoogleSignIn =>
      _auth.currentUser?.providerData[0].providerId == 'google.com';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          "Profile",
          style: GoogleFonts.poppins(fontSize: 18, color: appColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(widget.userData['photoURL']),
                  ),
                  Text(
                    widget.userData['doctorName'],
                    style: GoogleFonts.poppins(
                        color: appColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    widget.userData['email'],
                    style: GoogleFonts.poppins(
                        color: appColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
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
                      //         builder: (builder) => ShowServices()));
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
                              builder: (builder) => NotificationScreen()));
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
