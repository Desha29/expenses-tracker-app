import '/../core/model/UserModel.dart';
import '/../core/model/expenses_model.dart';
import '/../core/model/incomes_model.dart';
import '/../data/sqlflite.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/routes.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController userValue = TextEditingController();
  TextEditingController passValue = TextEditingController();

  @override
  void dispose() {
    userValue.dispose();
    passValue.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              label: const Text("Username"),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
              icon: const Icon(Icons.person),
              filled: true,
              fillColor: Color.fromARGB(255, 43, 43, 43),
            ),
            controller: userValue,
          ),
          const SizedBox(
            height: 15,
          ),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
                icon: const Icon(Icons.lock),
                label: const Text("Password"),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                fillColor: Color.fromARGB(255, 43, 43, 43),
                filled: true),
            controller: passValue,
          ),
          const SizedBox(
            height: 15,
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () async {
                String username = userValue.text.trim();
                String password = passValue.text.trim();
                SqlDB db = SqlDB();

                if (username.isNotEmpty && password.isNotEmpty) {
                  UserModel? user = await db.getUser(username);
                  if (user?.password.compareTo(password) == 0) {
                    ExpensesModel.user = user!.username;
                    IncomeModel.user = user.username;
                    ExpensesModel.expensesList.clear();
                    IncomeModel.incomeList.clear();
                    for (var element in ExpensesModel.notifierListener.value) {
                      if (element.username?.compareTo(user.username) == 0) {
                        ExpensesModel.expensesList.add(element);
                      }
                    }
                    for (var element in IncomeModel.notifierListener.value) {
                      if (element.username?.compareTo(user.username) == 0) {
                        IncomeModel.incomeList.add(element);
                      }
                    }
                    Navigator.of(context, rootNavigator: true)
                        .pushNamed(AppRoutes.homepage);
                  } else {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                              title: const Text(
                                "Error",
                                style: TextStyle(color: Colors.yellow),
                              ),
                              content: const Text(
                                  "Invalid username or password!",
                                  style: TextStyle(fontSize: 20)),
                              icon: const Icon(Icons.error, color: Colors.red),
                              actions: <Widget>[
                                TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text("Ok"))
                              ],
                            ));
                  }
                } else {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                            title: const Text(
                              "Error",
                              style: TextStyle(color: Colors.yellow),
                            ),
                            content: const Text(
                                "Please enter username and password!",
                                style: TextStyle(fontSize: 20)),
                            icon: const Icon(Icons.error, color: Colors.red),
                            actions: <Widget>[
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text("Ok"))
                            ],
                          ));
                }
              },
              child: const Text("Login")),
        ],
      ),
    );
  }
}
