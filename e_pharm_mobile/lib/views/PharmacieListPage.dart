import 'package:e_pharm_mobile/components/components.dart';
import 'package:e_pharm_mobile/controllers/PharmacieCtl.dart';
import 'package:e_pharm_mobile/models/Pharmacie.dart';
import 'package:e_pharm_mobile/models/Ville.dart';
import 'package:e_pharm_mobile/views/DetailPharm.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

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
    getPosition();
    PharmacieCtl().select(
        whereConditions: ["idLoc = ?"],
        whereArgs: [widget.ville.id]).then((value) {
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
                        trailing: Text("${e.distance} KM"),
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailPharm(e))),
                      ))
                  .toList(),
            ),
    );
  }

  void getPosition() async {
    try {
      var result = await Tools.getGPSAuthorization();

      if (result["status"] == true) {
        Position position = result["position"];
        pharms.forEach((pharm) {
          setState(() {
            pharm.distance = (pharm.lat == null || pharm.long == null)
                ? 0
                : (Geolocator.distanceBetween(
                            double.parse(pharm.lat!),
                            double.parse(pharm.long!),
                            position.latitude,
                            position.longitude) /
                        10000)
                    .round();
          });
        });
      } else {
        Tools.MsgBox(context, result["msg"]);
        print(result["msg"]);
      }
    } catch (e) {
      print(e);
    }
  }
}
