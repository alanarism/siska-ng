import 'package:SisKa/views/login.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:SisKa/widget/button_widget.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => SafeArea(
        child: IntroductionScreen(
          pages: [
            PageViewModel(
              title: 'Pengajuan Proposal dan Tesis',
              body:
                  'Anda dapat memebuat pengajuan proposal, ujian tesis, serta melihat timeline proses ujian Anda.',
              image: buildImage('assets/images/list.jpg'),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'Dosen Pembimbing dan Topik Tesis',
              body:
                  'Anda dapat melihat jumlah Mahasiswa yang dibimbing setiap Dosen dan melihat topik dari Mahasiswa lain',
              image: buildImage('assets/images/dosen.png'),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'Grafik Topik',
              body:
                  'Tersedia grafik untuk mengetahui jumlah judul tesis berdasarkan topik',
              image: buildImage('assets/images/grafik.png'),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'Sistem Informasi Kemajuan Akademik',
              body: 'Mulai menggunakan SIsKA',
              footer: ButtonWidget(
                text: 'Masuk',
                onClicked: () => goToHome(context),
              ),
              image: buildImage('assets/images/wisuda.jpg'),
              decoration: getPageDecoration(),
            ),
          ],
          done: Text(
            'Login',
            style: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          onDone: () => goToHome(context),
          showSkipButton: true,
          skip: Text(
            'Skip',
            style: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          onSkip: () => goToHome(context),
          next: Icon(
            Icons.arrow_forward,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          dotsDecorator: getDotDecoration(),
          onChange: (index) => print('Page $index selected'),
          globalBackgroundColor: Theme.of(context).primaryColor,
          skipFlex: 0,
          nextFlex: 0,
          // isProgressTap: false,
          // isProgress: false,
          // showNextButton: false,
          // freeze: true,
          // animationDuration: 1000,
        ),
      );

  void goToHome(context) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => LoginPage()),
      );

  Widget buildImage(String path) =>
      Center(child: Image.asset(path, width: 350));

  DotsDecorator getDotDecoration() => DotsDecorator(
        color: Color(0xFFBDBDBD),
        //activeColor: Colors.orange,
        size: Size(10, 10),
        activeSize: Size(22, 10),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      );

  PageDecoration getPageDecoration() => PageDecoration(
        titleTextStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        bodyTextStyle: TextStyle(fontSize: 20),
        descriptionPadding: EdgeInsets.all(16).copyWith(bottom: 0),
        imagePadding: EdgeInsets.all(24),
        pageColor: Colors.white,
      );
}
