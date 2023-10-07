import 'package:flutter_projects/select_flight.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import "package:flutter/material.dart";
import 'package:intl/intl.dart';
import 'colors/colors.dart';

// import 'package:flutter_map/flutter_map.dart';
// import 'package:http/http.dart';

class SearchFlights extends StatefulWidget {
  const SearchFlights({super.key});

  @override
  State<SearchFlights> createState() => _SearchFlightsState();
}

class _SearchFlightsState extends State<SearchFlights> {
  bool isRoundTrip = true;
  List airports = [
    {"name": "Los Angeles International Airport", "code": "LAX"},
    {"name": "John F. Kennedy International Airport", "code": "JFK"},
    {"name": "O'Hare International Airport", "code": "ORD"},
    {"name": "Dallas-Fort Worth International Airport", "code": "DFW"},
    {"name": "Denver International Airport", "code": "DEN"},
    {"name": "San Francisco International Airport", "code": "SFO"},
    {"name": "Hartsfield-Jackson Atlanta International Airport", "code": "ATL"},
    {"name": "Miami International Airport", "code": "MIA"},
    {"name": "Seattle-Tacoma International Airport", "code": "SEA"},
    {"name": "Phoenix Sky Harbor International Airport", "code": "PHX"},
  ];
  DateTime travelDate = DateTime.now();
  DateTime returnDate = DateTime.now();
  int adultCount = 1;

  int teenagerCount = 0;
  int childrenCount = 0;

  int infantCount = 0;
  String classType = "Economy Class";

