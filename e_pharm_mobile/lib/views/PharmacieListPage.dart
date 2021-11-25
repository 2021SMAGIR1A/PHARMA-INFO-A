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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.ville.commune)),
      // body: ListView(
      //   children: widget.ville.pharmacies
      //       .map((e) => ListTile(
      //             leading: Icon(Icons.storefront),
      //             title: Text(e.label!),
      //             subtitle: Text(
      //               e.location ?? "",
      //               maxLines: 1,
      //               overflow: TextOverflow.ellipsis,
      //             ),
      //             onTap: () => Navigator.push(context,
      //                 MaterialPageRoute(builder: (context) => DetailPharm(e))),
      //           ))
      //       .toList(),
      // ),
    );
  }
}
