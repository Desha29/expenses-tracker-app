import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter/material.dart';

import '../../data/local/hive_helper.dart';

part 'expenses_model.g.dart';

@HiveType(typeId: 0)
class ExpensesModel {
  @HiveField(0)
  final double amount;
  @HiveField(1)
  final int index;
  @HiveField(2)
  final String? username;
  double total = 0.0;
  static int toggle = 0;
  static String user = "no user";
  Map<String, double> map = {};
  static List expensesList = [];

  static final notifierListener =
      ValueNotifier<List<ExpensesModel>>(HiveHelper().fetchDataExpenses());
  static TextEditingController amountController = TextEditingController();
  static var dateController = TextEditingController();
  static GlobalKey<FormState> formstate = GlobalKey<FormState>();
  static List expensesCategories = [
    {"name": "Shopping", "icon": Icons.shopping_cart_outlined},
    {"name": "Food", "icon": Icons.dining},
    {"name": "Telephone", "icon": Icons.phone_android_outlined},
    {"name": "Entertainment", "icon": Icons.mic_external_on_outlined},
    {"name": "Education", "icon": Icons.book_rounded},
    {"name": "Sport", "icon": Icons.sports_score_sharp},
    {"name": "Social", "icon": Icons.social_distance},
    {"name": "Transportation", "icon": Icons.train_sharp},
    {"name": "Clothing", "icon": Icons.storefront_sharp},
    {"name": "Car", "icon": Icons.directions_car_sharp},
    {"name": "Electronics", "icon": Icons.electrical_services_outlined},
    {"name": "Travel", "icon": Icons.travel_explore_rounded},
    {"name": "Health", "icon": Icons.health_and_safety},
    {"name": "Pet", "icon": Icons.pets_outlined},
    {"name": "Repair", "icon": Icons.home_repair_service_outlined},
    {"name": "Housing", "icon": Icons.house},
    {"name": "Home", "icon": Icons.home_filled},
    {"name": "Gift", "icon": Icons.card_giftcard_outlined},
    {"name": "Donate", "icon": Icons.directions_car_sharp},
    {"name": "Snacks", "icon": Icons.lunch_dining_outlined},
    {"name": "Child", "icon": Icons.child_care_sharp},
    {"name": "Vegetable", "icon": Icons.ramen_dining_rounded},
    {"name": "Fruit", "icon": Icons.lunch_dining},
  ];

  ExpensesModel(
      {required this.amount, required this.index, required this.username});

  bool add(int indexItem) {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      print("Valid");
      var expensesModel = ExpensesModel(
          username: user,
          index: indexItem,
          amount: double.parse(amountController.text));
      HiveHelper().insertToDatabaseE(expensesModel);
      notifierListener.value = HiveHelper().fetchDataExpenses();
      print(notifierListener.value.length);

      total = 0.0;
      expensesList.clear();
      for (var element in notifierListener.value) {
        if (element.username?.compareTo(user) == 0) {
          expensesList.add(element);
        }
      }

      return true;
    } else {
      return false;
    }
  }

  Map<String, double> convertToMap() {
    Map<String, double> nodata = {"": 0.0, "-": 0.0};
    notifierListener.value.forEach((element) {
      if (element.username?.compareTo(user) == 0) {
        map.addAll(
            {"${expensesCategories[element.index]["name"]}": element.amount});
      }
    });
    if (notifierListener.value.isEmpty) {
      return nodata;
    }

    return map;
  }

  double calcTotal() {
    total = 0.0;
    for (var element in notifierListener.value) {
      if (element.username?.compareTo(user) == 0) {
        total += element.amount;
      }
    }
    return total;
  }
}
