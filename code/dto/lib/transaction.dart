class Transaction {
  final String title;
  final String? description;
  final double amount;
  final DateTime date;
  final String owner;
  final List<String> concerns;

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
      owner: json['owner'],
      concerns: json['concerns'] == null ? [] : json['concerns'].cast<String>(),
    );
  }

  Map<String, Object?> toJson() {
    return {
      'title': title,
      'description': description,
      'amount': amount,
      'date': date,
      'owner': 'users/$owner',
      'concerns': concerns.map((user) => 'users/$user').toList(),
    };
  }
}
