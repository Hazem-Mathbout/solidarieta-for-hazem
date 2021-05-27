import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:solidarieta/src/core/components/widgets/feature_indrawer.dart';

class DrawerMenu extends StatefulWidget {
  @override
  _DrawerMenuState createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  Feature quran = Feature(
    imgUrl: "assets/images/features/quran.jpg",
    color: Colors.orange,
    title: "Corano\nالقرآن الكريم",
    index: 0,
  );

  Feature hadith = Feature(
    imgUrl: "assets/images/features/hadith.jpeg",
    color: Colors.cyan,
    title: "Hadith profetico\nالاربعين النووية",
    index: 1,
  );

  Feature names = Feature(
    imgUrl: "assets/images/features/names.jpg",
    color: Colors.white,
    title: "Nomi di Dio\nاسماء الله الحسنى",
    index: 2,
  );

  Feature hajj = Feature(
    imgUrl: "assets/images/features/kaaba.jpg",
    color: Colors.yellow,
    title: "Pellegrinaggio\nالحج",
    index: 3,
  );

  Feature omra = Feature(
    imgUrl: "assets/images/features/masjid_nabawi.jpg",
    color: Colors.green,
    title: "Umrah\nالعمرة",
    index: 4,
  );

  Feature duaa = Feature(
    imgUrl: "assets/images/features/duaa.jpg",
    color: Colors.pink,
    title: "La supplica\nحصن المسلم",
    index: 5,
  );

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: Container(
        width: MediaQuery.of(context).size.width,
        // color: Colors.black87,
        color: Colors.grey[500],
        child: Drawer(
          elevation: 0,
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 0.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Caratteristiche',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32.0,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          LineAwesomeIcons.chevron_circle_left,
                          color: Colors.white,
                          size: 30.0,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.0),
                Expanded(
                  child: ListView(
                    physics: BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()),
                    children: [
                      quran,
                      hadith,
                      names,
                      // hajj,
                      // omra,
                      duaa,
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
