import 'package:e_pharm_mobile/controllers/PharmacieCtl.dart';
import 'package:e_pharm_mobile/modeles/Ville.dart';
import 'package:e_pharm_mobile/vues/PharmacieListPage.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  final List<Ville> villes;
  Home(this.villes);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("E-PHARM"),
        actions: [
          IconButton(
              onPressed: () => PharmacieCtl.get(),
              icon: Icon(Icons.replay_outlined))
        ],
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 20, left: 10, right: 10),
            child: TextFormField(
              decoration: InputDecoration(
                  hintText: "Rechercher(${widget.villes.length})",
                  border: OutlineInputBorder()),
            ),
          ),
          Expanded(
              child: ListView(
            children: widget.villes
                .map((e) => ListTile(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PharmacieListPage(e))),
                      leading: Icon(Icons.location_city),
                      title: Text(e.libelle!),
                    ))
                .toList(),
          )),
        ],
      ),
    );
  }
}
