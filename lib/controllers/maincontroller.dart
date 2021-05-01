import 'dart:convert';
import 'package:palantir/model/sensorinfo.dart';
import 'package:get/get.dart';
import 'dart:async' show Future, Timer;
import 'package:flutter/services.dart' show rootBundle;
import 'package:http/http.dart' as http;
import 'package:universal_io/prefer_universal/io.dart';

class MainController extends GetxController {
  final demoString = SensorInfo().obs;
  final isRunning = RxBool(false);
  Timer timer;
  onInit() async {
    super.onInit();
  }

  stopTimer() {
    timer.cancel();
    isRunning(false);
  }

  startTimer() {
    timer = Timer.periodic(Duration(seconds: 3), (timer) async {
      demoString.value = await loadAsset();
    });
    isRunning(true);
  }

  Future<dynamic> loadAsset() async {
    HttpClient client = HttpClient()
      ..badCertificateCallback =
          ((X509Certificate cert, String host, int port) => true);
    HttpClientRequest request = await client
        .getUrl(Uri.parse("http://192.168.1.35/GPS_Dataframe.JSON"));
    HttpClientResponse response = await request.close();
    //final result = await http.get("https://192.168.1.35/GPS_Dataframe.JSON");
    var result =
        sensorInfoFromJson(await response.transform(utf8.decoder).join());
    // print(sensorInfoFromJson(await response.transform(utf8.decoder).join()));
    print(result.battery.voltage);
    return result;

    //   String result = await rootBundle.loadString('assets/GPS_Dataframe.JSON');
    //   print(result);
    //   return sensorInfoFromJson(result);
  }
}
