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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: ListView.builder(
              physics: BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              scrollDirection: Axis.horizontal,
              itemCount: allNames.length,
              itemBuilder: (context, index) {
                var name = allNames[index];
                return unNome(context, index, name.arabicName,
                    name.italianoName, name.details);
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
    margin: EdgeInsets.only(top: 30),
    padding: EdgeInsets.only(right: 20, left: 20),
    width: MediaQuery.of(context).size.width * 0.8,
    child: ListView(
      physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
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
