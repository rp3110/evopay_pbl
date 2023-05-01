enum PlayerPosition {
  caption,
  viceCaption,
  goalKeeper,
  coach,
}

class ModelPlayerData {
  final String photo;
  final String name;
  final int? count;
  final String? country;
  final PlayerPosition? position;

  ModelPlayerData({
    required this.photo,
    required this.name,
    this.count,
    this.country,
    this.position,
  });
}
