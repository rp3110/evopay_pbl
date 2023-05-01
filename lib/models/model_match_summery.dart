enum EventAction {
  redCard,
  yellowCard,
  goal,
}

class ModelMatchSummery {
  final String time;
  final String? playerName;
  final EventAction? action;
  final String? score;
  final bool isHalfTime;
  final bool? isTeam1;
  ModelMatchSummery({
    required this.time,
    this.playerName,
    this.score,
    this.action,
    this.isTeam1,
    this.isHalfTime = false,
  });
}
