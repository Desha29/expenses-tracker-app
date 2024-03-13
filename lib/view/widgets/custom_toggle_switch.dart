import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

class CustomToggleSwitch extends StatelessWidget {
  List<String>? labels;
  void Function(int?)? onToggle;
  final int index;
  CustomToggleSwitch(
      {super.key, this.labels, this.onToggle, required this.index});

  @override
  Widget build(BuildContext context) {
    return ToggleSwitch(
        minWidth: 164,
        borderWidth: 1.5,
        borderColor: const [Colors.white70],
        initialLabelIndex: index,
        cornerRadius: 5,
        activeFgColor: Colors.black,
        inactiveBgColor: Colors.grey.shade900,
        inactiveFgColor: Colors.white,
        totalSwitches: 2,
        labels: labels,
        activeBgColors: const [
          [Colors.white],
          [Colors.white]
        ],
        minHeight: 32,
        fontSize: 18,
        onToggle: onToggle);
  }
}
