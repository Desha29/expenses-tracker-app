import '/../core/model/expenses_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../data/local/hive_helper.dart';
part 'incomes_model.g.dart';

@HiveType(typeId: 1)
class IncomeModel {
  @HiveField(0)
  final double amount;
  @HiveField(1)
  final int index;
  @HiveField(2)
  final String? username;
  double total = 0.0;
  static String user = "no user";
  Map<String, double> map = {};
  static List incomeList = [];

  static final notifierListener =
      ValueNotifier<List<IncomeModel>>(HiveHelper().fetchDataIncome());
  static List incomeCategories = [
    {"name": "Salary", "icon": Icons.monetization_on_outlined},
    {"name": "Investments", "icon": Icons.inventory},
    {"name": "Part-time", "icon": Icons.timer},
    {"name": "Awards", "icon": Icons.card_giftcard},
    {"name": "Others", "icon": Icons.onetwothree_sharp},
  ];

  IncomeModel(
      {required this.amount, required this.index, required this.username});
  bool add(int indexItem) {
    var formdata = ExpensesModel.formstate.currentState;
    if (formdata!.validate()) {
      print("Valid");
      var incomeModel = IncomeModel(
          username: user,
          index: indexItem,
          amount: double.parse(ExpensesModel.amountController.text));
      HiveHelper().insertToDatabaseI(incomeModel);
      notifierListener.value = HiveHelper().fetchDataIncome();
      print(notifierListener.value.length);

      incomeList.clear();
      for (var element in notifierListener.value) {
        if (element.username?.compareTo(user) == 0) {
          incomeList.add(element);
        }
      }

      total = 0.0;
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
            {"${incomeCategories[element.index]["name"]}": element.amount});
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
