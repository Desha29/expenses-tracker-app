import 'package:flutter/material.dart';
import '../categories_list.dart';
import 'budget_details.dart';

class MonthlyBudget extends StatefulWidget {
  const MonthlyBudget({
    super.key,
  });

  @override
  State<MonthlyBudget> createState() => _MonthlyBudgetState();
}

class _MonthlyBudgetState extends State<MonthlyBudget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      incomes.total;
      expenses.total;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      decoration: BoxDecoration(
          border: Border.fromBorderSide(
              BorderSide(color: Colors.grey.shade600, width: 0.4)),
          borderRadius: BorderRadius.circular(8),
          color: const Color.fromARGB(255, 26, 26, 26)),
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.only(left: 19),
          child: ListTile(
            title: const Text(
              "Monthly Budget",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios_rounded,
              size: 18,
              color: Colors.grey.shade700,
            ),
          ),
        ),
        BudgetDetails(
            title: "Remaining:", data: "${incomes.total - expenses.total}"),
        const Divider(
          endIndent: 85,
          indent: 85,
        ),
        BudgetDetails(title: "Budget:", data: "${incomes.total}"),
        BudgetDetails(title: "Expenses:", data: "${expenses.total}"),
      ]),
    );
  }
}
