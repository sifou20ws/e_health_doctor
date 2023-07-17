

import 'package:e_health_doctor/Services/graph_service.dart';

class CriticalValues {
  static const int glucoseMaxNormal = 140;
  static const int glucoseMinNormal = 70;

  static const int heartBeatMaxNormal = 100;
  static const int heartBeatMinNormal = 60;

  static const int bloodPressureSystoMaxNormal = 120;
  static const int bloodPressureSystoMinNormal = 90;

  static const int bloodPressureDiastoMaxNormal = 80;
  static const int bloodPressureDiastoMinNormal = 60;

  static const double temperatureMaxNormal = 38.1;
  static const double temperatureMinNormal = 37;

  static int isAnomaly(dynamic data) {
    if (data is GlucoseTimedData) {
      if (data.value < glucoseMinNormal)
        return -1;
      else if (data.value > glucoseMaxNormal)
        return 1;
      else
        return 0;
    }
    if (data is TemperatureTimedData) if (data.value < temperatureMinNormal)
      return -1;
    else if (data.value > temperatureMaxNormal)
      return 1;
    else
      return 0;

    if (data is HeartBeatTimedData) if (data.value < heartBeatMinNormal)
      return -1;
    else if (data.value > heartBeatMaxNormal)
      return 1;
    else
      return 0;

    if (data is BloodPressureTimedData) if (data.systolicPressure <
            bloodPressureSystoMinNormal ||
        data.diastolicPressure < bloodPressureDiastoMinNormal)
      return -1;
    else if (data.systolicPressure > bloodPressureSystoMaxNormal ||
        data.diastolicPressure > bloodPressureDiastoMaxNormal)
      return 1;
    else
      return 0;
    return 0;
  }

  static bool isTemperatureAnomaly(int value) {
    return (value < temperatureMinNormal || value > temperatureMaxNormal);
  }
}
