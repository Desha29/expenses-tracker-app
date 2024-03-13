// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import '/../core/constants/routes.dart';
import '/../core/model/expenses_model.dart';
import 'package:flutter/material.dart';

import '../widgets/account/account_features.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.grey.shade700,
                  radius: 30,
                  child: Icon(
                    Icons.person,
                    size: 40,
                  ),
                ),
                SizedBox(width: 20),
                Text(
                  ExpensesModel.user,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                )
              ],
            ),
            SizedBox(height: 25),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.shoppingList);
              },
              child: ListFeatures(
                  title: "Shopping List",
                  iconData: Icons.shopping_bag_outlined),
            ),
            InkWell(
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.settings);
                },
                child:
                    ListFeatures(title: "Settings", iconData: Icons.settings))
          ],
        ),
      ),
    );
  }
}
