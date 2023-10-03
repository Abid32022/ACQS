import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled6/utilities/colors.dart';
import 'package:untitled6/view/screens/books.dart';
import 'package:untitled6/view/screens/home/home.dart';
import 'package:untitled6/view/screens/lecture.dart';
import '../Profile.dart';
import '../almahazaroon.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0; //default index

  final List<Widget> _widgetOptions = [
     const HomeScreen(),
    AlmahazaratScreen(),
    Lecture(title: "مركز الدراسات الإسلامية"),
     BooksScreen(),
    const UserProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
          fontFamily: 'gesndbook',
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
          fontFamily: 'gesndbook',
        ),

        elevation: 0.5,
        selectedItemColor: kPrimaryColor,
        unselectedItemColor: Color(0xff979797),
        selectedIconTheme: CupertinoIconThemeData(color: kPrimaryColor),
        unselectedIconTheme: CupertinoIconThemeData(color: Color(0xff979797)),

        showUnselectedLabels: true,
        backgroundColor: Colors.white,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items:  const [
          BottomNavigationBarItem(
            label: 'الرئيسية',
            icon: ImageIcon(
              AssetImage("lib/assets/images/home_ic.png"),
            ),
          ),
          BottomNavigationBarItem(
            label: 'المحاضرون',
            icon: ImageIcon(
              AssetImage("lib/assets/images/bottom2_ic.png"),
            ),
          ),
          BottomNavigationBarItem(
              label: 'المحاضرات',

            icon: ImageIcon(
              AssetImage("lib/assets/images/center.png"),
            ),
            ),

          BottomNavigationBarItem(
            label: 'الكتب',
            icon: ImageIcon(
              AssetImage("lib/assets/images/bottom3_ic.png"),
            ),
          ),
          BottomNavigationBarItem(
            label: 'حسابي',
            icon: ImageIcon(
              AssetImage("lib/assets/images/bottom4_ic.png"),
            ),
          ),
        ],
      ),
    );
  }
}
