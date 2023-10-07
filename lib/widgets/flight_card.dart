import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../modules/flight_details_module.dart';

Container flightDetails(BuildContext context,
        {required FlightDetails flightDetails}) =>
    (Container(
      height: MediaQuery.of(context).size.height * 0.3,
      width: MediaQuery.of(context).size.width * 0.9,
      padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.width * 0.05,
        right: MediaQuery.of(context).size.width * 0.05,
        bottom:  MediaQuery.of(context).size.height * 0.01,
        top: MediaQuery.of(context).size.height * 0.02,
      ),
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: const Color.fromRGBO(97, 146, 160, 0.3),
      ),
      child: Column(
        children: [
          // Departure and Arrival airport details
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(flightDetails.departureAirportCode,
                      style: GoogleFonts.poppins(
                          color: const Color.fromRGBO(6, 6, 109, 1),
                          fontWeight: FontWeight.w600)),
                  Text(flightDetails.departureCountryName,
                      style: GoogleFonts.poppins(
                          color: const Color.fromRGBO(0, 51, 51, 1))),
                  Text(flightDetails.departureAirportName.replaceRange(20,flightDetails.departureAirportName.length, '...'),
                      style: GoogleFonts.poppins(
                          color: const Color.fromRGBO(0, 51, 51, 1))),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(flightDetails.arrivalAirportCode,
                      style: GoogleFonts.poppins(
                          color: const Color.fromRGBO(6, 6, 109, 1),
                          fontWeight: FontWeight.w600)),
                  Text(flightDetails.arrivalCountryName,
                      style: GoogleFonts.poppins(
                          color: const Color.fromRGBO(0, 51, 51, 1))),
                  Text(flightDetails.arrivalAirportName,
                      style: GoogleFonts.poppins(
                          color: const Color.fromRGBO(0, 51, 51, 1))),
                ],
              ),
            ],
          ),
          Container(height: MediaQuery.of(context).size.height *0.05),
          // Departure Data and Time --- Duration & transit ---- Arrival Date and Time
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Depart",
                      style: GoogleFonts.poppins(
                          color: const Color.fromRGBO(0, 196, 196, 1),
                          fontWeight: FontWeight.w600)),
                  Text(flightDetails.departureDate,
                      style: GoogleFonts.poppins(
                          color: const Color.fromRGBO(0, 51, 51, 1))),
                  Text(flightDetails.departureTime,
                      style: GoogleFonts.poppins(
                          color: const Color.fromRGBO(0, 51, 51, 1))),
                ],
              ),

              Column(
                children: [
                  Text(flightDetails.flightDuration,
                      style: GoogleFonts.poppins(
                          color: const Color.fromRGBO(0, 196, 196, 0.7),
                          fontWeight: FontWeight.w400)),
                  Text(flightDetails.transit,
                      style: GoogleFonts.poppins(
                          color: const Color.fromRGBO(0, 196, 196, 0.7))),
                ],
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Arrive",
                      style: GoogleFonts.poppins(
                          color: const Color.fromRGBO(0, 196, 196, 1),
                          fontWeight: FontWeight.w600)),
                  Text(flightDetails.arrivalDate,
                      style: GoogleFonts.poppins(
                          color: const Color.fromRGBO(0, 51, 51, 1))),
                  Text(flightDetails.arrivalTime,
                      style: GoogleFonts.poppins(
                          color: const Color.fromRGBO(0, 51, 51, 1))),
                ],
              ),
            ],
          ),
          // Air line name and price
          Spacer(),
          Row(

            children: [
              Container(
                color: Colors.transparent,
                child: Text(flightDetails.airlineName.toUpperCase(),
                    style: GoogleFonts.poppins(fontWeight: FontWeight.bold,fontSize: 20,
                        color: const Color.fromRGBO(6, 6, 109, 1))),
              ),
            ],
          ),
        ],
      ),
    ));
