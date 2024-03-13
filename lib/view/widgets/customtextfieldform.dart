import 'package:flutter/material.dart';

class CustomTextFormAuth extends StatelessWidget {
  final String hinttext;
  final String label;
  void Function()? onTap;
  final TextEditingController? mycontroller;
  final String? Function(String?)? validate;
  final TextInputType? keyboardType;
  CustomTextFormAuth(
      {super.key,
      required this.hinttext,
      this.mycontroller,
      this.validate,
      this.keyboardType,
      this.onTap,
      required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40, bottom: 30),
      child: TextFormField(
        onTap: onTap,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: keyboardType,
        validator: validate,
        cursorColor: Colors.white,
        style: TextStyle(fontSize: 18, color: Colors.white),
        controller: mycontroller,
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.white)),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            floatingLabelStyle: const TextStyle(
              color: Colors.white,
              fontSize: 25,
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            label: Text(label),
            hintText: hinttext,
            labelStyle: const TextStyle(fontSize: 18, color: Colors.white),
            hintStyle: const TextStyle(fontSize: 14)),
      ),
    );
  }
}
