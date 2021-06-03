import 'package:flutter/material.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class SetLink extends StatelessWidget {
  final Color color;
  final String text;
  final IconData icon;
  final String link;
  SetLink({this.color, this.text, this.icon, this.link});

  // _-------------------
  final InAppReview _inAppReview = InAppReview.instance;
  Future<void> _requestReview() => _inAppReview.requestReview();
  // _-------------------
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: link != null
          ? () {
              if (link == "rating") {
                _requestReview();
              } else if (link == "share") {
                _onShareWithEmptyOrigin(context);
              } else {
                openLink(link);
              }
            }
          : null,
      child: Container(
        height: 37.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(height: 0.0),
            Padding(
              padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 24.0,
                        width: 24.0,
                        decoration: BoxDecoration(
                          color: color,
                          borderRadius: BorderRadius.all(
                            Radius.circular(5.0),
                          ),
                        ),
                        child: Icon(
                          icon,
                          color: Colors.white,
                          size: 20.0,
                        ),
                      ),
                      SizedBox(width: 12.0),
                      Text(
                        text,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17.0,
                        ),
                      ),
                    ],
                  ),
                  Icon(
                    LineAwesomeIcons.angle_double_right,
                    color: Colors.white,
                    size: 20.0,
                  ),
                ],
              ),
            ),
            Container(
              height: 0.2,
              width: MediaQuery.of(context).size.width - 20.0,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}

_onShareWithEmptyOrigin(BuildContext context) async {
  await Share.share("text");
}

Future<void> openLink(String url) async {
  if (await canLaunch(url))
    await launch(url);
  else
    // can't launch url, there is some error
    throw "Could not launch $url";
}
