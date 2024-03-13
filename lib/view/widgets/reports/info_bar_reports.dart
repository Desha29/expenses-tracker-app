import 'package:flutter/material.dart';

class InformationBarReports extends StatelessWidget {
  final String title;
  final String data;
  const InformationBarReports({
    super.key,
    required this.title,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Text(
            title,
            style: TextStyle(
                color: Colors.grey, fontWeight: FontWeight.w500, fontSize: 15),
          ),
        ),
        Text(
          data,
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
        ),
      ],
    );
  }
}
