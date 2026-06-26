import 'package:flutter/material.dart';

class QuickActionData {
  const QuickActionData(this.icon, this.label, {this.routeName});

  final IconData icon;
  final String label;
  final String? routeName;
}

class TransactionItemData {
  const TransactionItemData({
    required this.icon,
    required this.type,
    required this.date,
    required this.amount,
    required this.status,
  });

  final IconData icon;
  final String type;
  final String date;
  final double amount;
  final String status;
}
