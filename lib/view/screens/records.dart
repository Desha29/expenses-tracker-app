import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../core/model/expenses_model.dart';

import '../../core/model/incomes_model.dart';

import '../widgets/custom_toggle_switch.dart';
import '../widgets/data_items.dart';
import '../widgets/records/details_bar_records.dart';

class RecordsPage extends StatefulWidget {
  RecordsPage({super.key});

  @override
  State<RecordsPage> createState() => _RecordsPageState();
}

int sliding = ExpensesModel.toggle;
int length = 0;
var dateYearController = TextEditingController();
var dateMonthController = TextEditingController();

class _RecordsPageState extends State<RecordsPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      dateYearController.text = DateFormat.y().format(DateTime.now());
      dateMonthController.text = DateFormat.MMM().format(DateTime.now());
      sliding == 0
          ? length = ExpensesModel.expensesList.length
          : length = IncomeModel.incomeList.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 43, 43, 43),
        leading: Icon(Icons.search),
        centerTitle: true,
        title: Text(
          "Money Manager",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: InkWell(
                onTap: () {
                  showDatePicker(
                          context: context,
                          initialEntryMode: DatePickerEntryMode.input,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime.parse('2025-12-03'))
                      .then((value) {
                    setState(() {
                      dateYearController.text = DateFormat.y().format(value!);
                      dateMonthController.text = DateFormat.MMM().format(value);
                    });

                    return null;
                  });
                },
                child: Icon(Icons.calendar_month_outlined)),
          )
        ],
        bottom: PreferredSize(
          preferredSize: Size(10, 150),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                DetailsBarRecords(),
                SizedBox(height: 25),
                CustomToggleSwitch(
                    index: sliding,
                    labels: const ['Expenses', 'Income'],
                    onToggle: (newValue) {
                      setState(() {
                        sliding = newValue!;
                        if (sliding == 0) {
                          length = ExpensesModel.expensesList.length;
                        } else {
                          length = IncomeModel.incomeList.length;
                        }
                      });
                    }),
                SizedBox(height: 15),
              ],
            ),
          ),
        ),
      ),
      body: length == 0
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                NoData(),
              ],
            )
          : ValueListenableBuilder(
              valueListenable: sliding == 0
                  ? ExpensesModel.notifierListener
                  : IncomeModel.notifierListener,
              builder: (context, value, child) => ListView.builder(
                itemCount: length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: StatefulBuilder(
                      builder: (context, setState) => DataItems(
                        iconData: sliding == 0
                            ? ExpensesModel.expensesCategories[
                                ExpensesModel.expensesList[index].index]["icon"]
                            : IncomeModel.incomeCategories[
                                IncomeModel.incomeList[index].index]["icon"],
                        title: sliding == 0
                            ? ExpensesModel.expensesCategories[
                                ExpensesModel.expensesList[index].index]["name"]
                            : IncomeModel.incomeCategories[
                                IncomeModel.incomeList[index].index]["name"],
                        price: sliding == 0
                            ? ExpensesModel.expensesList[index].amount
                                .toString()
                            : IncomeModel.incomeList[index].amount.toString(),
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}

class NoData extends StatelessWidget {
  const NoData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Icon(Icons.receipt, color: Colors.grey, size: 50),
      Text(
        "No records",
        style: TextStyle(
            color: Colors.grey, fontWeight: FontWeight.w500, fontSize: 18),
      ),
    ]));
  }
}
