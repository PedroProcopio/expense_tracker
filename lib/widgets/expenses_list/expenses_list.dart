import 'package:flutter/material.dart';
import 'package:expense_tracker/widgets/expenses_list/expense_item.dart';
import 'package:expense_tracker/models/expense.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.expenses, required this.removeExpense});

  final List<Expense> expenses;
  final void Function(Expense) removeExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (ctx, index) {
          return Dismissible(
              background: Container(color: Colors.red.withOpacity(0.75)),
              key: ValueKey(expenses[index]),
              onDismissed: (direction) {
                removeExpense(expenses[index]);
              },
              child: ExpenseItem(expense: expenses[index]));
        });
  }
}
