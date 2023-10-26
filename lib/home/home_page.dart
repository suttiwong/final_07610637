import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedTabIndex = 0; // 0 หรือ 1 สำหรับแสดงข้อมูลที่ต้องการ
  final List<String> locations = ['Bangkok', 'Korea'];
  Map<String, dynamic> weatherData = {}; // สร้าง Map สำหรับเก็บข้อมูล

  @override
  void initState() {
    super.initState();
    fetchWeatherData(); // เรียกดึงข้อมูลเมื่อแอพพลิเคชันเริ่มต้น
  }

  Future<void> fetchWeatherData() async {
    final dio = Dio();
    for (int i = 0; i < locations.length; i++) {
      final response = await dio.get(
        'https://cpsu-test-api.herokuapp.com/api/1_2566/weather/current?city=${locations[i]}',
      );
      if (response.statusCode == 200) {
        final data = json.decode(response.data);
        setState(() {
          weatherData[locations[i]] = data['data'];
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(locations[selectedTabIndex]),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('City: ${locations[selectedTabIndex]}'),
                Text('Country: ${weatherData[locations[selectedTabIndex]]['country']}'),
                Text('Last Updated: ${weatherData[locations[selectedTabIndex]]['lastUpdated']}'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Temp C: ${weatherData[locations[selectedTabIndex]]['tempC']}'),
                Text('Temp F: ${weatherData[locations[selectedTabIndex]]['tempF']}'),
                Text('Feels Like C: ${weatherData[locations[selectedTabIndex]]['feelsLikeC']}'),
                Text('Feels Like F: ${weatherData[locations[selectedTabIndex]]['feelsLikeF']}'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Wind KPH: ${weatherData[locations[selectedTabIndex]]['windKph']}'),
                Text('Wind MPH: ${weatherData[locations[selectedTabIndex]]['windMph']}'),
                Text('Humidity: ${weatherData[locations[selectedTabIndex]]['humidity']}'),
                Text('UV: ${weatherData[locations[selectedTabIndex]]['uv']}'),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            label: 'Bangkok',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            label: 'Korea',
          ),
        ],
        currentIndex: selectedTabIndex,
        onTap: (index) {
          setState(() {
            selectedTabIndex = index;
          });
        },
      ),
    );
  }
}
