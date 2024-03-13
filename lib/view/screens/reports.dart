import '/../core/model/expenses_model.dart';
import '/../core/model/incomes_model.dart';
import '/../view/widgets/categories_list.dart';
import 'package:flutter/material.dart';
import '../widgets/piechart.dart';
import '../widgets/reports/analytics_reports.dart';

class ReportsPage extends StatefulWidget {
  ReportsPage({super.key});

  @override
  State<ReportsPage> createState() => _ReportsPageState();
}

class _ReportsPageState extends State<ReportsPage> {
  double remaining = 0.0;
  @override
  void initState() {
    super.initState();
    setState(() {
      incomes.total;
      expenses.total;
      remaining = (incomes.total - expenses.total);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color.fromARGB(255, 43, 43, 43),
          centerTitle: true,
          title: const Text(
            "Reports",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: ValueListenableBuilder(
          valueListenable: IncomeModel.notifierListener.value.length == 0
              ? ExpensesModel.notifierListener
              : IncomeModel.notifierListener,
          builder: (context, value, child) => Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 25),
                margin: const EdgeInsets.only(top: 20, right: 10, left: 10),
                decoration: BoxDecoration(
                    border: Border.fromBorderSide(
                        BorderSide(color: Colors.grey.shade600, width: 0.4)),
                    borderRadius: BorderRadius.circular(8),
                    color: const Color.fromARGB(255, 26, 26, 26)),
                child: CustomPieChart(
                  total: incomes.total,
                  centerTextTotal: "${incomes.total}",
                  dataMap: {"Remaining": remaining, "Expenses": expenses.total},
                ),
              ),
              AnalyticsReports()
            ],
          ),
        ));
  }
}
