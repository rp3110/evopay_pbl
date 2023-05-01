class League {
  final String image;
  final String name;
  bool isFollowing;
  bool? isSelected;

  League(
      {required this.image,
      required this.name,
      required this.isFollowing,
      this.isSelected});
}
