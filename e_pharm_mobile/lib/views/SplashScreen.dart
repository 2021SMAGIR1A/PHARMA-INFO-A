import 'package:e_pharm_mobile/components/components.dart';
import 'package:e_pharm_mobile/controllers/PharmacieCtl.dart';
import 'package:e_pharm_mobile/controllers/VilleCtl.dart';
import 'package:e_pharm_mobile/models/Database.dart';
import 'package:e_pharm_mobile/models/Ville.dart';
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
      //Récupération des villes avec l'api
      await VilleCtl.get();
    } catch (e) {
      print(e);
    } finally {
      Navigate.toAndRemove(context, route: Home());
    }
  }
}
