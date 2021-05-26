import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:solidarieta/src/core/components/widgets/bottom_navigation_bar.dart';
import 'package:solidarieta/src/core/components/widgets/end_drawer.dart';
import 'package:solidarieta/src/core/components/widgets/settings_drawer.dart';
import 'package:solidarieta/src/core/providers/bottom_navbar_index.dart';
import 'package:solidarieta/src/core/screens/the_main_screens/calendar_screen.dart';
import 'package:solidarieta/src/core/screens/the_main_screens/map_screen.dart';
import 'package:solidarieta/src/core/screens/the_main_screens/prayers_screen.dart';
import 'package:solidarieta/src/core/screens/the_main_screens/qibla_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

final globalKey = GlobalKey<ScaffoldState>();

class _HomeScreenState extends State<HomeScreen> {
  List pages = [
    Calendar(),
    // Blogs(),
    PrayerTimings(),
    MapDirection(),
    Qibla(),
  ];
  @override
  Widget build(BuildContext context) {
    var _currentPage = Provider.of<BottomNavbarIndex>(context, listen: true);
    int ind = _currentPage.getCurrentIndex();
    Color color = Theme.of(context).primaryColor;

    return Scaffold(
      key: globalKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.settings, color: color),
          onPressed: () {
            globalKey.currentState.openDrawer();
          },
        ),
        actions: [
          Builder(
            builder: (context) {
              return IconButton(
                icon: Icon(
                  LineAwesomeIcons.bars,
                  color: Theme.of(context).primaryColor,
                  size: 28.0,
                ),
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
              );
            },
          )
        ],
      ),
      endDrawer: DrawerMenu(),
      drawer: TheDrawer(),
      body: pages[ind],
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
