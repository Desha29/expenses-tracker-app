import 'package:flutter/material.dart';

class DataItems extends StatelessWidget {
  final String title;
  final String price;
  final IconData iconData;
  DataItems({
    super.key,
    required this.title,
    required this.price,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          border: Border.fromBorderSide(
              BorderSide(color: Colors.grey.shade600, width: 0.3)),
          borderRadius: BorderRadius.circular(8)),
      child: ListTile(
        leading: CircleAvatar(
          radius: 24,
          backgroundColor: Color.fromARGB(255, 55, 55, 55),
          child: Icon(
            iconData,
            color: Colors.amber,
            size: 24,
          ),
        ),
        title: Text(title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        trailing: Text(price,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
