import 'dart:convert';

import 'package:palantir/model/gpsInformation.dart';
import 'package:universal_io/io.dart';
import 'package:get/get.dart';
import 'dart:async' show Future, Timer;
import 'package:flutter/services.dart' show rootBundle;
import 'package:dio/dio.dart';

class MainController extends GetxController {
  final demoString = GpsInformation().obs;
  final status = 'Stopped'.obs;
  Timer timer;
  onInit() async {
    super.onInit();
  }

  stopTimer() {
    timer.cancel();
    status.value = 'Stopped';
  }

  startTimer() {
    timer = Timer.periodic(Duration(seconds: 5), (timer) {
      loadAsset();
    });
    status.value = 'Started';
  }

  Future<dynamic> loadAsset() async {
    var response = await Dio().get('http://localhost:3000/demo.txt');
    print(response.data);
    demoString.value = gpsInformationFromJson(response.data);

    return gpsInformationFromJson(response.data);
    ;
  }
}
