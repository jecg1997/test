// To parse this JSON data, do
//
//     final sensorInfo = sensorInfoFromJson(jsonString);

import 'dart:convert';

SensorInfo sensorInfoFromJson(String str) =>
    SensorInfo.fromJson(json.decode(str));

String sensorInfoToJson(SensorInfo data) => json.encode(data.toJson());

class SensorInfo {
  SensorInfo({
    this.imu,
    this.gps,
  });

  Map<String, List<double>> imu;
  Gps gps;

  factory SensorInfo.fromJson(Map<String, dynamic> json) => SensorInfo(
        imu: Map.from(json["IMU"]).map((k, v) => MapEntry<String, List<double>>(
            k, List<double>.from(v.map((x) => x.toDouble())))),
        gps: Gps.fromJson(json["GPS"]),
      );

  Map<String, dynamic> toJson() => {
        "IMU": Map.from(imu).map((k, v) =>
            MapEntry<String, dynamic>(k, List<dynamic>.from(v.map((x) => x)))),
        "GPS": gps.toJson(),
      };
}

class Gps {
  Gps({
    this.latitude,
    this.longitude,
    this.altitude,
    this.sat,
  });

  List<int> latitude;
  List<int> longitude;
  List<int> altitude;
  List<String> sat;

  factory Gps.fromJson(Map<String, dynamic> json) => Gps(
        latitude: List<int>.from(json["Latitude"].map((x) => x)),
        longitude: List<int>.from(json["Longitude"].map((x) => x)),
        altitude: List<int>.from(json["Altitude"].map((x) => x)),
        sat: List<String>.from(json["Sat#"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "Latitude": List<dynamic>.from(latitude.map((x) => x)),
        "Longitude": List<dynamic>.from(longitude.map((x) => x)),
        "Altitude": List<dynamic>.from(altitude.map((x) => x)),
        "Sat#": List<dynamic>.from(sat.map((x) => x)),
      };
}
