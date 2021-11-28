import 'package:shared_preferences/shared_preferences.dart';

Future<List<bool>> getSharedPrefrences() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<bool> listPrayerNotifications = [];
  bool fajr = prefs.getBool("fajr") ?? true;
  bool duher = prefs.getBool("duher") ?? true;
  bool asr = prefs.getBool("asr") ?? true;
  bool maghrib = prefs.getBool("maghrib") ?? true;
  bool isha = prefs.getBool("isha") ?? true;
  listPrayerNotifications = [fajr, duher, asr, maghrib, isha];
  return listPrayerNotifications;
}

Future updateSharedPrefrences(String prayerName, bool lastvalue) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  if (prayerName == "Fajr") {
    prefs.setBool("fajr", !lastvalue);
  }
  if (prayerName == "Duhr") {
    prefs.setBool("duher", !lastvalue);
  }
  if (prayerName == "Asr") {
    prefs.setBool("asr", !lastvalue);
  }
  if (prayerName == "Maghreb") {
    prefs.setBool("maghrib", !lastvalue);
  }
  if (prayerName == "Isha") {
    prefs.setBool("isha", !lastvalue);
  }
}
