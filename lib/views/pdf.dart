import 'package:flutter/material.dart';
import 'package:SisKa/models/penelitian.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  final String url;
  const MyApp({Key key, this.url}) : super(key: key);
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isLoading = true;
  PDFDocument document;
  List<Penelitian> listData = new List<Penelitian>();
  String _url = '';

  @override
  void initState() {
    super.initState();
    _url = widget.url;
    loadDocument();
  }

  loadDocument() async {
    document = await PDFDocument.fromURL(_url);
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lihat Dokumen'),
      ),
      body: Center(
          child: _isLoading
              ? Center(child: CircularProgressIndicator())
              : PDFViewer(document: document)),
    );
  }
}
