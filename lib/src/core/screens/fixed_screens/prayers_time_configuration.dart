import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geocoding/geocoding.dart';

import 'package:provider/provider.dart';
import 'package:solidarieta/src/core/providers/prayers_configuration_provider.dart.dart';

class PrayersTimeConfigurations extends StatefulWidget {
  const PrayersTimeConfigurations({Key key}) : super(key: key);

  @override
  _PrayersTimeConfigurationsState createState() =>
      _PrayersTimeConfigurationsState();
}

class _PrayersTimeConfigurationsState extends State<PrayersTimeConfigurations> {
  final TextEditingController _addressController = TextEditingController();

  Map<String, int> madhabs = {
    "Hanbali, Maliki, Shafii": 0,
    "Hanafi": 1,
  };
  Map<String, int> methods = {
    "North America (ISNA)": 0,
    "Dubai": 1,
    "Egypt": 2,
    "Karachi": 3,
    "Kuwait": 4,
    "Moon Sighting Committee": 5,
    "Muslim World League (MWL)": 6,
    "Qatar": 7,
    "Singapore": 8,
    "University of Tehran": 9,
    "Turkey": 10,
    "Umm al-Qura (Makkah)": 11,
  };

  @override
  Widget build(BuildContext context) {
    var settings = Provider.of<PrayerSettingsProvider>(context, listen: true);
    int initialMadhab = settings.getCurrentMadhab();
    int initialMethod = settings.getCurrentCalculationMethod();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Configurazioni orari"),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 40),
            Container(
              width: MediaQuery.of(context).size.height,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
              decoration: BoxDecoration(
                color: Colors.yellow[500],
                borderRadius: const BorderRadius.all(Radius.circular(20)),
              ),
              child: Text(
                'Nota: Devi avere la connessione..',
                style: TextStyle(
                  color: Colors.grey.shade800,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: const BorderRadius.all(Radius.circular(20)),
              ),
              child: TextField(
                autocorrect: false,
                controller: _addressController,
                style: Theme.of(context).textTheme.bodyText2,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.all(10.0),
                  hintText: 'Indirizzo (Es: Quarto Oggiaro, Milano) ...',
                  hintStyle: TextStyle(color: Colors.grey.shade700),
                ),
                keyboardType: TextInputType.text,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 5,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Posizione attuale delle preghiere : ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          padding: const EdgeInsets.only(right: 10),
                          width: MediaQuery.of(context).size.width,
                          child: Text(settings.getCurrentLocationDescription()),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      const Text(
                        "Confermare",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey),
                      ),
                      const SizedBox(height: 5),
                      Container(
                        decoration: const BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            )),
                        child: IconButton(
                          color: Colors.white,
                          icon: const Icon(Icons.refresh),
                          onPressed: () {
                            locationFromAddress(_addressController.text)
                                .then((locations) async {
                              String _output;
                              if (locations.isNotEmpty) {
                                double lat = locations[0].latitude;
                                double long = locations[0].longitude;
                                await placemarkFromCoordinates(lat, long)
                                    .then((value) => {
                                          if (value.isNotEmpty)
                                            {
                                              _output = value[0]
                                                      .locality
                                                      .toString() +
                                                  ', ' +
                                                  value[0]
                                                      .postalCode
                                                      .toString() +
                                                  ', ' +
                                                  value[0]
                                                      .administrativeArea
                                                      .toString() +
                                                  ", " +
                                                  value[0].country.toString(),
                                              settings.updateLocationDesciption(
                                                  _output),
                                              settings.updateLat(lat),
                                              settings.updateLong(long),
                                            }
                                        });
                              }
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            const Text("Al Madhab : "),
            // const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: DropdownButton<int>(
                underline: const SizedBox(),
                isExpanded: true,
                menuMaxHeight: 300,
                iconEnabledColor: Theme.of(context).primaryColor,
                iconDisabledColor: Theme.of(context).primaryColor,
                elevation: 1,
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                ),
                items: madhabs
                    .map((description, value) {
                      return MapEntry(
                          description,
                          DropdownMenuItem<int>(
                            value: value,
                            child: Text(description),
                          ));
                    })
                    .values
                    .toList(),
                value: initialMadhab,
                onChanged: (int newValue) {
                  if (newValue != null) {
                    settings.updateMadhab(newValue);
                  }
                },
              ),
            ),
            const SizedBox(height: 10),
            const Text("Metodo di calcolo : "),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: DropdownButton<int>(
                underline: const SizedBox(),
                isExpanded: true,
                menuMaxHeight: 300,
                iconDisabledColor: Theme.of(context).primaryColor,
                iconEnabledColor: Theme.of(context).primaryColor,
                elevation: 1,
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                ),
                items: methods
                    .map((description, value) {
                      return MapEntry(
                          description,
                          DropdownMenuItem<int>(
                            value: value,
                            child: Text(description),
                          ));
                    })
                    .values
                    .toList(),
                value: initialMethod,
                onChanged: (int newValue) {
                  if (newValue != null) {
                    settings.updateCalculationMethod(newValue);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
