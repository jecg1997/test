import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:universal_io/prefer_universal/io.dart';

import 'UI/dashboard.dart';

void main() {
  HttpOverrides.global = new DevHttpOverrides();
  runApp(MyApp());
} //main function

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      debugShowCheckedModeBanner: false,
      title: 'Palantir UI',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome to Palantir UI'),
        ),
        body: Dashboard(),
      ),
    );
  }
}

class DevHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
