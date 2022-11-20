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
      {"name": "Renta", "type": "Gasto", "subtype": "Vivienda", "amount": 4200},
      {
        "name": "Comida",
        "type": "Gasto",
        "subtype": "Alimentos",
        "amount": 3000
      },
      {
        "name": "Empleo",
        "type": "Ingreso",
        "subtype": "Trabajo",
        "amount": 8000
      },
      {
        "name": "Taquería",
        "type": "Ingreso",
        "subtype": "Negocio",
        "amount": 3000
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
