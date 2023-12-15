import 'package:expense_tracker/widgets/chart/chart.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/new_expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({Key? key}) : super(key: key);

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _expenseDummyData = [
    Expense(
      title: "New Shoes",
      amount: 69.99,
      date: DateTime.now(),
      category: Category.leisure,
    ),
    Expense(
      title: "Groceries",
      amount: 16.53,
      date: DateTime.now(),
      category: Category.food,
    ),
  ];

  _addExpense(Expense expense) {
    setState(() {
      _expenseDummyData.add(expense);
    });
  }

  _removeExpense(Expense expense) {
    final index = _expenseDummyData.indexOf(expense);
    setState(() {
      _expenseDummyData.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Removed ${expense.title}"),
        duration: const Duration(seconds: 4),
        action: SnackBarAction(
          label: "Undo",
          onPressed: () {
            setState(() {
              _expenseDummyData.insert(index, expense);
            });
          },
        ),
      ),
    );
  }

  void onPressedAddOverlay() {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: ((context) {
        return NewExpense(addExpense: _addExpense);
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    Widget mainContent = const Center(
      child: Text("No expenses added. Add Some!"),
    );

    if (_expenseDummyData.isNotEmpty) {
      mainContent = ExpensesList(
          expenses: _expenseDummyData, removeExpense: _removeExpense);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Expenses Tracker"),
        actions: [
          IconButton(
            onPressed: onPressedAddOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: width < 600
          ? Column(
              children: [
                Chart(expenses: _expenseDummyData),
                Expanded(child: mainContent),
              ],
            )
          : Row(
              children: [
                Expanded(
                  child: Chart(expenses: _expenseDummyData),
                ),
                Expanded(
                  child: mainContent,
                ),
              ],
            ),
    );
  }
}
