import 'package:circle_button/circle_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dashboard extends StatelessWidget {
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
      child: Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            header(),
            mainButtons(),
            footer(),
          ],
        ),
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
              'images/logo.png',
              height: 200,
            ),
            Image.asset(
              'images/nasa.png',
              height: 100,
            ),
          ],
        ),
        Row(
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
      ],
    );
  }

  Widget mainButtons() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            color: Colors.white54,
            padding: EdgeInsets.all(20),
            child: Text(
              'Select Operation Mode',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 100),
              child: CircleButton(
                onPressed: () {},
                height: MediaQuery.of(Get.context).size.width * 0.20,
                child: Text(
                  'IMU Information',
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: CircleButton(
                  onPressed: () {},
                  height: MediaQuery.of(Get.context).size.width * 0.20,
                  child: Text(
                    '   GPS Data   ',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 100),
              child: CircleButton(
                  onPressed: () {},
                  height: MediaQuery.of(Get.context).size.width * 0.20,
                  child: Text(
                    ' Battery Status ',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: CircleButton(
                  onPressed: () {},
                  height: MediaQuery.of(Get.context).size.width * 0.20,
                  child: Text(
                    '  UHF Status  ',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 100),
              child: CircleButton(
                  onPressed: () {},
                  height: MediaQuery.of(Get.context).size.width * 0.20,
                  child: Text(
                    ' Network Info ',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  )),
            ),
          ],
        ),
      ],
    );
  }

  Widget footer() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.green[700],
            ),
            onPressed: () {
              print('BUTON');
            },
            child: Text(
              'Start',
              style: TextStyle(fontSize: 20),
            ),
          ),
          Container(
            width: 200,
            color: Colors.grey,
            padding: EdgeInsets.all(10),
            child: Text(
              'Status: ',
              style: TextStyle(fontSize: 20),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.red[700],
            ),
            onPressed: () {
              print('BUTON');
            },
            child: Text(
              'Stop',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
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
