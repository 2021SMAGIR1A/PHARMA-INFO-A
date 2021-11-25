import 'package:e_pharm_mobile/controllers/PharmacieCtl.dart';
import 'package:e_pharm_mobile/models/Pharmacie.dart';
import 'package:e_pharm_mobile/models/Ville.dart';
import 'package:e_pharm_mobile/views/DetailPharm.dart';
import 'package:flutter/material.dart';

class PharmacieListPage extends StatefulWidget {
  final Locality ville;
  PharmacieListPage(this.ville);

  @override
  _PharmacieListPageState createState() => _PharmacieListPageState();
}

class _PharmacieListPageState extends State<PharmacieListPage> {
  List<Pharmacie> pharms = [];
  @override
  void initState() {
    super.initState();
    PharmacieCtl().select(
        whereConditions: ["idLoc = ?"],
        whereArgs: [widget.ville.id]).then((value) {
      print(value);
      setState(() {
        pharms = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.ville.commune)),
      body: (pharms.isEmpty)
          ? Center(
              child: Text(
              "Aucune pharmacie pour\n${widget.ville.commune}",
              textAlign: TextAlign.center,
            ))
          : ListView(
              children: pharms
                  .map((e) => ListTile(
                        leading: Icon(Icons.storefront),
                        title: Text(e.label!),
                        subtitle: Text(
                          e.location ?? "",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailPharm(e))),
                      ))
                  .toList(),
            ),
    );
  }
}
