class ModelLineUpData {
  final ModelPlayer team1GoalKeeper;
  final ModelPlayer team2GoalKeeper;
  final List<ModelPlayer> team1Attackers;
  final List<ModelPlayer> team2Attackers;
  final List<ModelPlayer> team1Defenders;
  final List<ModelPlayer> team2Defenders;
  final List<ModelPlayer> team1MidFielders;
  final List<ModelPlayer> team2MidFielders;

  ModelLineUpData(
      {required this.team1GoalKeeper,
      required this.team2GoalKeeper,
      required this.team1Attackers,
      required this.team2Attackers,
      required this.team1Defenders,
      required this.team2Defenders,
      required this.team1MidFielders,
      required this.team2MidFielders});
}

class ModelPlayer {
  final String name;
  final String number;

  ModelPlayer({required this.name, required this.number});
}
