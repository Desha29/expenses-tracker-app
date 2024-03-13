import '/../view/screens/records.dart';
import '/../view/widgets/categories_list.dart';
import 'package:flutter/material.dart';
import 'info_bar_records.dart';

class DetailsBarRecords extends StatefulWidget {
  const DetailsBarRecords({
    super.key,
  });

  @override
  State<DetailsBarRecords> createState() => _DetailsBarRecordsState();
}

class _DetailsBarRecordsState extends State<DetailsBarRecords> {
  @override
  void initState() {
    super.initState();
    setState(() {
      incomes.total;
      expenses.total;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InformationBar(
            title: dateYearController.text, data: dateMonthController.text),
        Text(
          "|",
          style: TextStyle(color: Colors.grey, fontSize: 30),
        ),
        InformationBar(title: "Expenses", data: "${expenses.total}"),
        InformationBar(title: "Income", data: "${incomes.total}"),
        InformationBar(
            title: "Balance", data: "${incomes.total - expenses.total}"),
      ],
    );
  }
}
