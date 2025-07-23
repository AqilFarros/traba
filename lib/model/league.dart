part of 'model.dart';

class League {
  final int id;
  final String name;
  final Country country;
  final String logo;

  const League({
    required this.id,
    required this.name,
    required this.country,
    required this.logo,
  });

  factory League.fromJson(Map<String, dynamic> json) => League(
    id: json['league']['id'],
    name: json['league']['name'],
    country: Country(
      name: json['country']['name'],
      flag: json['country']['flag'] ?? "",
    ),
    logo: json['league']['logo'],
  );
}

class Country {
  final String name;
  final String flag;

  const Country({required this.name, required this.flag});
}
