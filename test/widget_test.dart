// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:palantir/model/sensorinfo.dart';
import 'package:universal_io/io.dart';

void main() async {
  await loadAsset();
}

Future<dynamic> loadAsset() async {
  Dio dio = Dio();

  (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
      (HttpClient client) {
    client.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    return client;
  };
  var response = await dio.get('https://192.168.1.35/GPS_Dataframe.JSON');

  print(response.data);

  return sensorInfoFromJson(response.data);
}
