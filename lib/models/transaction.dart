class Transaction {
  final String id;
  final String title;
  final String description;
  final double amount;
  final DateTime date;

  Transaction({
    required this.id,
    required this.title,
    required this.description,
    required this.amount,
    required this.date,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'description': description,
    'amount': amount,
    'date': date.toIso8601String(),
  };

  static Transaction fromJson(Map<String, dynamic> json) => Transaction(
    id: json['id'],
    title: json['title'],
    description: json['description'],
    amount: json['amount'],
    date: DateTime.parse(json['date']),
  );
}
