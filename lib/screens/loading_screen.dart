import 'dart:convert';

import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';

import 'package:http/http.dart' as http;
import 'package:clima/services/networking.dart';

const apiKey = '83d62233e94ffbecafd7c98db75f4b43';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
//  double longitude, latitude;

  @override
  void initState() {
    super.initState();

    getLocationData();
  }

  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
//    latitude = location.latitude;
//    longitude = location.longitude;
    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey');
    var weatherData = await networkHelper.getData();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(weatherData);
    }));
    // print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    String margin = 'abc';
    double neededMarginValue;
    try {
      neededMarginValue = double.parse(margin);
    } catch (e) {
      neededMarginValue = 30.0;
    }
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
