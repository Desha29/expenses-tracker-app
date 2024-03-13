import '/../view/screens/records.dart';
import 'package:flutter/material.dart';

import '../categories_list.dart';
import 'info_bar_reports.dart';

class DetailsBarReports extends StatefulWidget {
  const DetailsBarReports({
    super.key,
  });

  @override
  State<DetailsBarReports> createState() => _DetailsBarReportsState();
}

class _DetailsBarReportsState extends State<DetailsBarReports> {
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
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          dateMonthController.text,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        InformationBarReports(title: "Expenses", data: "${expenses.total}"),
        InformationBarReports(title: "Income", data: "${incomes.total}"),
        InformationBarReports(
            title: "Balance", data: "${incomes.total - expenses.total}"),
      ],
    );
  }
}
