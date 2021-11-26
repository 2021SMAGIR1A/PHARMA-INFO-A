import 'package:e_pharm_mobile/controllers/VilleCtl.dart';
import 'package:e_pharm_mobile/models/Database.dart';
import 'package:e_pharm_mobile/models/Ville.dart';
import 'package:e_pharm_mobile/views/PharmacieListPage.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Locality> villes = [];
  List<Locality> searchVilles = [];
  String search = "";

  @override
  void initState() {
    super.initState();
    getVilles();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("E-PHARM")),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 20, left: 10, right: 10),
              child: TextFormField(
                onChanged: (value) {
                  setState(() {
                    search = value;
                    searchVilles = villes
                        .where((e) => e.commune
                            .toLowerCase()
                            .contains(value.toLowerCase()))
                        .toList();
                  });
                },
                decoration: InputDecoration(
                    hintText: "Rechercher une ville",
                    border: OutlineInputBorder()),
              ),
            ),
            Expanded(
                child: ListView.builder(
                    itemCount:
                        search.isEmpty ? villes.length : searchVilles.length,
                    itemBuilder: (context, i) {
                      var ville = search.isEmpty ? villes[i] : searchVilles[i];
                      return ListTile(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    PharmacieListPage(ville))),
                        leading: Icon(Icons.location_city),
                        title: Text(ville.commune),
                      );
                    })),
          ],
        ));
  }

  getVilles() async {
    villes = await VilleCtl().select();
    setState(() {});
  }
}
