import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ExpInController extends GetxController {
  var name = ''.obs;
  var type = ''.obs;
  var subtype = ''.obs;
  var amount = '0'.obs;

  final _myBox = Hive.box('mybox');
  List expenditureIncome = [];
  List income = [];
  List expenditure = [];

  resetAll() {
    name.value = '';
    type.value = '';
    subtype.value = '';
    amount.value = '';
  }

  void createInitialData() {
    expenditureIncome = [
      {
        "name": "Renta Cuarto",
        "type": "Gasto",
        "subtype": "Vivienda",
        "amount": 4500
      },
      {
        "name": "Comida",
        "type": "Gasto",
        "subtype": "Alimentos",
        "amount": 500
      },
    ];
  }

  //load the data from database
  void loadData() {
    expenditureIncome = _myBox.get("COSTOSINGRESOS");
    for (int i = 0; i < expenditureIncome.length; i++) {
      if (expenditureIncome[i]["type"] == "ingreso") {
        income.add(expenditureIncome[i]);
      }
    }
    for (int i = 0; i < expenditureIncome.length; i++) {
      if (expenditureIncome[i]["type"] == "gasto") {
        expenditure.add(expenditureIncome[i]);
      }
    }
  }

  //update the database
  void updateData() {
    _myBox.put("COSTOSINGRESOS", expenditureIncome);
  }
}
