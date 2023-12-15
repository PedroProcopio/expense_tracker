import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem({super.key, required this.expense});

  final Expense expense;

  @override
  Widget build(context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            expense.title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Text("\$${expense.amount.toString()}"),
              const Spacer(),
              Row(children: [
                Icon(categoryIcons[expense.category]),
                const SizedBox(
                  width: 4,
                ),
                Text(expense.formattedDate),
              ]),
            ],
          ),
        ]),
      ),
    );
  }
}
