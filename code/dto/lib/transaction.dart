import 'package:dto/user.dart';

class Transaction {
  final String title;
  final String? description;
  final double amount;
  final DateTime date;
  final User owner;
  final List<User> concerns;

  const Transaction({
    required this.title,
    this.description,
    required this.amount,
    required this.date,
    required this.owner,
    this.concerns = const [],
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      title: json['title'],
      description: json['description'],
      amount: json['amount'],
      date: json['date'].toDate(),
      owner: User.fromJson(json['owner']),
      concerns:
          json['concerns']?.map<User>((user) => User.fromJson(user)).toList() ??
              [],
    );
  }

  Map<String, Object?> toJson() {
    return {
      'title': title,
      'description': description,
      'amount': amount,
      'date': date,
      'owner': owner.toJson(),
      'concerns': concerns.map((user) => user.toJson()).toList(),
    };
  }
}
