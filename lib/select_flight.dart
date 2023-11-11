import 'package:flutter/material.dart';
import 'package:flutter_projects/widgets/flight_card.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import 'modules/flight_details_module.dart';

class SelectFlight extends StatefulWidget {
  String departureAirportCode;
  String departureAirportCountry;
  String departureAirportName;
  DateTime departureDate;
  DateTime arrivalDate;
  String arrivalAirportCode;
  String arrivalAirportCountry;
  String arrivalAirportName;


  SelectFlight(
      {super.key,
     required this.departureAirportName,
        required this.departureAirportCode,
        required this.departureAirportCountry,
        required this.arrivalAirportCode,
        required this.arrivalAirportCountry,
        required this.arrivalAirportName,
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
            // width: MediaQuery.of(context).size.width,
            // height: MediaQuery.of(context).size.height * 0.3,
            color: Colors.white,
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.3,
                  decoration: const BoxDecoration(
                    borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(50)),
                    color: Color.fromRGBO(0, 24, 78, 1),
                  ),
                  // child:   Image.asset("assert/flight-icon-2.png"),
                  // child: SvgPicture.asset("assert/flt-icon-icon-1.svg",
                  //     height: 140,
                  //     fit: BoxFit.contain,
                  //     color:Colors.orange
                  // ),
                ),
                Container(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.02,
                      left: MediaQuery.of(context).size.width * 0.05),
                  decoration: const BoxDecoration(
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(50)),
                    color: Color.fromRGBO(0, 24, 78, 1),
                  ),
                  child:   Image.asset("assert/map-2.png"),
                  ),
                Container(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.02,
                      left: MediaQuery.of(context).size.width * 0.05),
                  decoration: const BoxDecoration(
                    borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(50)),
                    color: Color.fromRGBO(0, 24, 78, 1),
                  ),
                  // child: Image.asset("assert/flight-icon-4.png"),
                ),

              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.698,
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
                          airlineName: "Airfrance",
                          departureAirportCode: widget.departureAirportCode,
                          departureCountryName: "Paris",
                          departureAirportName: widget.departureAirportName,
                          arrivalAirportName: "Peretola Airport",
                          arrivalCountryName: "Florance",
                          arrivalAirportCode: "FLR",
                          departureDate: DateFormat.yMMMd().format(widget.departureDate),
                          departureTime: "09:30AM",
                          arrivalDate: DateFormat.yMMMd().format(widget.arrivalDate),
                          arrivalTime: "11:45AM",
                          flightDuration: "1h 45m",
                          transit: "Non-stop")),
                  flightDetails(context,
                      flightDetails: FlightDetails(
                          airlineName: "Airfrance",
                          departureAirportCode: widget.departureAirportCode,
                          departureCountryName: "Paris",
                          departureAirportName: widget.departureAirportName,
                          arrivalAirportName: "Peretola Airport",
                          arrivalCountryName: "Florance",
                          arrivalAirportCode: "FLR",
                          departureDate: DateFormat.yMMMd().format(widget.departureDate),
                          departureTime: "09:30AM",
                          arrivalDate: DateFormat.yMMMd().format(widget.arrivalDate),
                          arrivalTime: "11:45AM",
                          flightDuration: "1h 45m",
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
