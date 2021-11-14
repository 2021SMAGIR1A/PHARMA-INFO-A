import 'package:e_pharm_mobile/modeles/Pharmacie.dart';
import 'package:flutter/material.dart';

class DetailPharm extends StatefulWidget {
  final Pharmacie pharm;
  DetailPharm(this.pharm);

  @override
  _DetailPharmState createState() => _DetailPharmState();
}

class _DetailPharmState extends State<DetailPharm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.pharm.name!),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.map_rounded),
        onPressed: () {},
      ),
      body: Column(
        children: [
          Image.asset("assets/bg.jpg"),
          Expanded(
              child: ListView(
            children: [
              ListTile(
                leading: Icon(Icons.storefront_outlined),
                title: Text(widget.pharm.name!),
              ),
              ListTile(
                leading: Icon(Icons.format_quote),
                title: Text(widget.pharm.site!),
              ),
              ListTile(
                title: Text("Début de garde".toUpperCase()),
                subtitle: Text(widget.pharm.dateDebut ?? ""),
              ),
              ListTile(
                title: Text("Fin de garde".toUpperCase()),
                subtitle: Text(widget.pharm.dateFin ?? ""),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
