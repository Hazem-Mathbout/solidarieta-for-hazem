import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';
import 'package:quran/quran.dart' as quran;
import 'package:solidarieta/src/core/components/widgets/suraArabicName.dart';

class TheSuraScreen extends StatelessWidget {
  final int suraNum;

  const TheSuraScreen({Key key, this.suraNum}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ArabicNumbers arabicNumber = ArabicNumbers();

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          actions: [
            IconButton(
                icon: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.grey[700],
                ),
                onPressed: () => Navigator.pop(context)),
          ],
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 20.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Surah " + quran.getSurahName(suraNum)),
                      Text("" +
                          quran.getPlaceOfRevelation(suraNum) +
                          " - Versetti : " +
                          quran.getVerseCount(suraNum).toString()),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      Center(
                        child: Container(
                          height: 80.0,
                          // width: MediaQuery.of(context).size.width - 40,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/images/border.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "سورة " + getSuraArabicName(suraNum),
                              // "سورة " + arabicNumber.convert(suraNum),
                              style: TextStyle(
                                fontSize: 30,
                                color: Colors.black,
                                fontFamily: ArabicFonts.Amiri,
                                package: 'google_fonts_arabic',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      (suraNum == 1 || suraNum == 9)
                          ? SizedBox.shrink()
                          : Column(
                              children: [
                                Center(
                                  child: Text(
                                    quran.getBasmala(),
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: ArabicFonts.Amiri,
                                      package: 'google_fonts_arabic',
                                      fontSize: 30.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 30),
                              ],
                            ),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: [
                            for (int i = 1;
                                i <= quran.getVerseCount(suraNum);
                                i++)
                              vers(quran.getVerse(suraNum, i),
                                  arabicNumber.convert(i))
                          ],
                        ),
                      ),
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

vers(String vers, String aya) {
  String ayaNum = "【 $aya 】";
  return TextSpan(
    children: [
      TextSpan(
        text: " " + vers + " ",
        style: TextStyle(
          color: Colors.black,
          fontFamily: ArabicFonts.Amiri,
          package: 'google_fonts_arabic',
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
        ),
        children: [
          TextSpan(
            text: ayaNum,
            style: TextStyle(
              color: Colors.black,
              fontFamily: ArabicFonts.Amiri,
              package: 'google_fonts_arabic',
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    ],
  );
}
