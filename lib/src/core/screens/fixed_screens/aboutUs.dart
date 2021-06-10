import 'package:flutter/material.dart';
import 'package:solidarieta/src/core/components/widgets/drawerLink.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;
    Uri facebooklink = Uri.parse(
        "https://www.facebook.com/La-Solidarietà-Associazione-Tadaamun-101413525364171/");

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text(
          "Associazione La Solidarietà",
          style: TextStyle(color: color),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: color),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Container(
                  height: 150.0,
                  child: Image.asset('assets/images/logo.png'),
                ),
                SizedBox(height: 30),
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        // color: Colors.grey.withOpacity(0.5),
                        color: Color.fromRGBO(0, 133, 119, 0.2),
                        spreadRadius: 1,
                        blurRadius: 8,
                        offset: Offset(0, 0),
                      ),
                    ],
                  ),
                  child: Text(
                    "L’Associazione nasce nel 2019 a Milano dall’unione di alcuni concittadini che sentivano l’esigenza di trovare un luogo per la comunità musulmana in cui poter pregare e avere servizi come corsi di lingua araba. Allo stesso tempo però hanno pensato di allargare la prospettiva: incontrare gli sguardi per convergerli in un dialogo interculturale che non si ferma come proposito, ma dedicherà le sue forze per ricercarlo e intavolarlo.",
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  height: 230,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(0, 133, 119, 0.2),
                        spreadRadius: 2,
                        blurRadius: 8,
                        offset: Offset(0, 0),
                      ),
                    ],
                    image: DecorationImage(
                      image: AssetImage("assets/images/masjed.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(0, 133, 119, 0.2),
                        spreadRadius: 1,
                        blurRadius: 8,
                        offset: Offset(0, 0),
                      ),
                    ],
                  ),
                  child: Text(
                    "I nostri servizi non sono solamente in presenza, ma si possono ritrovare nei nostri canali di comunicazione in cui le nostre voci si fondono con le vostre in dibattiti, in scoperte e in legami che vogliamo costruire con voi. E ogni pezzettino di luogo costruito sia fisicamente sia virtualmente, è una conquista per l’integrazione e per l’inclusione sociale. Ogni parola verrà risaltata, verrà valorizzata come ogni piccolo contributo donato per il progetto.",
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildLinkContainer('facebook', facebooklink.toString()),
                    _buildLinkContainer(
                        'instagram', 'https://www.instagram.com/ass.tadaamun/'),
                    _buildLinkContainer('web',
                        'https://associazionesolidarieta.wordpress.com/'),
                    _buildLinkContainer('youtube',
                        'https://www.youtube.com/channel/UCsSMvPkxn56890UVSB-AhsQ'),
                  ],
                ),
                SizedBox(height: 30),
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(0, 133, 119, 0.2),
                        spreadRadius: 1,
                        blurRadius: 8,
                        offset: Offset(0, 0),
                      ),
                    ],
                    image: DecorationImage(
                      image: AssetImage("assets/images/children.jpeg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(0, 0, 0, 0.57),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Text(
                      "I giovani saranno al centro dei nostri servizi: la loro formazione e la loro educazione non si ferma alla scuola, le esperienze che consolidano negli anni sono di vitale importanza. Per questo vogliamo cercare di costruire un ambiente che possa permettere loro in primis di avere esperienze di valore che possano essere un tassello per il loro futuro.",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  "Le nostre porte sono aperte, \nBenvenuto e piacere di conoscerti!",
                  style: TextStyle(
                    color: color,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 30),
                InkWell(
                  onTap: () => openLink(
                      'https://www.gofundme.com/f/associazione-la-solidariet'),
                  child: Container(
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'SOSTIENICI',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

_buildLinkContainer(String image, String link) {
  return InkWell(
    onTap: () => openLink(link),
    child: Container(
      padding: EdgeInsets.all(10),
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 133, 119, 0.2),
            spreadRadius: 1,
            blurRadius: 8,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: Image(image: AssetImage("assets/images/socialmedia/$image.png")),
    ),
  );
}
