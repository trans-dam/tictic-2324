class User {
  final String firstName;
  final String lastName;
  final String email;
  final List<String> teams;

  const User({
    required this.firstName,
    required this.lastName,
    required this.email,
    this.teams = const [],
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      teams: json['teams'] == null ? [] : json['teams'].cast<String>(),
    );
  }

  Map<String, Object?> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'teams': teams.map((team) => 'teams/$team').toList(),
    };
  }
}
