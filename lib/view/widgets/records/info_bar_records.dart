import 'package:flutter/material.dart';

class InformationBar extends StatelessWidget {
  final String title;
  final String data;
  const InformationBar({
    super.key,
    required this.title,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
              color: Colors.grey, fontWeight: FontWeight.w500, fontSize: 16),
        ),
        Text(
          data,
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
        ),
      ],
    );
  }
}
