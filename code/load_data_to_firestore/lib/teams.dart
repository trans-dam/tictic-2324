import 'package:dto/team.dart';
import 'package:load_data_to_firestore/transactions.dart';
import 'package:load_data_to_firestore/users.dart';

List<Team> teams = [
  Team(
    title: "💻 Code Magicians",
    picturePath: "assets/img/team-1.png",
    startDate: DateTime(2023, 8, 31),
    owner: users[0].email,
    users: [users[0].email, users[1].email, users[2].email],
    transactions: transactions.sublist(0, 5),
    tags: const ["Coding", "Magic", "Geeks"],
  ),
  Team(
    title: "🌐 Web Weavers",
    picturePath: "assets/img/team-2.png",
    startDate: DateTime(2023, 9, 15),
    owner: users[3].email,
    users: [users[3].email, users[4].email, users[5].email],
    transactions: transactions.sublist(5, 10),
    tags: const ["Web Development", "Design", "Networking"],
  ),
  Team(
    title: "🎮 Game Gurus",
    picturePath: "assets/img/team-3.png",
    startDate: DateTime(2023, 9, 30),
    owner: users[0].email,
    users: [users[0].email, users[2].email, users[4].email],
    transactions: transactions.sublist(10, 15),
  ),
  Team(
    title: "✨ nouveau groupe",
    picturePath: "assets/img/team-4.png",
    startDate: DateTime(2023, 9, 30),
    owner: users[0].email,
    users: [users[0].email, users[2].email, users[4].email],
    //transactions: transactions.sublist(10, 15),
  ),
];
