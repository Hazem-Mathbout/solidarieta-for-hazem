import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:solidarieta/versionOne/src/core/providers/bottom_navbar_index.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    var _currentIndex = Provider.of<BottomNavbarIndex>(context, listen: false);
    return Padding(
      padding: EdgeInsets.fromLTRB(10.0, 0.0, 5.0, 10.0),
      child: BottomNavyBar(
        selectedIndex: _currentIndex.getCurrentIndex(),
        showElevation: false,
        itemCornerRadius: 15,
        curve: Curves.easeIn,
        onItemSelected: (index) =>
            setState(() => _currentIndex.updateCurrentIndex(index)),
        items: <BottomNavyBarItem>[
          navItem(LineAwesomeIcons.calendar, 'Calendario'),
          navItem(LineAwesomeIcons.newspaper, 'Notizia'),
          navItem(Icons.access_time, 'Preghiere'),
          navItem(LineAwesomeIcons.alternate_map_marked, 'Indirizzo'),
          navItem(LineAwesomeIcons.compass, 'Qibla'),
        ],
      ),
    );
  }
}

navItem(IconData icon, String name) {
  return BottomNavyBarItem(
    textAlign: TextAlign.center,
    icon: Icon(icon),
    activeColor: Color.fromRGBO(0, 133, 119, 1),
    inactiveColor: Color.fromRGBO(0, 133, 119, 1),
    title: Text(name),
  );
}
