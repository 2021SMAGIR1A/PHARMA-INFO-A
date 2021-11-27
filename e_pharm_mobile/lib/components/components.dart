import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class UrlConst {
  UrlConst._();
  static String locality = "https://duty-pharmacy.herokuapp.com/localities";
  static String pharm = "https://duty-pharmacy.herokuapp.com/pharmacies";
  static String assurance = "https://duty-pharmacy.herokuapp.com/insurances";
}

class Tools {
  Tools._();
  static Future<Map<String, dynamic>> getGPSAuthorization() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return {
        "status": false,
        "msg": "Impossible d'obtenir la position par le GPS. " +
            "Vérifie que le GPS est activé sur ton téléphone et que " +
            "l'application a l'autorisation d'y accéder."
      };
    } else {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.deniedForever) {
          return {
            "status": false,
            "msg":
                "Les autorisations de localisation sont définitivement refusées, "
                    "nous ne pouvons pas demander les autorisations."
          };
        } else {
          return {
            "status": false,
            "msg": "L'application n'a pas l'autorisation d'accéder "
                "à la localisation de ton téléphone."
          };
        }
      } else {
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high);
        return {"status": true, "position": position};
      }
    }
  }

  static MsgBox(BuildContext context, String msg) {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Message"),
              content: Text(msg),
              actions: [
                TextButton(
                    onPressed: () => Navigate.back(context),
                    child: Text("Ok, fermer"))
              ],
            ));
  }
}

class Navigate {
  Navigate._();
  static Future to(BuildContext context, {@required Widget? route}) {
    return Navigator.push(
        context, MaterialPageRoute(builder: (context) => route!));
  }

  static toAndRemove(context, {@required Widget? route}) {
    return Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => route!,
        transitionDuration: Duration.zero,
      ),
    );
  }

  static back(context, {dynamic data}) {
    return Navigator.pop(context, data);
  }
}
