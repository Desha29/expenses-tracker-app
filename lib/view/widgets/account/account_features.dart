import 'package:flutter/material.dart';

class ListFeatures extends StatelessWidget {
  final String title;
  final IconData iconData;
  ListFeatures({
    super.key,
    required this.title,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
          border: Border.fromBorderSide(
              BorderSide(color: Colors.grey.shade600, width: 0.3)),
          borderRadius: BorderRadius.circular(8),
          color: Color.fromARGB(255, 21, 21, 21)),
      child: ListTile(
        title: Text(title),
        leading: Icon(
          iconData,
          color: Colors.amber,
        ),
        trailing: Icon(
          Icons.arrow_forward_ios_rounded,
          size: 18,
          color: Colors.grey.shade700,
        ),
      ),
    );
  }
}
