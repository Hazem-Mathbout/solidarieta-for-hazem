import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:solidarieta/src/core/models/nomi_di_dio.dart';

class GodNames extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Nomi Di Dio",
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon:
              Icon(Icons.arrow_back_ios, color: Theme.of(context).primaryColor),
        ),
        elevation: 0.0,
      ),
      body: Column(
        children: [
          Container(
            // padding: EdgeInsets.fromLTRB(24.0, 10, 24, 8),
            height: MediaQuery.of(context).size.height * 0.42,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: allNames.length,
              itemBuilder: (context, index) {
                var name = allNames[index];
                return unNome(context, index, name.arabicName,
                    name.italianoName, name.details);
              },
            ),
          ),
          SizedBox(height: 20),
          Text(
            "أهمية معرفة أسماء الله الحسنى",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: ArabicFonts.Cairo,
              package: 'google_fonts_arabic',
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.39,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: importances.length,
              itemBuilder: (context, index) {
                var imp = importances[index];
                return anImportance(context, imp.title, imp.body);
              },
            ),
          ),
        ],
      ),
    );
  }
}

unNome(BuildContext context, int index, String arabicName, String italianoName,
    String details) {
  return Container(
    padding: EdgeInsets.only(right: 20, left: 20),
    width: MediaQuery.of(context).size.width * 0.8,
    child: ListView(
      children: [
        if (index % 2 == 0) SizedBox(height: 30),
        Column(
          crossAxisAlignment: index % 2 != 0
              ? CrossAxisAlignment.end
              : CrossAxisAlignment.start,
          children: [
            Container(
              height: 40,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Color.fromRGBO(116, 222, 122, 1),
                    Color.fromRGBO(34, 193, 195, 1),
                  ],
                ),
              ),
              child: Center(
                child: Text(
                  (index + 1).toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
        Container(
          // height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color.fromRGBO(34, 193, 195, 1),
                Color.fromRGBO(116, 222, 122, 1),
              ],
            ),
          ),
          child: Center(
            child: Padding(
              padding: EdgeInsets.fromLTRB(15, 20, 20, 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    arabicName,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontFamily: ArabicFonts.Rakkas,
                      package: 'google_fonts_arabic',
                    ),
                  ),
                  Text(
                    italianoName,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontFamily: 'Pattaya',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Text(
              details,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontFamily: ArabicFonts.Amiri,
                package: 'google_fonts_arabic',
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

anImportance(BuildContext context, String title, String body) {
  return Container(
    padding: EdgeInsets.only(right: 20, left: 20),
    width: MediaQuery.of(context).size.width * 0.8,
    child: ListView(
      children: [
        SizedBox(height: 20),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              bottomLeft: Radius.circular(30),
            ),
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color.fromRGBO(250, 174, 123, 1),
                Color.fromRGBO(67, 35, 113, 1),
              ],
            ),
          ),
          child: Center(
            child: Padding(
              padding: EdgeInsets.fromLTRB(15, 10, 20, 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: Text(
                      title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontFamily: ArabicFonts.Cairo,
                        fontWeight: FontWeight.bold,
                        package: 'google_fonts_arabic',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 20),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              bottomLeft: Radius.circular(30),
            ),
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color.fromRGBO(67, 35, 113, 1),
                Color.fromRGBO(250, 174, 123, 1),
              ],
            ),
          ),
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: Text(
                      body,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontFamily: ArabicFonts.Cairo,
                        package: 'google_fonts_arabic',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
