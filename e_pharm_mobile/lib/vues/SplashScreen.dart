import 'package:e_pharm_mobile/controllers/PharmacieCtl.dart';
import 'package:e_pharm_mobile/vues/Home.dart';
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
    await Future.delayed(Duration(seconds: 5));
    var villes = await PharmacieCtl.get();
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Home(villes)));
  }
}
