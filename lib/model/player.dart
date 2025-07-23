part of 'model.dart';

class Player {
  final int id;
  final String name;
  final String image;
  final String position;

  const Player({
    required this.id,
    required this.name,
    required this.image,
    required this.position,
  });

  factory Player.fromJson(Map<String, dynamic> json) => Player(
    id: json['id'],
    name: json['name'] ?? '',
    image: json['photo'] ?? '',
    position: json['position'] ?? '',
  );
}
