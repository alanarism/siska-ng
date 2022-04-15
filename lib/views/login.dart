import 'dart:developer';
import 'dart:async';
import 'package:SisKa/views/landing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:SisKa/_routing/routes.dart';
import 'package:SisKa/utils/colors.dart';
import 'package:SisKa/models/api/api_service.dart';
import 'package:SisKa/models/profile.dart';
import 'package:SisKa/models/globalModel.dart';
import 'package:line_icons/line_icons.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:flutter/cupertino.dart';

class Response {
  final String status;
  final String message;

  Response({this.status, this.message});

  factory Response.fromJson(Map<String, dynamic> json) {
    return Response(
      status: json['status'],
      message: json['message'],
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  ApiService _apiService = ApiService();
  final _username = TextEditingController();
  final _password = TextEditingController();
  String _response = '';
  bool _saving = false;

  Profile profile;

  void initState() {
    super.initState();
  }

  // fungsi untuk kirim http post
  Future<Response> post(String url, var body) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return http.post(url, body: body).then((http.Response response) {
      if (response.body == null) {
        throw new Exception("Error while fetching data");
      }

      Map<String, dynamic> user = jsonDecode(response.body);
      prefs.setString('KodeUser', '${user['Kode_userKin']}');
      prefs.setString('NamaUser', '${user['Nama_userKin']}');
      final nama1 = '${user['NamaUser']}';
      print(nama1);
      final nama = prefs.getString('NamaUser');
      print(nama);
      //  User.nama_user = nama;

      // return Response.fromJson(json.decode(response.body));
    });
  }

  void _callPostAPIng() {
    setState(() {
      _saving = true;
    });
    log("Username: ${_username.text}");
    log("Password: ${_password.text}");
    _apiService
        .login({'username': _username.text, 'password': _password.text}).then(
            (isSuccess) {
      if (isSuccess) {
        setState(() {
          _saving = false;
          Navigator.pushNamed(context, splashViewRoute);
        });
      } else {
        setState(() {
          _saving = false;
        });

        showDialog(
            context: context,
            builder: (_) => AlertDialog(
                  title: Text('Peringatan'),
                  content: Text('Username atau Password Salah!'),
                ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Stack(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Container(
                          color: Colors.white,
                          height: 350.0,
                          width: double.infinity,
                          child: Image.asset(
                            'assets/images/waves.png',
                            fit: BoxFit.fill,
                          ),
                        ),
                        Expanded(child: Container()),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 32),
                          child: TextField(
                            controller: _username,
                            decoration: InputDecoration(
                              prefixIcon: Image.asset(
                                  'assets/images/icon-username.png'),
                              prefixStyle: TextStyle(
                                color: Colors.red,
                              ),
                              hintText: 'Username',
                              hintStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(100),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 32),
                          child: TextField(
                            controller: _password,
                            obscureText: true,
                            decoration: InputDecoration(
                              prefixIcon: Image.asset(
                                  'assets/images/icon-password.png'),
                              hintText: 'Password',
                              hintStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(100),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 32),
                          child: CupertinoButton(
                            color: Color.fromRGBO(52, 137, 246, 1),
                            borderRadius: BorderRadius.circular(100),
                            onPressed: () {
                              _callPostAPIng();
                            },
                            pressedOpacity: 0.5,
                            child: Text(
                              'Login',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        Expanded(child: Container()),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Tidak memiliki akun?',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(width: 4),
                            CupertinoButton(
                              padding: EdgeInsets.all(0),
                              onPressed: () => Navigator.pushNamed(
                                  context, registerViewRoute),
                              child: Text(
                                'Sign up',
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w200,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                      ],
                    ),
                    Positioned(
                      left: 0,
                      top: 128,
                      right: 0,
                      child: Container(
                        width: 100,
                        height: 100,
                        child: Image.asset(
                          'assets/images/logo1.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
