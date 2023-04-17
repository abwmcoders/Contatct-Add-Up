class Profile {
  final String name;
  final String number;

  const Profile({required this.name, required this.number});

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      name: json['name'],
      number: json['number'],
    );
  }
}
