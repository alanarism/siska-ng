import 'dart:async';
import 'package:SisKa/_routing/routes.dart';
import 'package:SisKa/views/landing.dart';
import 'package:SisKa/views/login.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:SisKa/models/api/api_service.dart';
import 'package:SisKa/models/profile.dart';

class Splash extends StatefulWidget {
  Splash({Key key}) : super(key: key);
  _Splash createState() => _Splash();
}

class _Splash extends State<Splash> {
  List<Profile> listProfile = new List<Profile>();
  ApiService apiService = new ApiService();
  @override
  Widget build(BuildContext context) {
    apiService.getAuth().then((success) async {
      if (success) {
        apiService.getAuthJab().then((jab) async {
          if (jab == '1') {
            // setState(() {
            // Navigator.pushNamed(context, profileViewRoute);
            Navigator.pushReplacementNamed(
              context,
              'homeAdmin',
              arguments: 0,
            );
            // });
          } else if (jab == '0') {
            // setState(() {
            // Navigator.pushNamed(context, homeAdminViewRoute,);
            Navigator.pushReplacementNamed(
              context,
              'home',
              arguments: 0,
            );
            //Navigator.pushNamed(context, homeAdminViewRoute,arguments: 0, );
            //});
          } else {
            // setState(() {
            // Navigator.pushNamed(context, homeAdminViewRoute,);
            Navigator.pushReplacementNamed(
              context,
              'homeDosen',
              arguments: 0,
            );
            //Navigator.pushNamed(context, homeAdminViewRoute,arguments: 0, );
            //});

          }
        });
      } else {
        Timer(
            Duration(seconds: 1),
            () => Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => LandingPage())));
      }
    });
    return Center(
      child: SplashScreen(
          seconds: 0,
          title: new Text('Sistem Informasi Kemajuan Akademik'),
          image: new Image.asset('assets/images/LogoUndiksha.png'),
          backgroundColor: Colors.lightBlueAccent,
          styleTextUnderTheLoader: new TextStyle(),
          photoSize: 100.0,
          loaderColor: Colors.blue),
    );
  }
}

// class AfterSplash extends StatelessWidget {

//   Widget build(BuildContext context) {
//     checkIfAuthenticated().then((success) {
//       if (success) {
//         Navigator.pushReplacementNamed(context, '/home');
//       } else {
//         Navigator.pushReplacementNamed(context, '/login');
//       }
//     });

//     return Center(
//       child: CircularProgressIndicator(),
//     );
//   }
