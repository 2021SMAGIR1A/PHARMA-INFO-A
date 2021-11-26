import 'package:e_pharm_mobile/models/Pharmacie.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
        title: Text(widget.pharm.label!),
      ),
      floatingActionButton:
          (widget.pharm.lat == null || widget.pharm.long == null)
              ? null
              : FloatingActionButton(
                  child: Icon(Icons.map_rounded),
                  onPressed: () => launch(
                      "https://www.google.com/maps/search/?api=1&query=${widget.pharm.long},${widget.pharm.lat}"),
                ),
      body: Column(
        children: [
          Image.asset("assets/bg.jpg"),
          Expanded(
              child: ListView(
            children: [
              ListTile(
                leading: Icon(Icons.storefront_outlined),
                title: Text(widget.pharm.label!),
              ),
              ListTile(
                leading: Icon(Icons.format_quote),
                title: Text(widget.pharm.location!),
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text("Directeur".toUpperCase()),
                subtitle: Text(widget.pharm.director ?? ""),
              ),
              ListTile(
                leading: Icon(Icons.date_range),
                title: Text("Début de garde".toUpperCase()),
                subtitle: Text(widget.pharm.dateStart ?? ""),
              ),
              ListTile(
                leading: Icon(Icons.date_range),
                title: Text("Fin de garde".toUpperCase()),
                subtitle: Text(widget.pharm.dateEnd ?? ""),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
