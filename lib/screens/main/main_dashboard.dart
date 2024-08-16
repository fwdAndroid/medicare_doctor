import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medicare_doctor/screens/main/pages/appointment_page.dart';
import 'package:medicare_doctor/screens/main/pages/doctor_page.dart';
import 'package:medicare_doctor/screens/main/pages/history_page.dart';
import 'package:medicare_doctor/screens/main/pages/home_page.dart';
import 'package:medicare_doctor/screens/main/pages/medicine_page.dart';
import 'package:medicare_doctor/uitls/colors.dart';

class MainDashboard extends StatefulWidget {
  @override
  _MainDashboardState createState() => _MainDashboardState();
}

class _MainDashboardState extends State<MainDashboard> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomePage(),
    DoctorPage(),
    MedicinePage(),
    AppointmentPage(),
    HistoryPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: TextStyle(color: mainColor),
        unselectedLabelStyle: TextStyle(color: textColor),
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: _currentIndex == 0
                ? Image.asset(
                    "assets/home_blue.png",
                    height: 18,
                    width: 20,
                  )
                : Image.asset(
                    "assets/home_grey.png",
                    height: 18,
                    width: 20,
                  ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: _currentIndex == 1
                ? Image.asset(
                    "assets/doctor_blue.png",
                    height: 18,
                    width: 20,
                  )
                : Image.asset(
                    "assets/doctor_grey.png",
                    height: 18,
                    width: 20,
                  ),
            label: 'Doctor',
            backgroundColor: white,
          ),
          BottomNavigationBarItem(
            icon: _currentIndex == 2
                ? Image.asset(
                    "assets/medic_blue.png",
                    height: 18,
                    width: 20,
                  )
                : Image.asset(
                    "assets/medic_grey.png",
                    height: 18,
                    width: 20,
                  ),
            label: 'Medicine',
            backgroundColor: white,
          ),
          BottomNavigationBarItem(
            icon: _currentIndex == 3
                ? Image.asset(
                    "assets/calender_blue.png",
                    height: 18,
                    width: 20,
                  )
                : Image.asset(
                    "assets/calender_grey.png",
                    height: 18,
                    width: 20,
                  ),
            label: 'Appointment',
            backgroundColor: white,
          ),
          BottomNavigationBarItem(
            icon: _currentIndex == 4
                ? Image.asset(
                    "assets/history_blue.png",
                    height: 18,
                    width: 20,
                  )
                : Image.asset(
                    "assets/history_medic.png",
                    height: 18,
                    width: 20,
                  ),
            label: 'History',
            backgroundColor: white,
          ),
        ],
      ),
    );
  }
}
