class User {
  final String firstName;
  final String lastName;
  final String email;

  const User(
      {required this.firstName, required this.lastName, required this.email});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
    );
  }
}

const List<User> fictiveUsers = [
  User(
    firstName: "Ada",
    lastName: "Lovelace",
    email: "ada@example.com",
  ),
  User(
    firstName: "Alan",
    lastName: "Turing",
    email: "alan@example.com",
  ),
  User(
    firstName: "Grace",
    lastName: "Hopper",
    email: "grace@example.com",
  ),
  User(
    firstName: "Linus",
    lastName: "Torvalds",
    email: "linus@example.com",
  ),
  User(
    firstName: "Margaret",
    lastName: "Hamilton",
    email: "margaret@example.com",
  ),
  User(
    firstName: "Tim",
    lastName: "Berners-Lee",
    email: "tim@example.com",
  ),
];
