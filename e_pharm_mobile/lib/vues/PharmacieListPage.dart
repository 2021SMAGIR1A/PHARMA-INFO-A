import 'package:e_pharm_mobile/modeles/Pharmacie.dart';
import 'package:e_pharm_mobile/modeles/Ville.dart';
import 'package:e_pharm_mobile/vues/DetailPharm.dart';
import 'package:flutter/material.dart';

class PharmacieListPage extends StatefulWidget {
  final Ville ville;
  PharmacieListPage(this.ville);

  @override
  _PharmacieListPageState createState() => _PharmacieListPageState();
}

class _PharmacieListPageState extends State<PharmacieListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.ville.libelle!)),
      body: ListView(
        children: widget.ville.pharmacies
            .map((e) => ListTile(
                  leading: Icon(Icons.storefront),
                  title: Text(e.name!),
                  subtitle: Text(
                    e.site ?? "",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DetailPharm(e))),
                ))
            .toList(),
      ),
    );
  }
}
