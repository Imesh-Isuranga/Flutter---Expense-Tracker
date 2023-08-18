import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/new_Expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> registeredExpenses = [
    Expense(
        title: "Flutter Sample",
        amount: 12.23,
        date: DateTime.now(),
        category: Category.work),
    Expense(
        title: "Cinema",
        amount: 15.55,
        date: DateTime.now(),
        category: Category.leisure),
  ];

  void modelBottomPanel() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: ((context) =>NewExpense(onAddExpense:_addExpensive)),
    );
  }

  void _addExpensive(Expense expense){
    setState(() {
      registeredExpenses.add(expense);
    });
  }


  void _removeExpense(Expense expense){
    setState(() {
      registeredExpenses.remove(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Expense Tracker"), actions: [
        IconButton(
          onPressed: modelBottomPanel,
          icon: const Icon(Icons.add),
        )
      ]),
      body: Column(
        children: [
          const Text("The Chart"),
          Expanded(
            child: ExpensesList(expenses: registeredExpenses,onRemovedExpense: _removeExpense,),
          ),
        ],
      ),
    );
  }
}
