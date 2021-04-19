import 'package:palantir/model/sensorinfo.dart';
import 'package:get/get.dart';
import 'dart:async' show Future, Timer;
import 'package:http/http.dart' as http;
import 'package:universal_html/html.dart';

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
    timer = Timer.periodic(Duration(seconds: 5), (timer) {
      loadAsset();
    });
    isRunning(true);
  }

  Future<dynamic> loadAsset() async {
    String result = (await http.get("GPS_Dataframe.JSON")).body;
    return sensorInfoFromJson(result);
  }
}
