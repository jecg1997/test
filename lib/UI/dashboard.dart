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
      child: Stack(
        children: [
          Positioned(
            left: 750,
            top: 50,
            child: title(),
          ),
          Positioned(
            top: 75,
            left: 75,
            child: MaterialButton(
              colorBrightness: Brightness.dark,
              onPressed: () {},
              child: Text(
                'Gandalf Staff Home',
                style: TextStyle(fontSize: 35),
              ),
            ),
          ),

          //Padding(padding: const EdgeInsets.all(50.0)),
          Positioned(
            bottom: 45,
            child: mainButtons(),
          ),

          Positioned(
            top: 0,
            right: 50,
            child: Obx(
              () => CircleButton(
                state: state,
                height: 325,
                width: 350,
                onPressed: () {
                  if (state.isRunning()) {
                    state.stopTimer();
                  } else {
                    state.startTimer();
                  }
                },
                child: Text(
                  state.isRunning() ? 'Stop' : 'Start',
                  style: TextStyle(fontSize: 40),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Row header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset(
          'assets/logo.png',
          height: 250,
        ),
        Image.asset(
          'assets/nasa.png',
          height: 200,
        ),
        Image.asset(
          'assets/tstar.jpg',
          height: 100,
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
        height: 180,
        child: Obx(
          () => Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Hypertech Nav/Com System',
                style: TextStyle(fontSize: 30),
              ),
              Text(
                state.isRunning() ? 'Status: Running' : 'Status: Stopped',
                style: TextStyle(fontSize: 30),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget mainButtons() {
    double percent = Get.width * 0.3;
    return SizedBox(
      width: Get.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: GridView.count(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          childAspectRatio: 4.0,
          mainAxisSpacing: 35,
          crossAxisCount: 2,
          crossAxisSpacing: 50,
          children: [
            Obx(
              () => DetailContainer(
                title: 'IMU Information',
                gpsInfo: state.demoString.value.imuInformation?.toJson(),
              ),
            ),
            Obx(
              () => DetailContainer(
                title: 'GPS Information',
                gpsInfo: state.demoString.value.gpsInformation?.toJson(),
              ),
            ),
            Obx(
              () => DetailContainer(
                title: 'Battery Status',
                gpsInfo: state.demoString.value.batteryStatus?.toJson(),
              ),
            ),
            Obx(
              () => DetailContainer(
                title: 'Lidar Power Information',
                gpsInfo: state.demoString.value.batteryStatus?.toJson(),
              ),
            ),
            Obx(
              () => DetailContainer(
                title: 'Network Status',
                gpsInfo: state.demoString.value.networkInfo?.toJson(),
              ),
            ),
            header(),
          ],
        ),
      ),
    );
  }
}

ElevatedButton CircleButton(
    {Widget child,
    onPressed(),
    double width,
    double height,
    MainController state}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      shape: CircleBorder(),
      primary: state.isRunning() ? Colors.red[700] : Colors.green[700],
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
