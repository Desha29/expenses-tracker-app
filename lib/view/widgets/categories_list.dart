import '/../core/constants/routes.dart';
import '/../core/model/expenses_model.dart';
import '/../core/model/incomes_model.dart';
import '/../view/screens/charts.dart';
import '/../view/widgets/customtextfieldform.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../core/functions/validinput.dart';

class CategoriesList extends StatefulWidget {
  final int length;
  final List categories;

  CategoriesList({
    super.key,
    required this.length,
    required this.categories,
  });

  @override
  State<CategoriesList> createState() => _CategoriesListState();
}

int selectItem = -1;
ExpensesModel expenses =
    ExpensesModel(index: 0, amount: 0.0, username: ExpensesModel.user);
IncomeModel incomes =
    IncomeModel(index: 0, amount: 0.0, username: IncomeModel.user);
bool check = false;

class _CategoriesListState extends State<CategoriesList> {
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      ExpensesModel.dateController.text =
          DateFormat.yMMMMEEEEd().format(DateTime.now());
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 0.5, crossAxisCount: 4),
      itemCount: widget.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onDoubleTap: () {
            setState(() {
              selectItem = -1;
            });
          },
          onTap: () {
            setState(() {
              selectItem = index;
              showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) => Form(
                        key: ExpensesModel.formstate,
                        child: AlertDialog(
                          title: Center(
                            child: Text(
                              ExpensesModel.toggle == 0
                                  ? "Add Expenses"
                                  : "Add Income",
                              style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.amber),
                            ),
                          ),
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 20),
                          insetPadding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          backgroundColor: const Color(0xff212121),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CustomTextFormAuth(
                                label: "Amount",
                                keyboardType: TextInputType.number,
                                hinttext: "Enter amount ",
                                mycontroller: ExpensesModel.amountController,
                                validate: (val) {
                                  return validInput(val!, "number");
                                },
                              ),
                              Row(
                                children: [
                                  InkWell(
                                      onTap: () {
                                        showDatePicker(
                                                context: context,
                                                initialDate: DateTime.now(),
                                                initialEntryMode:
                                                    DatePickerEntryMode.input,
                                                firstDate: DateTime.now(),
                                                lastDate: DateTime.parse(
                                                    '2025-12-03'))
                                            .then((value) {
                                          setState(() {
                                            ExpensesModel.dateController.text =
                                                DateFormat.yMd().format(value!);
                                          });
                                        });
                                      },
                                      child: const Icon(
                                        Icons.calendar_month_outlined,
                                        color: Colors.amber,
                                      )),
                                  StatefulBuilder(
                                    builder: (context, setState) => Text(
                                      "  Date: ${ExpensesModel.dateController.text}",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  setState(() {
                                    switch (ExpensesModel.toggle) {
                                      case 0:
                                        check = expenses.add(index);
                                        expenses.calcTotal();

                                        break;
                                      case 1:
                                        check = incomes.add(index);
                                        incomes.calcTotal();

                                        break;
                                      default:
                                        break;
                                    }
                                    if (check) {
                                      Navigator.pushReplacementNamed(
                                          context, AppRoutes.homepage);
                                      selectItem = -1;
                                      sliding = 0;
                                      sliding = 0;
                                      ExpensesModel.toggle = 0;
                                      ExpensesModel.amountController.clear();
                                    } else {
                                      print("Not Valid");
                                    }
                                  });
                                },
                                child: const Text(
                                  "Add",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.amber),
                                )),
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  setState(() {
                                    selectItem = -1;
                                    ExpensesModel.amountController.clear();
                                    sliding = 0;
                                    sliding = 0;
                                  });
                                },
                                child: const Text(
                                  "Cancel",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.amber),
                                )),
                          ],
                        ),
                      ));
            });
          },
          child: Column(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundColor: selectItem == index && selectItem != -1
                    ? Colors.amber
                    : const Color.fromARGB(255, 63, 63, 63),
                child: Icon(
                  widget.categories[index]["icon"],
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 5),
              Text(widget.categories[index]["name"],
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, color: Colors.white))
            ],
          ),
        );
      },
    );
  }
}
