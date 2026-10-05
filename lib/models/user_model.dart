// Data models representing a User and their nested structures.
// Matches the JSON response from https://jsonplaceholder.typicode.com/users

class Geo {
  final String lat;
  final String lng;

  const Geo({required this.lat, required this.lng});

  factory Geo.fromJson(Map<String, dynamic> json) {
    return Geo(
      lat: (json['lat'] ?? '').toString(),
      lng: (json['lng'] ?? '').toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {'lat': lat, 'lng': lng};
  }
}

class Address {
  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final Geo geo;

  const Address({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo,
  });

  /// Helper getter to display the complete human-readable address.
  String get formattedAddress => '$suite, $street, $city - $zipcode';

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      street: (json['street'] ?? '').toString(),
      suite: (json['suite'] ?? '').toString(),
      city: (json['city'] ?? '').toString(),
      zipcode: (json['zipcode'] ?? '').toString(),
      geo: Geo.fromJson((json['geo'] as Map<String, dynamic>?) ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'street': street,
      'suite': suite,
      'city': city,
      'zipcode': zipcode,
      'geo': geo.toJson(),
    };
  }
}

class Company {
  final String name;
  final String catchPhrase;
  final String bs;

  const Company({
    required this.name,
    required this.catchPhrase,
    required this.bs,
  });

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      name: (json['name'] ?? '').toString(),
      catchPhrase: (json['catchPhrase'] ?? '').toString(),
      bs: (json['bs'] ?? '').toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {'name': name, 'catchPhrase': catchPhrase, 'bs': bs};
  }
}

class User {
  final int id;
  final String name;
  final String username;
  final String email;
  final Address address;
  final String phone;
  final String website;
  final Company company;

  const User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
    required this.phone,
    required this.website,
    required this.company,
  });

  /// Returns user's initial for avatar display.
  String get initial {
    if (name.trim().isEmpty) return '?';
    return name.trim()[0].toUpperCase();
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] is int
          ? json['id'] as int
          : int.tryParse(json['id'].toString()) ?? 0,
      name: (json['name'] ?? '').toString(),
      username: (json['username'] ?? '').toString(),
      email: (json['email'] ?? '').toString(),
      address: Address.fromJson(
        (json['address'] as Map<String, dynamic>?) ?? {},
      ),
      phone: (json['phone'] ?? '').toString(),
      website: (json['website'] ?? '').toString(),
      company: Company.fromJson(
        (json['company'] as Map<String, dynamic>?) ?? {},
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'username': username,
      'email': email,
      'address': address.toJson(),
      'phone': phone,
      'website': website,
      'company': company.toJson(),
    };
  }
}
