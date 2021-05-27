import 'dart:convert';

Citation citationFromJson(String str) => Citation.fromJson(json.decode(str));

String citationToJson(Citation data) => json.encode(data.toJson());

class Citation {
  Citation({
    this.hisnulmuslim,
  });

  final List<Hisnulmuslim> hisnulmuslim;

  factory Citation.fromJson(Map<String, dynamic> json) => Citation(
        hisnulmuslim: List<Hisnulmuslim>.from(
            json["Hisnulmuslim"].map((x) => Hisnulmuslim.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Hisnulmuslim": List<dynamic>.from(hisnulmuslim.map((x) => x.toJson())),
      };
}

class Hisnulmuslim {
  Hisnulmuslim({
    this.title,
    this.hadiths,
  });

  final String title;
  final List<Hadith> hadiths;

  factory Hisnulmuslim.fromJson(Map<String, dynamic> json) => Hisnulmuslim(
        title: json["title"],
        hadiths:
            List<Hadith>.from(json["Hadiths"].map((x) => Hadith.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "Hadiths": List<dynamic>.from(hadiths.map((x) => x.toJson())),
      };
}

class Hadith {
  Hadith({
    this.id,
    this.arabicText,
    this.repeat,
  });

  final int id;
  final String arabicText;
  final int repeat;

  factory Hadith.fromJson(Map<String, dynamic> json) => Hadith(
        id: json["ID"],
        arabicText: json["ARABIC_TEXT"],
        repeat: json["REPEAT"],
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "ARABIC_TEXT": arabicText,
        "REPEAT": repeat,
      };
}