  int selectedAirportOngoing = -1;
  int selectedAirportReturn = -1;

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Basic dialog title'),
          content: const Text(
            'A dialog is a type of modal window that\n'
            'appears in front of app content to\n'
            'provide critical information, or prompt\n'
            'for a decision to be made.',
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Disable'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Enable'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  airportListDialog(BuildContext context, {required bool isFrom}) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width * 0.9,
      child: ListView.builder(
          itemCount: airports.length,
          itemBuilder: (context, index) {
            debugPrint(airports[index]['name']);
            return ListTile(
              onTap: () {
                setState(() {
                  debugPrint(
                      "airport selected suc... ${airports[index]['name']}");
                  selectedAirportOngoing = isFrom
                      ? index
                      : selectedAirportOngoing >= 0
                          ? selectedAirportOngoing
                          : -1;
                });
                setState(() {
                  selectedAirportReturn = isFrom
                      ? selectedAirportReturn >= 0
                          ? selectedAirportReturn
                          : -1
                      : index;
                });
                Navigator.pop(context);
              },
              title: Text(airports[index]['name']),
              subtitle: Text(airports[index]['code']),
            );
          }),
    );
  }

  passengerDialog(BuildContext context) {
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return SizedBox(
          // height: MediaQuery.of(context).size.height * 0.4,
          // width: MediaQuery.of(context).size.width * 0.5,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Adult
              Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Adult",
                          style: GoogleFonts.poppins(
                              color: const Color.fromRGBO(0, 51, 51, 1),
                              fontWeight: FontWeight.w500,
                              fontSize: 15)),
                      Text("16+ years old at time \n of travel",
                          style: GoogleFonts.poppins(
                              color: const Color.fromRGBO(0, 51, 51, 1),
                              fontWeight: FontWeight.w500,
                              fontSize: 10))
                    ],
                  ),
                  const Spacer(),
                  CircleAvatar(
                    backgroundColor: const Color.fromRGBO(0, 51, 51, 1),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          adultCount = adultCount + 1;
                          setState(() {});
                          debugPrint(adultCount.toString());
                        });
                      },
                      icon: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                  Text(adultCount.toString()),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                  CircleAvatar(
                    backgroundColor: const Color.fromRGBO(0, 51, 51, 1),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          adultCount =
                              adultCount > 1 ? adultCount - 1 : adultCount;
                          setState(() {});
                        });
                      },
                      icon: const Icon(Icons.remove, color: Colors.white),
                    ),
                  )
                ],
              ),
              // teenager
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Teenager",
                          style: GoogleFonts.poppins(
                              color: const Color.fromRGBO(0, 51, 51, 1),
                              fontWeight: FontWeight.w500,
                              fontSize: 15)),
                      Text("12-15 years old at time \n of travel",
                          style: GoogleFonts.poppins(
                              color: const Color.fromRGBO(0, 51, 51, 1),
                              fontWeight: FontWeight.w500,
                              fontSize: 10))
                    ],
                  ),
                  const Spacer(),
                  CircleAvatar(
                    backgroundColor: const Color.fromRGBO(0, 51, 51, 1),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          teenagerCount = teenagerCount + 1;
                        });
                      },
                      icon: const Icon(Icons.add, color: Colors.white),
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                  Text(teenagerCount.toString()),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                  CircleAvatar(
                    backgroundColor: const Color.fromRGBO(0, 51, 51, 1),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          teenagerCount = teenagerCount > 0
                              ? teenagerCount - 1
                              : teenagerCount;
                          debugPrint(teenagerCount.toString());
                        });
                      },
                      icon: const Icon(Icons.remove, color: Colors.white),
                    ),
                  )
                ],
              ),
              //Children
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Children",
                          style: GoogleFonts.poppins(
                              color: const Color.fromRGBO(0, 51, 51, 1),
                              fontWeight: FontWeight.w500,
                              fontSize: 15)),
                      Text("2-11 years old at time \n of travel",
                          style: GoogleFonts.poppins(
                              color: const Color.fromRGBO(0, 51, 51, 1),
                              fontWeight: FontWeight.w500,
                              fontSize: 10))
                    ],
                  ),
                  const Spacer(),
                  CircleAvatar(
                    backgroundColor: const Color.fromRGBO(0, 51, 51, 1),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          childrenCount = childrenCount + 1;
                        });
                      },
                      icon: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                  Text(childrenCount.toString()),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                  CircleAvatar(
                    backgroundColor: const Color.fromRGBO(0, 51, 51, 1),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          childrenCount = childrenCount > 0
                              ? childrenCount - 1
                              : childrenCount;
                        });
                      },
                      icon: const Icon(Icons.remove, color: Colors.white),
                    ),
                  )
                ],
              ),
              //Infant
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Infant",
                          style: GoogleFonts.poppins(
                              color: const Color.fromRGBO(0, 51, 51, 1),
                              fontWeight: FontWeight.w500,
                              fontSize: 15)),
                      Text("Under 2 years old at \n time of travel",
                          style: GoogleFonts.poppins(
                              color: const Color.fromRGBO(0, 51, 51, 1),
                              fontWeight: FontWeight.w500,
                              fontSize: 10))
                    ],
                  ),
                  const Spacer(),
                  CircleAvatar(
                    backgroundColor: const Color.fromRGBO(0, 51, 51, 1),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          infantCount = infantCount + 1;
                        });
                      },
                      icon: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                  Text(infantCount.toString()),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                  CircleAvatar(
                    backgroundColor: const Color.fromRGBO(0, 51, 51, 1),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          infantCount =
                              infantCount > 0 ? infantCount - 1 : infantCount;
                        });
                      },
                      icon: const Icon(Icons.remove, color: Colors.white),
                    ),
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50)),
              color: Color.fromRGBO(0, 24, 78, 1),
            ),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.3,
            child: Stack(children: [
              Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.02,
                      left: MediaQuery.of(context).size.width * 0.05),
                  child: Image.asset("assert/map-2.png")),
              Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.15,
                      left: MediaQuery.of(context).size.width * 0.05),
                  child: Text(
                    "Book Your \n Flight",
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w600),
                  )),


            ]),
          ),

          Container(
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.3),
            decoration: const BoxDecoration(
              color: Color.fromRGBO(0, 24, 78, 1),
            ),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.05,
          ),

          //One way Or Round Trip App
          Container(
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.3),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 4,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(topRight: Radius.circular(50)),
                color: Colors.white),
            child: Column(
              children: [
                //One way Or Round Trip App
                Container(
                  margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.02,
                  ),
                  decoration: BoxDecoration(
                      color: Pallets().thirdColor,
                      borderRadius: BorderRadius.circular(50)),
                  width: MediaQuery.of(context).size.width * 0.90,
                  height: MediaQuery.of(context).size.height * 0.08,
                  child: Row(children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isRoundTrip = true;
                        });
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.45,
                        height: MediaQuery.of(context).size.height * 0.08,
                        decoration: BoxDecoration(
                            color: isRoundTrip
                                ? Pallets().secondaryColor
                                : Pallets().thirdColor,
                            borderRadius: BorderRadius.circular(50)),
                        child: Center(
                            child: Text(
                          "Round Trip",
                          style: TextStyle(
                              color: isRoundTrip
                                  ? Colors.white
                                  : const Color.fromRGBO(0, 24, 78, 1),
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        )),
                      ),
                    ),
                    // SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isRoundTrip = false;
                        });
                      },
                      child: Container(
                          width: MediaQuery.of(context).size.width * 0.45,
                          height: MediaQuery.of(context).size.height * 0.08,
                          decoration: BoxDecoration(
                              color: isRoundTrip
                                  ? Pallets().thirdColor
                                  : Pallets().secondaryColor,
                              borderRadius: BorderRadius.circular(50)),
                          child: Center(
                              child: Text(
                            "Oneway",
                            style: TextStyle(
                                color: isRoundTrip
                                    ? const Color.fromRGBO(0, 24, 78, 1)
                                    : Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ))),
                    ),
                  ]),
                ),
              ],
            ),
          ),

          // From
          Container(
            margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.41,
                left: MediaQuery.of(context).size.width * 0.05),
            child: Text("From",
                style: GoogleFonts.poppins(
                    color: Pallets().mainColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 15)),
          ),
          GestureDetector(
            onTap: () {
              debugPrint("Clicked, airports length ${airports.length}");
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                        title: const Text(
                          'Select an airport',
                          style: TextStyle(color: Colors.black),
                        ),
                        content: airportListDialog(context, isFrom: true));
                  });
            },
            child: Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.44,
                  left: MediaQuery.of(context).size.width * 0.05,
                  right: MediaQuery.of(context).size.width * 0.05),
              height: MediaQuery.of(context).size.height * 0.08,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Pallets().thirdColor,
              ),
              child: Row(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.08,
                    width: MediaQuery.of(context).size.width * 0.2,
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                      // color: Colors.orange,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(50),
                          topLeft: Radius.circular(50)),
                    ),
                    child: SvgPicture.asset(
                      "assert/plane-icon.svg",
                      color: const Color.fromRGBO(0, 24, 78, 1),
                    ),
                  ),
                  selectedAirportOngoing >= 0
                      ? Container(
                          child: Text(airports[selectedAirportOngoing]['code'],
                              style: GoogleFonts.poppins(
                                  color: const Color.fromRGBO(0, 24, 78, 1),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15)),
                        )
                      : const SizedBox()
                ],
              ),
            ),
          ),
          // To
          Container(
            margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.53,
                left: MediaQuery.of(context).size.width * 0.05),
            child: Text("To",
                style: GoogleFonts.poppins(
                    color: const Color.fromRGBO(0, 51, 51, 1),
                    fontWeight: FontWeight.w500,
                    fontSize: 15)),
          ),
          GestureDetector(
            onTap: () {
              debugPrint("Clicked, airports length ${airports.length}");
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                        title: const Text(
                          'Select the arrival airport',
                          style: TextStyle(color: Colors.black),
                        ),
                        content: airportListDialog(context, isFrom: false));
                  });
            },
            child: Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.55,
                  left: MediaQuery.of(context).size.width * 0.05,
                  right: MediaQuery.of(context).size.width * 0.05),
              height: MediaQuery.of(context).size.height * 0.08,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Pallets().thirdColor,
              ),
              child: Row(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.08,
                    width: MediaQuery.of(context).size.width * 0.2,
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(50),
                          topLeft: Radius.circular(50)),
                    ),
                    child: SvgPicture.asset(
                      "assert/plane_icon_1.svg",
                      color: const Color.fromRGBO(0, 24, 78, 1),
                    ),
                  ),
                  selectedAirportReturn >= 0
                      ? Container(
                          child: Text(airports[selectedAirportReturn]['code'],
                              style: GoogleFonts.poppins(
                                  color: const Color.fromRGBO(0, 24, 78, 1),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15)),
                        )
                      : const SizedBox()
                ],
              ),
            ),
          ),
          // Departure date
          Container(
            margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.64,
                left: MediaQuery.of(context).size.width * 0.05),
            height: MediaQuery.of(context).size.height * 0.2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Depart",
                    style: GoogleFonts.poppins(
                        color: const Color.fromRGBO(0, 51, 51, 1),
                        fontWeight: FontWeight.w500,
                        fontSize: 15)),
                GestureDetector(
                  onTap: () => showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Departure Date'),
                          content: SizedBox(
                              height: MediaQuery.of(context).size.height * 0.4,
                              width: MediaQuery.of(context).size.height * 0.4,
                              child: CalendarDatePicker(
                                  initialDate: travelDate,
                                  firstDate: DateTime(2023, 1, 1),
                                  lastDate: DateTime(2023, 12, 31),
                                  onDateChanged: (DateTime newDate) {
                                    setState(() {
                                      travelDate = newDate;
                                    });
                                  })),
                          actions: [
                            TextButton(
                              child: Text('Done',
                                  style: GoogleFonts.poppins(
                                      color: const Color.fromRGBO(0, 51, 51, 1),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15)),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      }),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.08,
                    width: MediaQuery.of(context).size.width * 0.4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Pallets().thirdColor,
                    ),
                    child: Center(
                      child: Text(DateFormat.yMMMd().format(travelDate),
                          style: GoogleFonts.poppins(
                              color: const Color.fromRGBO(0, 24, 78, 1),
                              fontWeight: FontWeight.w500,
                              fontSize: 15)),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Return date
          isRoundTrip
              ? Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.64,
                      left: MediaQuery.of(context).size.width * 0.55),
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Return",
                          style: GoogleFonts.poppins(
                              color: const Color.fromRGBO(0, 51, 51, 1),
                              fontWeight: FontWeight.w500,
                              fontSize: 15)),
                      GestureDetector(
                        onTap: () => showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text('Select a date'),
                                content: SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.4,
                                    width: MediaQuery.of(context).size.height *
                                        0.4,
                                    child: CalendarDatePicker(
                                        initialDate: returnDate,
                                        firstDate: DateTime(2023, 1, 1),
                                        lastDate: DateTime(2023, 12, 31),
                                        onDateChanged: (DateTime newDate) {
                                          setState(() {
                                            returnDate = newDate;
                                          });
                                        })),
                                actions: [
                                  TextButton(
                                    child: Text('Done',
                                        style: GoogleFonts.poppins(
                                            color: const Color.fromRGBO(
                                                0, 51, 51, 1),
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15)),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            }),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.08,
                          width: MediaQuery.of(context).size.width * 0.4,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Pallets().thirdColor,
                          ),
                          child: Center(
                            child: Text(DateFormat.yMMMd().format(returnDate),
                                style: GoogleFonts.poppins(
                                    color: const Color.fromRGBO(0, 24, 78, 1),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15)),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : const SizedBox(),
          // Passengers
          Container(
            margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.76,
                left: MediaQuery.of(context).size.width * 0.05),
            // height: MediaQuery.of(context).size.height * 0.2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Passengers",
                    style: GoogleFonts.poppins(
                        color: const Color.fromRGBO(0, 51, 51, 1),
                        fontWeight: FontWeight.w500,
                        fontSize: 15)),
                GestureDetector(
                  onTap: () => showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('How many passengers? '),
                          content: passengerDialog(context),
                          actions: [
                            TextButton(
                              child: Text('Done',
                                  style: GoogleFonts.poppins(
                                      color: const Color.fromRGBO(0, 51, 51, 1),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15)),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      }),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.08,
                    width: MediaQuery.of(context).size.width * 0.4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Pallets().thirdColor,
                    ),
                    child: Center(
                        child: Text(
                            "${adultCount.toString()} Adult, ${teenagerCount > 0 ? "$teenagerCount Teenager," : ""} "
                            "\n ${childrenCount > 0 ? "$childrenCount Children," : ""}"
                            "${infantCount > 0 ? "$infantCount Infant" : ""} ",
                            style: GoogleFonts.poppins(
                                color: const Color.fromRGBO(0, 24, 78, 1),
                                fontWeight: FontWeight.w500,
                                fontSize: 12))),
                  ),
                ),
              ],
            ),
          ),

          // Class
          Container(
            margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.76,
                left: MediaQuery.of(context).size.width * 0.55),
            height: MediaQuery.of(context).size.height * 0.2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Class",
                    style: GoogleFonts.poppins(
                        color: const Color.fromRGBO(0, 51, 51, 1),
                        fontWeight: FontWeight.w500,
                        fontSize: 15)),
                GestureDetector(
                  onTap: () => showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: SizedBox(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Economy class",
                                    style: GoogleFonts.poppins(
                                        color:
                                            const Color.fromRGBO(0, 51, 51, 1),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15)),
                                TextButton(
                                  onPressed: () {
                                    setState(() {
                                      classType = "Economy plus class";
                                    });
                                    Navigator.pop(context);
                                  },
                                  child: Text("Economy plus class",
                                      style: GoogleFonts.poppins(
                                          color: const Color.fromRGBO(
                                              0, 51, 51, 1),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15)),
                                ),
                                TextButton(
                                  onPressed: () {
                                    setState(() {
                                      classType = "Business class";
                                    });
                                    Navigator.pop(context);
                                  },
                                  child: Text("Business class",
                                      style: GoogleFonts.poppins(
                                          color: const Color.fromRGBO(
                                              0, 51, 51, 1),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15)),
                                ),
                                TextButton(
                                  onPressed: () {
                                    setState(() {
                                      classType = "First class";
                                    });
                                    Navigator.pop(context);
                                  },
                                  child: Text("First class",
                                      style: GoogleFonts.poppins(
                                          color: const Color.fromRGBO(
                                              0, 51, 51, 1),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15)),
                                ),
                              ],
                            ),
                          ),
                          actions: [
                            TextButton(
                              child: Text('Done',
                                  style: GoogleFonts.poppins(
                                      color: const Color.fromRGBO(0, 51, 51, 1),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15)),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      }),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.08,
                    width: MediaQuery.of(context).size.width * 0.4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Pallets().thirdColor,
                    ),
                    child: Center(
                      child: Text(classType,
                          style: GoogleFonts.poppins(
                              color: const Color.fromRGBO(0, 24, 78, 1),
                              fontWeight: FontWeight.w500,
                              fontSize: 15)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Search flights button
          GestureDetector(
            onTap: () {
              if (selectedAirportReturn >= 0 && selectedAirportOngoing >= 0) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SelectFlight(
                            arrivalAirportCode: airports[selectedAirportOngoing]
                                ['code'],
                            arrivalAirportName: airports[selectedAirportOngoing]
                                ['name'],
                            arrivalAirportCountry: '',
                            departureAirportCode:
                                airports[selectedAirportReturn]['code'],
                            departureAirportName:
                                airports[selectedAirportReturn]['name'],
                            departureAirportCountry: '',
                            departureDate: travelDate,
                            arrivalDate: returnDate)));
              } else {
                null;
              }
            },
            child: Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.9,
                  left: MediaQuery.of(context).size.width * 0.05,
                  right: MediaQuery.of(context).size.width * 0.05),
              height: MediaQuery.of(context).size.height * 0.08,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Pallets().secondaryColor),
              child: Center(
                  child: Text(
                "Search Flights",
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 20),
              )),
            ),
          ),
        ],
      ),
    );
  }
}
