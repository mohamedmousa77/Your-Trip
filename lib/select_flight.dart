import 'package:flutter/material.dart';
import 'package:flutter_projects/widgets/flight_card.dart';
import 'package:intl/intl.dart';

import 'modules/flight_details_module.dart';

class SelectFlight extends StatefulWidget {
  String departureAirportCode;
  String departureCountryName;
  DateTime departureDate;
  DateTime arrivalDate;
  String arrivalAirportCode;
  String arrivalCountryName;


  SelectFlight(
      {super.key,
        required this.departureAirportCode,
        required this.departureCountryName,
        required this.arrivalAirportCode,
        required this.arrivalCountryName,
      required this.departureDate,
      required this.arrivalDate});

  @override
  State<SelectFlight> createState() => _SelectFlightState();
}

class _SelectFlightState extends State<SelectFlight> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 24, 78, 1),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            child: Stack(
              children: [
                Container(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.02,
                      left: MediaQuery.of(context).size.width * 0.05),
                  decoration: const BoxDecoration(
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(50)),
                    color: Color.fromRGBO(0, 24, 78, 1),
                  ),
                  child:   Image.asset("assert/map-icon.png"),
                  ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.69,
            width: MediaQuery.of(context).size.width,
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(topRight: Radius.circular(50)),
              color: Colors.white,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  flightDetails(context,
                      flightDetails: FlightDetails(
                          airlineLogo: 'airfrance-logo.png',
                          airlineName: "Airfrance",
                          departureAirportCode: widget.departureAirportCode,
                          departureCountryName: widget.departureCountryName,
                          arrivalCountryName: widget.arrivalCountryName,
                          arrivalAirportCode: widget.arrivalAirportCode,
                          departureDate: DateFormat.yMMMd().format(widget.departureDate),
                          departureTime: "09:30AM",
                          arrivalDate: DateFormat.yMMMd().format(widget.arrivalDate),
                          arrivalTime: "11:45AM",
                          flightDuration: "1h 45m",
                          transit: "Non-stop")),
                  flightDetails(context,
                      flightDetails: FlightDetails(
                          airlineName: "RyanAir",
                          departureAirportCode: widget.departureAirportCode,
                          departureCountryName: widget.departureCountryName,
                          arrivalCountryName: widget.arrivalCountryName,
                          arrivalAirportCode: widget.arrivalAirportCode,
                          departureDate: DateFormat.yMMMd().format(widget.departureDate),
                          departureTime: "09:30AM",
                          arrivalDate: DateFormat.yMMMd().format(widget.arrivalDate),
                          arrivalTime: "11:45AM",
                          flightDuration: "1h 45m",
                          airlineLogo: 'ryn-logo.png',
                          transit: "Non-stop")),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
