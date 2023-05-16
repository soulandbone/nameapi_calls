class UserLocation {
  final LocationStreet street;
  final String city;
  final String state;
  final String country;
  final String postcode;
  final LocationCoordinates coordinates;
  final LocationTimeZone timeZone;

  UserLocation(
      {required this.street,
      required this.city,
      required this.state,
      required this.country,
      required this.postcode,
      required this.coordinates,
      required this.timeZone});

  factory UserLocation.fromMap(Map<String, dynamic> json) {
    final coordinates = LocationCoordinates.fromMap(json['coordinates']);
    final street = LocationStreet.fromMap(json['street']);
    final timezone = LocationTimeZone.fromMap(json['timezone']);
    return UserLocation(
        city: json['city'],
        country: json['country'],
        postcode: json['postcode'].toString(),
        state: json['state'],
        coordinates: coordinates,
        street: street,
        timeZone: timezone);
  }
}

class LocationStreet {
  final int number; // was int number but its giving error
  final String name;

  LocationStreet({required this.number, required this.name});

  factory LocationStreet.fromMap(Map<String, dynamic> json) {
    return LocationStreet(name: json['name'], number: json['number']);
  }
}

class LocationCoordinates {
  final String latitude;
  final String longitude;

  LocationCoordinates({required this.latitude, required this.longitude});

  factory LocationCoordinates.fromMap(Map<String, dynamic> json) {
    return LocationCoordinates(
        latitude: json['latitude'], longitude: json['longitude']);
  }
}

class LocationTimeZone {
  final String offset;
  final String description;

  LocationTimeZone({required this.offset, required this.description});

  factory LocationTimeZone.fromMap(Map<String, dynamic> json) {
    return LocationTimeZone(
        offset: json['offset'], description: json['description']);
  }
}
