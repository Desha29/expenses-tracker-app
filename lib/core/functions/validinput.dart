import 'package:get/get.dart';

validInput(String value, String type) {
  if (value.isEmpty) {
    return "can't be Empty!";
  }
  if (type == "number") {
    if (!GetUtils.isNumericOnly(value)) {
      return "Not valid Input enter numbers only";
    }
  }
}
