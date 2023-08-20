import 'package:flutter/cupertino.dart';
import 'package:tictic/models/transaction.dart';
import 'package:tictic/models/user.dart';

@immutable
class Team {
  final String title;
  final String? picturePath;
  final List<String>? tags;
  final DateTime startDate;
  final User owner;
  final List<User> users;
  final List<Transaction>? transactions;

  const Team(
      {required this.title,
      required this.owner,
      this.picturePath,
      this.tags,
      this.transactions,
      required this.startDate,
      required this.users});

  getSum() {
    double sum = 0;
    if (transactions != null) {
      for (var transaction in transactions!) {
        sum += transaction.amount;
      }
    }
    return sum;
  }
}

List<Team> teams = [
  Team(
    title: "💻 Code Magicians",
    picturePath: "assets/code.jpg",
    startDate: DateTime(2023, 8, 31),
    owner: fictiveUsers[0],
    users: [fictiveUsers[0], fictiveUsers[1], fictiveUsers[2]],
    transactions: transactionsList.sublist(0, 5),
    tags: const ["Coding", "Magic", "Geeks"],
  ),
  Team(
    title: "🌐 Web Weavers",
    picturePath: "assets/web.jpg",
    startDate: DateTime(2023, 9, 15),
    owner: fictiveUsers[3],
    users: [fictiveUsers[3], fictiveUsers[4], fictiveUsers[5]],
    transactions: transactionsList.sublist(5, 10),
    tags: const ["Web Development", "Design", "Networking"],
  ),
  Team(
    title: "🎮 Game Gurus",
    picturePath: "assets/game.jpg",
    startDate: DateTime(2023, 9, 30),
    owner: fictiveUsers[0],
    users: [fictiveUsers[0], fictiveUsers[2], fictiveUsers[4]],
    transactions: transactionsList.sublist(10, 15),
  ),
  Team(
    title: "✨ nouveau groupe",
    picturePath: "assets/game.jpg",
    startDate: DateTime(2023, 9, 30),
    owner: fictiveUsers[0],
    users: [fictiveUsers[0], fictiveUsers[2], fictiveUsers[4]],
    //transactions: transactionsList.sublist(10, 15),
  ),
];
