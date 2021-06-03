import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:solidarieta/src/core/components/widgets/drawerLink.dart';

SetLink notifications = SetLink(
    text: 'Notifiche',
    icon: LineAwesomeIcons.globe_with_europe_shown,
    color: Colors.orange);

SetLink aboutTheApp = SetLink(
  text: "Sull'App",
  icon: LineAwesomeIcons.comment_1,
  color: Colors.red,
);
SetLink suonerie = SetLink(
  text: "Suonerie",
  icon: LineAwesomeIcons.bell,
  color: Colors.cyan,
);
SetLink shareIt = SetLink(
  text: "Condividi l'app con i tuoi amici",
  icon: LineAwesomeIcons.alternate_share_square,
  color: Colors.black26,
  link: "share",
);
SetLink facebook = SetLink(
  text: "facebook.com/lasolidarieta-mialn",
  icon: LineAwesomeIcons.facebook_f,
  color: Colors.black26,
  link: 'https://www.facebook.com/',
);
SetLink website = SetLink(
  text: "www.lasolidarieta-mialn.com",
  icon: LineAwesomeIcons.chrome,
  color: Colors.black26,
  link: 'https://www.google.com/',
);
SetLink twitter = SetLink(
  text: "twitter.com/lasolidarieta-mialn",
  icon: LineAwesomeIcons.twitter,
  color: Colors.black54,
  link: "https://twitter.com/",
);
SetLink feedback = SetLink(
  text: "Retroazione",
  icon: LineAwesomeIcons.star_1,
  color: Colors.black26,
  link: "rating",
);
SetLink cookies = SetLink(
  text: "Cookie",
  icon: LineAwesomeIcons.cookie_bite,
  color: Colors.blueGrey,
);

SetLink condizioni = SetLink(
  text: "Condizioni generali di uso",
  icon: LineAwesomeIcons.alternate_file,
  color: Colors.blueGrey,
);
SetLink privacy = SetLink(
  text: "Informativa sulla privacy",
  icon: LineAwesomeIcons.alternate_list,
  color: Colors.blueGrey,
);
SetLink legale = SetLink(
  text: "Area legale",
  icon: LineAwesomeIcons.alternate_shield,
  color: Colors.blueGrey,
);

class TheDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.black,
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
                        'Impostazioni',
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
                      Container(
                        color: Color.fromRGBO(50, 50, 51, 1),
                        child: notifications,
                      ),
                      SizedBox(height: 30.0),
                      Container(
                        color: Color.fromRGBO(50, 50, 51, 1),
                        child: Column(
                          children: [
                            aboutTheApp,
                            suonerie,
                          ],
                        ),
                      ),
                      SizedBox(height: 30.0),
                      Container(
                        color: Color.fromRGBO(50, 50, 51, 1),
                        child: Column(
                          children: [
                            condizioni,
                            privacy,
                          ],
                        ),
                      ),
                      SizedBox(height: 30.0),
                      Container(
                        color: Color.fromRGBO(50, 50, 51, 1),
                        child: Column(
                          children: [
                            shareIt,
                            facebook,
                            website,
                            twitter,
                            feedback,
                          ],
                        ),
                      ),
                      SizedBox(height: 30.0),
                      Center(
                        child: Text(
                          "© 2021 Copyright Associazione La Solidarietà",
                          textAlign: TextAlign.center,
                          textScaleFactor: 1.1,
                          style: TextStyle(
                            fontSize: 10.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                      ),
                      SizedBox(height: 30.0),
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
