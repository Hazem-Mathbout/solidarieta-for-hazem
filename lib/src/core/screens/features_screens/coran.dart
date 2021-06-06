import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:quran/quran.dart' as quran;
import 'package:solidarieta/src/core/screens/features_screens/sura_screen.dart';

class Coran extends StatefulWidget {
  @override
  _CoranState createState() => _CoranState();
}

class _CoranState extends State<Coran> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text(
          "القرآن الكريم",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24,
            color: Colors.black,
            fontFamily: ArabicFonts.Amiri,
            package: 'google_fonts_arabic',
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.grey[700],
            ),
            onPressed: () => Navigator.pop(context)),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  physics: BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  itemCount: 114,
                  itemBuilder: (context, index) => mySura(index + 1)),
            ),
          ],
        ),
      ),
    );
  }

  mySura(int surahNumber) {
    // ArabicNumbers arabicNumber = ArabicNumbers();

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TheSuraScreen(suraNum: surahNumber),
          ),
        );
      },
      child: Column(
        children: [
          Container(
            height: 80.0,
            decoration: BoxDecoration(
              color: surahNumber % 2 == 0 ? Colors.grey[100] : Colors.grey[300],
              borderRadius: BorderRadius.only(
                topLeft: surahNumber == 1
                    ? Radius.circular(25.0)
                    : Radius.circular(0.0),
                topRight: surahNumber == 1
                    ? Radius.circular(25.0)
                    : Radius.circular(0.0),
                bottomLeft: surahNumber == 114
                    ? Radius.circular(25.0)
                    : Radius.circular(0.0),
                bottomRight: surahNumber == 114
                    ? Radius.circular(25.0)
                    : Radius.circular(0.0),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                20,
                (surahNumber == 1 || surahNumber == 114) ? 15 : 10,
                20,
                10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            quran.getSurahName(surahNumber) + "  -  ",
                            style: TextStyle(
                              fontSize: 17.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "سورة " + quran.getSuraArabicName(surahNumber),
                            // "سورة  " + arabicNumber.convert(surahNumber),
                            style: TextStyle(
                              fontSize: 17.0,
                              color: Colors.black,
                              fontFamily: ArabicFonts.Amiri,
                              package: 'google_fonts_arabic',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Text(surahNumber.toString()),
                    ],
                  ),
                  Text(quran.getVerseCount(surahNumber).toString() +
                      " ayah, " +
                      quran.getPlaceOfRevelation(surahNumber))
                ],
              ),
            ),
          ),
          Divider(
            height: surahNumber == 114 ? 0.0 : 1.0,
            color: Colors.black,
            indent: surahNumber == 114 ? 10000.0 : 50,
          ),
        ],
      ),
    );
  }
}
