import 'package:e_pharm_mobile/controllers/PharmacieCtl.dart';
import 'package:e_pharm_mobile/controllers/VilleCtl.dart';
import 'package:e_pharm_mobile/models/Ville.dart';
import 'package:e_pharm_mobile/views/PharmacieListPage.dart';
import 'package:flutter/material.dart';

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
              onPressed: () => VilleCtl.get(),
              icon: Icon(Icons.replay_outlined))
        ],
      ),
      body: FutureBuilder<List<Ville>?>(
          future: VilleCtl().select(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (!snapshot.hasData) {
              return Center(
                child: Text("Aucune donnée à afficher"),
              );
            }

            return Column(
              children: [
                Container(
                  margin:
                      EdgeInsets.only(top: 10, bottom: 20, left: 10, right: 10),
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
                                    builder: (context) =>
                                        PharmacieListPage(e))),
                            leading: Icon(Icons.location_city),
                            title: Text(e.commune!),
                          ))
                      .toList(),
                )),
              ],
            );
          }),
    );
  }
}
