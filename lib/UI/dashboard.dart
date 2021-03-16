import 'dart:html';

import 'package:circle_button/circle_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palantir/controllers/maincontroller.dart';
import 'package:palantir/widgets/detail_container.dart';

class Dashboard extends StatelessWidget {
  final state = Get.put(MainController());
  final String url =
      'https://images.unsplash.com/photo-1451187580459-43490279c0fa?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format';
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(url),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          header(),
          title(),
          //Padding(padding: const EdgeInsets.all(50.0)),
          Expanded(child: mainButtons()),
        ],
      ),
    );
  }

  Row header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Image.asset(
              'assets/logo.png',
              height: 200,
            ),
            Padding(padding: const EdgeInsets.all(10.0)),
            Image.asset(
              'assets/nasa.png',
              height: 150,
            ),
          ],
        ),
        Center(
          child: Row(
            children: [
              MaterialButton(
                colorBrightness: Brightness.dark,
                onPressed: () {},
                child: Text(
                  'About',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              MaterialButton(
                colorBrightness: Brightness.dark,
                onPressed: () {},
                child: Text(
                  'Need help?',
                  style: TextStyle(fontSize: 20),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget title() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Colors.white54,
        padding: EdgeInsets.all(20),
        width: 500,
        height: 250,
        child: Obx(
          () => Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Comm-Nav System',
                style: TextStyle(fontSize: 30),
              ),
              Text(
                state.isRunning() ? 'Status: Running' : 'Status: Stopped',
                style: TextStyle(fontSize: 30),
              ),
              SizedBox(
                width: double.maxFinite,
                height: 100,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary:
                        state.isRunning() ? Colors.red[700] : Colors.green[700],
                  ),
                  onPressed: () {
                    if (state.isRunning()) {
                      state.stopTimer();
                    } else {
                      state.startTimer();
                    }
                  },
                  child: Text(
                    state.isRunning() ? 'Stop' : 'Start',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget mainButtons() {
    double percent = Get.width * 0.2;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 100),
          child: CircleButton(
            onPressed: () {},
            height: percent,
            width: percent,
            child: Obx(
              () => DetailContainer(
                title: 'IMU Information',
                gpsInfo: state.demoString.value.imuInformation?.toJson(),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 100),
          child: CircleButton(
            onPressed: () {},
            height: percent,
            width: percent,
            child: Obx(
              () => DetailContainer(
                title: 'GPS Information',
                gpsInfo: state.demoString.value.gpsInformation?.toJson(),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 100),
          child: CircleButton(
            onPressed: () {},
            height: percent,
            width: percent,
            child: Obx(
              () => DetailContainer(
                title: 'Battery Status',
                gpsInfo: state.demoString.value.batteryStatus?.toJson(),
              ),
            ),
          ),
        ),
        // Padding(
        //   padding: const EdgeInsets.only(top: 100),
        //   child: CircleButton(
        //     onPressed: () {},
        //     height: MediaQuery.of(Get.context).size.width * 0.20,
        //     child: Obx(
        //       () => DetailContainer(
        //         title: 'Radio Status',
        //         gpsInfo: state.demoString.value.radioStatus?.toJson(),
        //       ),
        //     ),
        //   ),
        // ),
        // Padding(
        //   padding: const EdgeInsets.only(bottom: 100),
        //   child: CircleButton(
        //       onPressed: () {},
        //       height: MediaQuery.of(Get.context).size.width * 0.20,
        //       child: Obx(() => DetailContainer(
        //             title: 'Network Info',
        //             gpsInfo: state.demoString.value.networkInfo?.toJson(),
        //           ))),
        // ),
      ],
    );
  }
}

ElevatedButton CircleButton(
    {Widget child, onPressed(), double width, double height}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      shape: CircleBorder(),
      primary: Colors.white54,
    ),
    child: Container(
      width: width,
      height: height,
      alignment: Alignment.center,
      decoration: BoxDecoration(shape: BoxShape.circle),
      child: child,
    ),
    onPressed: onPressed,
  );
}
