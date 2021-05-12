import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solidarieta/versionOne/src/core/components/widgets/bottom_navigation_bar.dart';
import 'package:solidarieta/versionOne/src/core/providers/bottom_navbar_index.dart';
import 'package:solidarieta/versionOne/src/core/screens/blogs_screen.dart';
import 'package:solidarieta/versionOne/src/core/screens/calendar_screen.dart';
import 'package:solidarieta/versionOne/src/core/screens/map_screen.dart';
import 'package:solidarieta/versionOne/src/core/screens/prayers_screen.dart';
import 'package:solidarieta/versionOne/src/core/screens/qibla_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List pages = [
    Calendar(),
    Blogs(),
    PrayerTimings(),
    MapDirection(),
    Qibla(),
  ];
  @override
  Widget build(BuildContext context) {
    var _currentPage = Provider.of<BottomNavbarIndex>(context, listen: false);
    int ind = _currentPage.getCurrentIndex();
    Color color = Theme.of(context).primaryColor;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: Icon(Icons.settings, color: color),
        actions: [
          Icon(Icons.menu, color: color, size: 30.0),
          SizedBox(width: 14.0),
        ],
      ),
      body: pages[ind],
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
