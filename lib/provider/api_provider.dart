import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:traba/model/model.dart';
import 'package:traba/service/service.dart';

final leagueProvider = FutureProvider<List<League>>((ref) {
  return ApiService.getLeagues();
});

final indonesiaTeamsProvider = FutureProvider<List<Team>>((ref) {
  return ApiService.getIndonesiaTeams();
});

final playerProvider = FutureProvider.family<List<Player>, int>((ref, teamId) {
  return ApiService.getPlayers(teamId);
});
