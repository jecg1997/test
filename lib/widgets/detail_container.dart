import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palantir/controllers/maincontroller.dart';
import 'package:palantir/model/gpsInformation.dart';

class DetailContainer extends StatelessWidget {
  DetailContainer({this.gpsInfo, this.title});
  final state = Get.find<MainController>();
  Map gpsInfo;
  String title;
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        color: Colors.white60,
        child: SizedBox(
          height: 165,
          width: 165,
          child: !state.isRunning()
              ? Center(
                  child: Text(
                    title,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 35,
                    ),
                  ),
                )
              : Center(
                  child: gpsInfo == null
                      ? CircularProgressIndicator()
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              title,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: getTextWidgets(gpsInfo),
                            ),
                          ],
                        ),
                ),
        ),
      ),
    );
  }
}

List<Widget> getTextWidgets(Map strings) {
  List<Widget> list = [];
  strings.forEach((key, value) {
    list.add(Text(
      '$key: $value',
      style: TextStyle(
        color: Colors.black,
        fontSize: 25,
      ),
      textAlign: TextAlign.center,
    ));
  });
  return list;
}
