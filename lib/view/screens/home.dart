import '/../core/model/expenses_model.dart';
import '/../core/model/incomes_model.dart';
import '/../view/screens/account.dart';
import '/../view/screens/charts.dart';
import '/../view/screens/records.dart';
import '/../view/screens/reports.dart';
import 'package:flutter/material.dart';
import '../widgets/categories_list.dart';
import '../widgets/custom_toggle_switch.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> screens = [
    RecordsPage(),
    ChartsPage(),
    ReportsPage(),
    const AccountPage()
  ];

  int currentIndex = 0;
  int sliding = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.text_snippet,
              ),
              label: "Records"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.pie_chart_outline_sharp,
              ),
              label: "Charts"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.receipt_long_outlined,
              ),
              label: "Reports"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              label: "Me"),
        ],
        currentIndex: currentIndex,
        backgroundColor: const Color.fromARGB(255, 43, 43, 43),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.amber,
        iconSize: 30,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print(ExpensesModel.expensesList);
          print(IncomeModel.incomeList);
          print(ExpensesModel.expensesList.length);
          print(IncomeModel.incomeList.length);
          showModalBottomSheet(
            // scrollControlDisabledMaxHeightRatio: BorderSide.strokeAlignCenter,
            useRootNavigator: true,
            useSafeArea: true,
            isScrollControlled: true,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
            context: context,
            builder: (context) {
              return StatefulBuilder(
                builder: (context, setState) => Center(
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        color: Color(0xff1c1c1c),
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(30))),
                    child: Column(
                      children: [
                        AppBar(
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(30))),
                          leading: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                              setState(() {
                                selectItem = -1;
                                sliding = 0;
                                ExpensesModel.amountController.clear();
                                ExpensesModel.toggle = 0;
                              });
                            },
                            child: Center(
                              child: Text("Cancel",
                                  style:
                                      TextStyle(fontWeight: FontWeight.w500)),
                            ),
                          ),
                          centerTitle: true,
                          title: const Text("Add",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 30),
                          child: CustomToggleSwitch(
                              index: sliding,
                              labels: const ['Expenses', 'Income'],
                              onToggle: (newValue) {
                                setState(() {
                                  sliding = newValue!;
                                  ExpensesModel.toggle = sliding;
                                  selectItem = -1;
                                });
                              }),
                        ),
                        Container(
                            child: sliding == 0
                                ? CategoriesList(
                                    length:
                                        ExpensesModel.expensesCategories.length,
                                    categories:
                                        ExpensesModel.expensesCategories)
                                : CategoriesList(
                                    length: IncomeModel.incomeCategories.length,
                                    categories: IncomeModel.incomeCategories)),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
        backgroundColor: Colors.amber,
        child: const Icon(
          Icons.add,
          size: 30,
          color: Colors.black,
        ),
      ),
    );
  }
}
