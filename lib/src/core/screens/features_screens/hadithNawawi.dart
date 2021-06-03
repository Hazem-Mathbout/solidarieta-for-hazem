import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:solidarieta/src/core/models/nawawiaModel.dart';

class HadithNawawi extends StatefulWidget {
  final int id;

  HadithNawawi({@required this.id});

  @override
  _HadithNawawiState createState() => _HadithNawawiState();
}

class _HadithNawawiState extends State<HadithNawawi> {
  @override
  Widget build(BuildContext context) {
    int id = widget.id;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          nawawis[id].key,
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 15,
            fontWeight: FontWeight.bold,
            fontFamily: ArabicFonts.Cairo,
            package: 'google_fonts_arabic',
          ),
        ),
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back_ios,
                color: Theme.of(context).primaryColor)),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: ListView(
          physics:
              BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: Container(
                    color: Theme.of(context).primaryColor,
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        nawawis[id].nameHadith,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontFamily: ArabicFonts.Cairo,
                          package: 'google_fonts_arabic',
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Text(
                      nawawis[id].textHadith,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: ArabicFonts.Lemonada,
                        package: 'google_fonts_arabic',
                      ),
                    ),
                  ),
                ),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: Container(
                    color: Theme.of(context).primaryColor,
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        "تفسير الحديث",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontFamily: ArabicFonts.Cairo,
                          package: 'google_fonts_arabic',
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Theme.of(context).primaryColor, width: 2),
                    ),
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 20),
                        child: Text(
                          nawawis[id].explanationHadith,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontFamily: ArabicFonts.Amiri,
                            package: 'google_fonts_arabic',
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
