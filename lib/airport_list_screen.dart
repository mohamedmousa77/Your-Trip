import 'package:flutter/material.dart';

import 'modules/airport_module.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class AirportListScreen extends StatefulWidget {
  const AirportListScreen({super.key});

  @override
  State<AirportListScreen> createState() => _AirportListScreenState();
}

class _AirportListScreenState extends State<AirportListScreen> {
  List<Airport> airports = [];

  Future<void> fetchAirports() async {
    final response = await http.get(Uri.parse('ttps://airlabs.co/api/v9/airports?api_key=9c6e9ce2-0ab9-45c8-8cf0-79c9c9350273'));
    debugPrint("response status: ${response.statusCode}");
    try{
      if (response.statusCode == 200) {
        debugPrint("response is 200");
        final data = json.decode(response.body);
        debugPrint("data: ${data.toString()}");
        final List<dynamic> airportList = data['airports'];
        setState(() {
          airports = airportList
              .map((airport)  => Airport(name: airport['name'], code: airport['code']))
              .toList();
        });
      }
    }catch(ex){debugPrint(ex.toString());}




  }

  @override
  void initState() {
    super.initState();
    fetchAirports();
    debugPrint(airports.length.toString());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Airport List'),
      ),
      body: ListView.builder(
        itemCount: airports.length,
        itemBuilder: (context, index) {
          final airport = airports[index];
          return ListTile(
            title: Text(airport.name),
            subtitle: Text(airport.code),
          );
        },
      ),
    );
  }
}


