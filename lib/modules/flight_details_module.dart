class FlightDetails {
  String departureAirportName;
  String departureAirportCode;
  String departureCountryName;
  String arrivalAirportName;
  String arrivalAirportCode;
  String arrivalCountryName;
  String airlineName ;
  String departureTime ;
  String departureDate ;
  String arrivalTime;
  String arrivalDate;
  String flightDuration;
  String transit ;
  String airlineLogo;


  FlightDetails(
      {required this.airlineName ,
        required this.airlineLogo,
      required this.departureAirportName,
      required this.departureAirportCode,
      required this.departureCountryName,
      required this.arrivalAirportName,
      required this.arrivalAirportCode,
      required this.arrivalCountryName,
      required this.arrivalDate,
      required this.arrivalTime,
      required this.departureDate,
      required this.departureTime,
      required this.flightDuration,
      required this.transit});
}
