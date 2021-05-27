import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'dart:convert';

import 'package:solidarieta/src/core/models/citationsModels.dart';
import 'package:solidarieta/src/core/screens/features_screens/citationDetails.dart';

Future fetchData(BuildContext context) async {
  var ll = await DefaultAssetBundle.of(context)
      .loadString("assets/hisnulmuslimData.json");
  return Citation.fromJson(json.decode(ll));
}

class Duaa extends StatefulWidget {
  @override
  _DuaaState createState() => _DuaaState();
}

class _DuaaState extends State<Duaa> {
  Future futureCitations;

  @override
  void initState() {
    super.initState();
    futureCitations = fetchData(context);
  }

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text(
          "حصن المسلم",
          style: TextStyle(
            fontFamily: ArabicFonts.Cairo,
            package: 'google_fonts_arabic',
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: color,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      backgroundColor: Colors.white,
      body: Container(
        child: FutureBuilder(
            future: futureCitations,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                Citation data = snapshot.data;
                return Padding(
                  padding: EdgeInsets.all(20),
                  child: ListView(children: [
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: Wrap(
                        children: [
                          for (var i = 0; i < 132; i++)
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          CitationDetails(id: i),
                                    ));
                              },
                              child: Container(
                                margin: EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topRight: i % 2 == 0
                                        ? Radius.circular(15)
                                        : Radius.circular(0),
                                    bottomRight: i % 2 == 0
                                        ? Radius.circular(15)
                                        : Radius.circular(0),
                                    topLeft: i % 2 != 0
                                        ? Radius.circular(15)
                                        : Radius.circular(0),
                                    bottomLeft: i % 2 != 0
                                        ? Radius.circular(15)
                                        : Radius.circular(0),
                                  ),
                                  border: Border.all(color: color, width: 2),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(6.0),
                                    child: Text(
                                      "${i + 1} - " +
                                          data.hisnulmuslim[i].title,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: ArabicFonts.Cairo,
                                        package: 'google_fonts_arabic',
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ]),
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              return Center(child: CircularProgressIndicator());
            }),
      ),
    );
  }
}
