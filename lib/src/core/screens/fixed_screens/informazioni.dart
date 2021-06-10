import 'package:flutter/material.dart';

class Informazioni extends StatelessWidget {
  const Informazioni({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: color),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 150.0,
                    child: Image.asset('assets/images/logo.png'),
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Nome : ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: color)),
                      Text("Associazione La Solidarietà"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Indirizzo : ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: color)),
                      Text("Via Pascarella 7, Milano – 20157"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Email : ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: color)),
                      Text("associazionesolidarieta01@gmail.com"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Telefono : ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: color)),
                      Text("+39 388 157 0883"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Banca : ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: color)),
                      Text("Intesa Sanpaolo"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("IBAN : ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: color)),
                      Text("IT54C0306909606100000166062"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Swift Code : ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: color)),
                      Text("BCITITMX500"),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
