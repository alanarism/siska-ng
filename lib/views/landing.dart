import 'dart:async';
import 'package:flutter/material.dart';
import 'package:SisKa/_routing/routes.dart';
import 'package:SisKa/utils/colors.dart';
import 'package:SisKa/utils/utils.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

class LandingPage extends StatefulWidget {
  @override
  _SplashScreeneState createState() => _SplashScreeneState();
}

class _SplashScreeneState extends State<LandingPage> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 1),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Landing())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/bg.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/LogoUndiksha.png',
            height: 200,
            width: 200,
          ),
          Text(
            "\n\nSistem Informasi Kemajuan Akademik",
            style: TextStyle(
                color: Color.fromARGB(255, 3, 6, 163),
                fontWeight: FontWeight.bold,
                fontSize: 14,
                fontFamily: 'Quicksand'),
          ),
        ],
      ),
    );
  }
}

class Landing extends StatelessWidget {
  // void homePage(BuildContext context) {
  //   //The solution.
  //   Navigator.pushNamed(context, "/");

  //   Navigator.of(context)
  //       .pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
  // }

  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.transparent);
    FlutterStatusbarcolor.setNavigationBarColor(Colors.blue);

    final logo = Container(
      height: 100.0,
      width: 100.0,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AvailableImages.appLogo,
          fit: BoxFit.cover,
        ),
      ),
    );

    final appName = Column(
      children: <Widget>[
        Text(
          AppConfig.appName,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 18.0,
          ),
          textAlign: TextAlign.center,
        ),
        Text(
          AppConfig.appTagline,
          style: TextStyle(
              color: Colors.white, fontSize: 15.0, fontWeight: FontWeight.w500),
          textAlign: TextAlign.center,
        )
      ],
    );

    // final loginBtn = InkWell(
    //   onTap: () => Navigator.pushNamed(context, loginViewRoute),
    //   child: Container(
    //     height: 60.0,
    //     width: MediaQuery.of(context).size.width,
    //     decoration: BoxDecoration(
    //       borderRadius: BorderRadius.circular(7.0),
    //       border: Border.all(color: Colors.white),
    //       color: Colors.white,
    //     ),
    //     child: Center(
    //       child: Text(
    //         'LOGIN',
    //         style: TextStyle(
    //           fontWeight: FontWeight.w600,
    //           fontSize: 20.0,
    //           color: Colors.white,
    //         ),
    //       ),
    //     ),
    //   ),
    // );

    final loginBtn = Container(
      height: 60.0,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7.0),
        border: Border.all(color: Colors.white),
        color: Colors.white,
      ),
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () => Navigator.pushNamed(context, loginViewRoute),
        color: Colors.white,
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(7.0),
        ),
        child: Text(
          'MASUK',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20.0,
          ),
        ),
      ),
    );

    final registerBtn = Container(
      height: 60.0,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7.0),
        border: Border.all(color: Colors.white),
        color: Colors.white,
      ),
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () => Navigator.pushNamed(context, registerViewRoute),
        color: Colors.white,
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(7.0),
        ),
        child: Text(
          'DAFTAR',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20.0,
          ),
        ),
      ),
    );

    final buttons = Padding(
      padding: EdgeInsets.only(
        top: 80.0,
        bottom: 30.0,
        left: 30.0,
        right: 30.0,
      ),
      child: Column(
        children: <Widget>[
          loginBtn,
          SizedBox(height: 20.0),
          registerBtn,
          SizedBox(height: 20.0),
          Text(
            '',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.white,
              fontSize: 10.0,
            ),
          ),
        ],
      ),
    );

    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 70.0),
              decoration: BoxDecoration(gradient: primaryGradient),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: <Widget>[logo, appName, buttons],
              ),
            ),
            Positioned(
              bottom: 0,
              child: Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Container(
                  height: 300.0,
                  width: MediaQuery.of(context).size.width,
                  // decoration: BoxDecoration(
                  //   image: DecorationImage(
                  //     image: AvailableImages.homePage,
                  //     fit: BoxFit.contain,
                  //   ),
                  // ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
