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

  factory UserLocation.fromMap(Map<String, dynamic> e) {
    return UserLocation(
        city: e['location']['city'],
        country: e['location']['country'],
        postcode: e['location']['postcode'].toString(),
        state: e['location']['state'],
        coordinates: LocationCoordinates.fromMap(e),
        street: LocationStreet.fromMap(e),
        timeZone: LocationTimeZone.fromMap(e));
  }
}

class LocationStreet {
  final int number; // was int number but its giving error
  final String name;

  LocationStreet({required this.number, required this.name});

  factory LocationStreet.fromMap(Map<String, dynamic> e) {
    return LocationStreet(
        name: e['location']['street']['name'],
        number: e['location']['street']['number']);
  }
}

class LocationCoordinates {
  final String latitude;
  final String longitude;

  LocationCoordinates({required this.latitude, required this.longitude});

  factory LocationCoordinates.fromMap(Map<String, dynamic> e) {
    return LocationCoordinates(
        latitude: e['location']['coordinates']['latitude'],
        longitude: e['location']['coordinates']['longitude']);
  }
}

class LocationTimeZone {
  final String offset;
  final String description;

  LocationTimeZone({required this.offset, required this.description});

  factory LocationTimeZone.fromMap(Map<String, dynamic> e) {
    return LocationTimeZone(
        offset: e['location']['timezone']['offset'],
        description: e['location']['timezone']['description']);
  }
}
