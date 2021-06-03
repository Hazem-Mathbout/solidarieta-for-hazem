import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:solidarieta/src/core/models/citationsModels.dart';
import 'package:solidarieta/src/core/screens/features_screens/duaa.dart';

class CitationDetails extends StatefulWidget {
  final int id;
  CitationDetails({this.id});
  @override
  _CitationDetailsState createState() => _CitationDetailsState();
}

class _CitationDetailsState extends State<CitationDetails> {
  Future futureCitations;
  @override
  void initState() {
    super.initState();
    futureCitations = fetchData(context);
  }

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;
    ArabicNumbers arabicNumber = ArabicNumbers();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: color,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        child: FutureBuilder(
            future: futureCitations,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                Citation data = snapshot.data;
                var hadith = data.hisnulmuslim[widget.id];
                return Directionality(
                  textDirection: TextDirection.rtl,
                  child: Column(
                    children: [
                      Container(
                        color: color,
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 5),
                            child: Text(
                              hadith.title,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: ArabicFonts.Cairo,
                                package: 'google_fonts_arabic',
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Expanded(
                        child: ListView.builder(
                          physics: BouncingScrollPhysics(
                              parent: AlwaysScrollableScrollPhysics()),
                          itemCount: hadith.hadiths.length,
                          itemBuilder: (context, item) {
                            var citation = hadith.hadiths[item];

                            return Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Color.fromRGBO(0, 133, 119, 0.3),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20))),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20.0, vertical: 20),
                                      child: Text(
                                        arabicNumber.convert(citation.id) +
                                            " - " +
                                            citation.arabicText,
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(
                                          fontFamily: ArabicFonts.Amiri,
                                          package: 'google_fonts_arabic',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(5),
                                    margin: EdgeInsets.only(left: 40),
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).primaryColor,
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10),
                                      ),
                                    ),
                                    child: Text(
                                      "Ripetizioni : " +
                                          citation.repeat.toString(),
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
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
