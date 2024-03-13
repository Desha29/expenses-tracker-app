import '/../core/model/expenses_model.dart';
import '/../core/model/incomes_model.dart';
import 'package:hive/hive.dart';

class HiveHelper {
  insertToDatabaseE(dataModel) async {
    var expensesBox = Hive.box<ExpensesModel>('expensesData');
    await expensesBox.add(dataModel);
  }

  insertToDatabaseI(dataModel) async {
    var incomeBox = Hive.box<IncomeModel>('incomeData');
    await incomeBox.add(dataModel);
  }

  fetchDataExpenses() {
    var expensesBox = Hive.box<ExpensesModel>('expensesData');
    return expensesBox.values.toList();
  }

  fetchDataIncome() {
    var incomeBox = Hive.box<IncomeModel>('incomeData');
    return incomeBox.values.toList();
  }
}
