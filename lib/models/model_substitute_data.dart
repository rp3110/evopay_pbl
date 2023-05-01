import 'model_player_data.dart';

class ModelTeamData {
  final String team1;
  final String team2;
  final List<ModelPlayerData> team1Players;
  final List<ModelPlayerData> team2Players;
  ModelTeamData(
      {required this.team1,
      required this.team2,
      required this.team1Players,
      required this.team2Players});
}
