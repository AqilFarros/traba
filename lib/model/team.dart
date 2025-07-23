part of 'model.dart';

class Team {
  final int id;
  final String name;
  final String image;
  final Venue venue;

  const Team({
    required this.id,
    required this.name,
    required this.image,
    required this.venue,
  });

  factory Team.fromJson(Map<String, dynamic> json) => Team(
    id: json['team']['id'],
    name: json['team']['name'] ?? '',
    image: json['team']['logo'] ?? '',
    venue: Venue(
      id: json['venue']['id'],
      name: json['venue']['name'] ?? "",
      address: json['venue']['address'] ?? "",
      city: json['venue']['city'] ?? "",
      image: json['venue']['image'] ?? "",
    ),
  );
}

class Venue {
  final int id;
  final String name;
  final String address;
  final String city;
  final String image;

  const Venue({
    required this.id,
    required this.name,
    required this.address,
    required this.city,
    required this.image,
  });
}
