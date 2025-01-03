import 'package:flutter/material.dart';

class LocationState extends ChangeNotifier {
  double? _latitude;
  double? _longitude;
  bool? _locServiceEnabled;
  bool? _hasLocPermission;
  bool _error = false;

  void setLocation(double lat, double lon) {
    _latitude = lat;
    _longitude = lon;
    _locServiceEnabled = true;
    _hasLocPermission = true;
    _error = false;
    notifyListeners();
  }

  void setLocServicesDisabled() {
    _locServiceEnabled = false;
    notifyListeners();
  }

  void setNoLocPermission() {
    _hasLocPermission = false;
    notifyListeners();
  }

  void setError() {
    _error = true;
    notifyListeners();
  }

  double? getLatitude() {
    return _latitude;
  }

  double? getLongitude() {
    return _longitude;
  }

  bool? getLocServiceEnabled() {
    return _locServiceEnabled;
  }

  bool? getHasLocPermission() {
    return _hasLocPermission;
  }

  bool hasError() {
    return _error;
  }
}