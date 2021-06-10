import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:solidarieta/src/core/components/widgets/drawerLink.dart';
import 'package:solidarieta/src/core/screens/fixed_screens/aboutUs.dart';
import 'package:solidarieta/src/core/screens/fixed_screens/informazioni.dart';
import 'package:solidarieta/src/core/screens/fixed_screens/moscheaProgetto.dart';

SetLink notifications = SetLink(
    text: 'Notifiche',
    icon: LineAwesomeIcons.globe_with_europe_shown,
    color: Colors.orange);

SetLink aboutUs = SetLink(
  text: "Sull'Associazione",
  icon: LineAwesomeIcons.comment_1,
  color: Colors.red,
);
SetLink infos = SetLink(
  text: "Informazioni",
  icon: LineAwesomeIcons.info,
  color: Colors.green,
);
SetLink moscheaProgetto = SetLink(
  text: "La nuova moschea",
  icon: LineAwesomeIcons.mosque,
  color: Colors.blue,
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
// ------------------------

Uri facebooklink = Uri.parse(
    "https://www.facebook.com/La-Solidarietà-Associazione-Tadaamun-101413525364171/");

SetLink facebook = SetLink(
  text: "Facebook : La Solidarietà",
  icon: LineAwesomeIcons.facebook_f,
  color: Colors.black54,
  link: facebooklink.toString(),
);
SetLink website = SetLink(
  text: "Sito web dell'associazione",
  icon: LineAwesomeIcons.mosque,
  color: Colors.black54,
  link: 'https://associazionesolidarieta.wordpress.com/',
);
SetLink youtube = SetLink(
  text: "Youtube : ass.tadaamun",
  icon: LineAwesomeIcons.youtube,
  color: Colors.black54,
  link: "https://www.youtube.com/channel/UCsSMvPkxn56890UVSB-AhsQ",
);
SetLink instagram = SetLink(
  text: "Instagram : @ass.tadaamun",
  icon: LineAwesomeIcons.instagram,
  color: Colors.black54,
  link: "https://www.instagram.com/ass.tadaamun/",
);
SetLink donation = SetLink(
  text: "Donare per l'associazione",
  icon: LineAwesomeIcons.donate,
  color: Colors.black54,
  link: "https://www.gofundme.com/f/associazione-la-solidariet",
);
// ------------------------
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
  link: "https://associazione-la-soli.flycricket.io/privacy.html",
);

SetLink condizioni = SetLink(
  text: "Condizioni generali di uso",
  icon: LineAwesomeIcons.alternate_file,
  color: Colors.blueGrey,
  link: "https://associazione-la-soli.flycricket.io/terms.html",
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
                        child: Column(
                          children: [
                            notifications,
                            InkWell(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AboutUs(),
                                  )),
                              child: aboutUs,
                            ),
                            InkWell(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MoscheaProject(),
                                  )),
                              child: moscheaProgetto,
                            ),
                            InkWell(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Informazioni(),
                                  )),
                              child: infos,
                            ),
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
                            facebook,
                            website,
                            youtube,
                            instagram,
                            donation,
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
                      SizedBox(height: 10.0),
                      Center(
                        child: Text(
                          "Developer : idboubker1998@gmail.com",
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
