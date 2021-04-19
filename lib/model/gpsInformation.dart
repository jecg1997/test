// To parse this JSON data, do
//
//     final gpsInformation = gpsInformationFromJson(jsonString);

import 'dart:convert';

GpsInformation gpsInformationFromJson(String str) =>
    GpsInformation.fromJson(json.decode(str));

String gpsInformationToJson(GpsInformation data) => json.encode(data.toJson());

class GpsInformation {
  GpsInformation({
    this.imuInformation,
    this.gpsInformation,
    this.networkInfo,
    this.radioStatus,
    this.batteryStatus,
  });

  ImuInformation imuInformation;
  GpsInformationClass gpsInformation;
  NetworkInfo networkInfo;
  RadioStatus radioStatus;
  BatteryStatus batteryStatus;

  factory GpsInformation.fromJson(Map<String, dynamic> json) => GpsInformation(
        imuInformation: ImuInformation.fromJson(json["IMU-Information"]),
        gpsInformation: GpsInformationClass.fromJson(json["GPS-Information"]),
        networkInfo: NetworkInfo.fromJson(json["Network-Info"]),
        radioStatus: RadioStatus.fromJson(json["Radio-Status"]),
        batteryStatus: BatteryStatus.fromJson(json["Battery-Status"]),
      );

  Map<String, dynamic> toJson() => {
        "IMU-Information": imuInformation.toJson(),
        "GPS-Information": gpsInformation.toJson(),
        "Network-Info": networkInfo.toJson(),
        "Radio-Status": radioStatus.toJson(),
        "Battery-Status": batteryStatus.toJson(),
      };
}

class BatteryStatus {
  BatteryStatus({
    this.voltage,
    this.current,
  });

  String voltage;
  String current;

  factory BatteryStatus.fromJson(Map<String, dynamic> json) => BatteryStatus(
        voltage: json["Voltage"],
        current: json["Current"],
      );

  Map<String, dynamic> toJson() => {
        "Voltage": voltage,
        "Current": current,
      };
}

class GpsInformationClass {
  GpsInformationClass({
    this.latitude,
    this.longitude,
    this.altitude,
  });

  String latitude;
  String longitude;
  String altitude;

  factory GpsInformationClass.fromJson(Map<String, dynamic> json) =>
      GpsInformationClass(
        latitude: json["Latitude"],
        longitude: json["Longitude"],
        altitude: json["Altitude"],
      );

  Map<String, dynamic> toJson() => {
        "Latitude": latitude,
        "Longitude": longitude,
        "Altitude": altitude,
      };
}

class ImuInformation {
  ImuInformation({
    this.acceleration,
    this.magnetometer,
  });

  String acceleration;
  String magnetometer;

  factory ImuInformation.fromJson(Map<String, dynamic> json) => ImuInformation(
        acceleration: json["Acceleration"],
        magnetometer: json["Magnetometer"],
      );

  Map<String, dynamic> toJson() => {
        "Acceleration": acceleration,
        "Magnetometer": magnetometer,
      };
}

class NetworkInfo {
  NetworkInfo({
    this.ip,
    this.connectionStatus,
  });

  String ip;
  String connectionStatus;

  factory NetworkInfo.fromJson(Map<String, dynamic> json) => NetworkInfo(
        ip: json["Ip"],
        connectionStatus: json["ConnectionStatus"],
      );

  Map<String, dynamic> toJson() => {
        "Ip": ip,
        "ConnectionStatus": connectionStatus,
      };
}

class RadioStatus {
  RadioStatus({
    this.connectionStatus,
  });

  String connectionStatus;

  factory RadioStatus.fromJson(Map<String, dynamic> json) => RadioStatus(
        connectionStatus: json["Connection-Status"],
      );

  Map<String, dynamic> toJson() => {
        "Connection-Status": connectionStatus,
      };
}
