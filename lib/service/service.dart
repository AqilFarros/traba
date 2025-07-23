import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:traba/model/model.dart';

String baseUrl = "https://v3.football.api-sports.io";
Map<String, String> headers = {
  'x-apisports-key': "6c11a7ad030ccaf13b05ecd9b3dc571a",
};
var client = http.Client();

class ApiService {
  static Future<List<League>> getLeagues() async {
    try {
      var response = await client.get(
        Uri.parse("$baseUrl/leagues"),
        headers: headers,
      );

      final json = jsonDecode(response.body);

      List<League> leagues = (json['response'] as Iterable)
          .take(15)
          .map((e) => League.fromJson(e))
          .toList();

      return leagues;
    } catch (e) {
      print(e);
      throw Exception("Oops, something went wrong...");
    }
  }

  static Future<List<Team>> getIndonesiaTeams() async {
    try {
      var response = await client.get(
        Uri.parse("$baseUrl/teams?country=Indonesia"),
        headers: headers,
      );

      final json = jsonDecode(response.body);

      List<Team> teams = (json['response'] as Iterable)
          .take(10)
          .map((e) => Team.fromJson(e))
          .toList();

      return teams;
    } catch (e) {
      print(e);
      throw Exception("Oops, something went wrong...");
    }
  }

  static Future<List<Player>> getPlayers(int teamId) async {
    try {
      var response = await client.get(
        Uri.parse("$baseUrl/players/squads?team=$teamId"),
        headers: headers,
      );

      var json = jsonDecode(response.body);

      List<Player> players = (json['response'][0]['players'] as Iterable)
          .map((e) => Player.fromJson(e))
          .toList();

      return players;
    } catch (e) {
      print(e);
      throw Exception("Oops, something went wrong...");
    }
  }
}
