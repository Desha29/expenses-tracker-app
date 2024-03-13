import 'package:flutter/material.dart';

import 'details_bar_reports.dart';

class MonthlyStatistics extends StatelessWidget {
  const MonthlyStatistics({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      decoration: BoxDecoration(
          border: Border.fromBorderSide(
              BorderSide(color: Colors.grey.shade600, width: 0.4)),
          borderRadius: BorderRadius.circular(8),
          color: const Color.fromARGB(255, 26, 26, 26)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 19),
            child: ListTile(
              title: const Text(
                "Monthly Statistics",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_rounded,
                size: 18,
                color: Colors.grey.shade700,
              ),
            ),
          ),
          const DetailsBarReports()
        ],
      ),
    );
  }
}
