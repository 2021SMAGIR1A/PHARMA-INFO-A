import 'package:e_pharm_mobile/controllers/PharmacieCtl.dart';
import 'package:e_pharm_mobile/controllers/VilleCtl.dart';
import 'package:e_pharm_mobile/models/Database.dart';
import 'package:e_pharm_mobile/views/Home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    redirect();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/e_pharm.png", width: 150),
            Text("E-PHARM",
                style: GoogleFonts.ubuntu(
                    fontWeight: FontWeight.bold, color: Colors.green))
          ],
        ),
      ),
    );
  }

  redirect() async {
    try {
      var villes = await VilleCtl.get();

      //Sauvegarde des villes
      await VilleCtl().insertAll(villes);

      //Sauvegarde des pharmacies
      villes.forEach((element) async =>
          await PharmacieCtl().insertAll(element.pharmacies));

      villes.forEach((ville) async {
        await DBase.insert(entity: Entities.ville, model: ville.toMap());
      });

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Home(villes)));
    } catch (e) {
      print(e);
    }
  }
}
