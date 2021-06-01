import 'package:google_maps_flutter/google_maps_flutter.dart';

class Moschea {
  final String title;
  final String direction;
  final LatLng latLng;
  final int id;

  Moschea({this.title, this.direction, this.latLng, this.id});
}

List<Moschea> moschee = [
  Moschea(
      id: 1,
      title: "Mezzaluna associazione culturale islamica",
      direction: "Via Montenero, 2, 21055 Gorla Minore VA",
      latLng: LatLng(45.63785495407704, 8.904198133043792)),
  Moschea(
      id: 2,
      title: "Centro Culturale Islamico Di Saronno - islamsaronno",
      direction: "Via E. H. Grieg, 44, 21047 Saronno VA",
      latLng: LatLng(45.613123368645724, 9.042205500618058)),
  Moschea(
      id: 3,
      title: "Centro Culturale Islamico Alif Baa",
      direction: "Via Crivellino, 24, 20081 Abbiategrasso MI",
      latLng: LatLng(45.40470813146694, 8.917538705748715)),
  Moschea(
      id: 4,
      title: "Lega Culturale Islamica Italo - Araba | Rho",
      direction: "Via Pozzobonelli, 2, 20017 Rho MI",
      latLng: LatLng(45.527966045212565, 9.054446760791775)),
  Moschea(
      id: 5,
      title: "Moschea",
      direction: "20851 Lissone, Province of Monza and Brianza",
      latLng: LatLng(45.61536732882591, 9.230488466421296)),
  Moschea(
      id: 6,
      title: "Comunità Islamica di Cinisello Balsamo",
      direction: "Via Donato Frisia, 11, 20092 Cinisello Balsamo MI",
      latLng: LatLng(45.554229651757204, 9.231379752456858)),
  Moschea(
      id: 7,
      title: "Mosque Milan Sesto",
      direction: "Via Trento, 106, 20099 Sesto San Giovanni MI",
      latLng: LatLng(45.55104790240821, 9.249135930927247)),
  Moschea(
      id: 8,
      title: "Moschea di Cologno Monzese",
      direction: "Via Gioacchino Rossini, 41, 20093 Cologno Monzese MI",
      latLng: LatLng(45.54028097575797, 9.280966694031793)),
  Moschea(
      id: 9,
      title: "Islamic Cultural Institute Onlus",
      direction: "Viale Edoardo Jenner, 50, 20159 Milano MI",
      latLng: LatLng(45.49701066922629, 9.175314803881735)),
  Moschea(
      id: 10,
      title: "Casa della Cultura Islamica Onlus",
      direction: "Via Padova, 144, 20132 Milano MI",
      latLng: LatLng(45.49807360209598, 9.232754819007956)),
  Moschea(
      id: 11,
      title: "Mariam Mosque",
      direction: "Via Padova, 366, 20132 Milano MI",
      latLng: LatLng(45.51172163130578, 9.257446599518643)),
  Moschea(
      id: 12,
      title: "Mosque of the Merciful",
      direction: "Via Cassanese, 3, 20090 Segrate MI",
      latLng: LatLng(45.49052289333104, 9.260997782488019)),
  Moschea(
      id: 13,
      title: "Mosque Lorentegio/Giambilino",
      direction: "Via Francesco Gonin, 56, 20147 Milano MI",
      latLng: LatLng(45.44183421754228, 9.120858886207207)),
  Moschea(
      id: 14,
      title: "COREIS (Comunità Religiosa Islamica) Italiana",
      direction: "Via Giuseppe Meda, 9, 20136 Milano MI",
      latLng: LatLng(45.44558702522495, 9.179431110938934)),
  Moschea(
      id: 15,
      title: "Centro Islamico Dar al Quran",
      direction: "Via Stadera, 18, 20141 Milano MI",
      latLng: LatLng(45.434154836398825, 9.182435152220302)),
  Moschea(
      id: 16,
      title: "Moschea",
      direction: "Via Vincenzo Toffetti, 27, 20139 Milano MI",
      latLng: LatLng(45.43981069562602, 9.233596264615352)),
  Moschea(
      id: 17,
      title: "Moschea di Rozzano",
      direction: "Via Aspromonte, 60, 20089 Rozzano MI",
      latLng: LatLng(45.3958083939882, 9.156572098418415)),
  Moschea(
      id: 18,
      title: "Moschea di San Giuliano",
      direction: "Via Marzabotto, 8/10, 20098 San Giuliano Milanese MI",
      latLng: LatLng(45.3971359233225, 9.292163645473982)),
  Moschea(
      id: 19,
      title: "Associazione Culturale El Badere",
      direction: "Viale Vittorio Veneto, 16, 24047 Treviglio BG",
      latLng: LatLng(45.515982765473055, 9.586992508097898)),
  Moschea(
      id: 20,
      title: "Moschea di Lodi",
      direction: "Via Lodivecchio, 41, 26900 Lodi LO",
      latLng: LatLng(45.30964517093934, 9.484845093702772)),
  Moschea(
      id: 21,
      title: "Moschea di Quarto Oggiaro",
      direction: "Via Sabatino Lopez, 3, 20157 Quarto Oggiaro",
      latLng: LatLng(45.515439986189016, 9.145578169004908)),
];
