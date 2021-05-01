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
    this.battery,
  });

  Map<String, List<double>> imu;
  Gps gps;
  Battery battery;

  factory SensorInfo.fromJson(Map<String, dynamic> json) => SensorInfo(
        imu: Map.from(json["IMU"]).map((k, v) => MapEntry<String, List<double>>(
            k, List<double>.from(v.map((x) => x.toDouble())))),
        gps: Gps.fromJson(json["GPS"]),
        battery: Battery.fromJson(json["Battery"]),
      );

  Map<String, dynamic> toJson() => {
        "IMU": Map.from(imu).map((k, v) =>
            MapEntry<String, dynamic>(k, List<dynamic>.from(v.map((x) => x)))),
        "GPS": gps.toJson(),
        "Battery": battery.toJson(),
      };
}

class Battery {
  Battery({
    this.voltage,
    this.current,
    this.power,
  });

  List<double> voltage;
  List<double> current;
  List<int> power;

  factory Battery.fromJson(Map<String, dynamic> json) => Battery(
        voltage: List<double>.from(json["Voltage"].map((x) => x.toDouble())),
        current: List<double>.from(json["Current"].map((x) => x.toDouble())),
        power: List<int>.from(json["Power"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "Voltage": List<dynamic>.from(voltage.map((x) => x)),
        "Current": List<dynamic>.from(current.map((x) => x)),
        "Power": List<dynamic>.from(power.map((x) => x)),
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
