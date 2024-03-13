import 'package:flutter/material.dart';

class BudgetDetails extends StatelessWidget {
  final String title;
  final String data;
  BudgetDetails({
    super.key,
    required this.title,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          title,
          style: TextStyle(
              color: Colors.grey, fontWeight: FontWeight.w500, fontSize: 15),
        ),
        Text(
          data,
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
        ),
      ],
    );
  }
}
