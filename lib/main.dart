import 'package:expenses_tracker/view/screens/auth/signIn_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'core/model/expenses_model.dart';
import 'core/model/incomes_model.dart';
import 'routes.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ExpensesModelAdapter());
  Hive.registerAdapter(IncomeModelAdapter());
  await Hive.openBox<ExpensesModel>('expensesData');
  await Hive.openBox<IncomeModel>('incomeData');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.dark(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      routes: routes,
      home: SignInPage(),
    );
  }
}
