import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:expense_control/theme/icons.dart';
import 'package:expense_control/controllers/exp_in_controller.dart';
import 'dialog_box_exp_in.dart';
import 'exp_in_tile.dart';

class ExpenditureIncome extends StatefulWidget {
  @override
  State<ExpenditureIncome> createState() => _ExpenditureIncomeState();
}

class _ExpenditureIncomeState extends State<ExpenditureIncome> {
  //reference the hive box
  final _myBox = Hive.box('mybox');
  ExpInController ctrlExpIn = ExpInController();
  @override
  void initState() {
    //if is this 1st time ever openin the app, then create default data
    if (_myBox.get("COSTOSINGRESOS") == null) {
      ctrlExpIn.createInitialData();
    } else {
      //there already exist data
      ctrlExpIn.loadData();
    }

    super.initState();
  }

  //text controller
  final _nameController = TextEditingController();
  final _typeController = TextEditingController();
  final _subtypeController = TextEditingController();
  final _amountController = TextEditingController();

  //create a new task
  void createNewExpIn() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBoxExpIn(
            nameController: _nameController,
            typeController: _typeController,
            subtypeCOntroller: _subtypeController,
            amountController: _amountController,
            onSave: saveNewExpIn,
            onCancel: () {
              Navigator.of(context).pop();
              _nameController.clear();
              _typeController.clear();
              _subtypeController.clear();
              _amountController.clear();
            },
          );
        });
  }

  //save new task
  void saveNewExpIn() {
    setState(() {
      if (_nameController.text != "") {
        ctrlExpIn.expenditureIncome.add({
          'name': _nameController.text,
          'type': _typeController.text,
          'subtype': _subtypeController.text,
          'amount': _amountController.text
        });
        Navigator.of(context).pop();
        ctrlExpIn.updateData();
        _nameController.clear();
        _typeController.clear();
        _subtypeController.clear();
        _amountController.clear();
        // db.expenditureIncome.add([_controller.text, false]);
        // Navigator.of(context).pop();
        // db.updateData();
        // _controller.clear();
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Nombre vacio')));
      }
    });
  }

  //delete task
  void deleteExpIn(int index) {
    setState(() {
      ctrlExpIn.expenditureIncome.removeAt(index);
    });
    ctrlExpIn.updateData();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Gastos',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: ctrlExpIn.expenditure.length,
            itemBuilder: ((context, index) {
              return ExpInTile(
                expInName: ctrlExpIn.expenditure[index]["name"],
                expInAmount: ctrlExpIn.expenditure[index]["amount"],
                deleteFuntion: (context) => deleteExpIn(index),
              );
            }),
          ),
          InkWell(
            onTap: createNewExpIn,
            child: Container(
              padding: EdgeInsets.all(24),
              decoration: BoxDecoration(
                  color: const Color(0xffF7F8FB),
                  borderRadius: BorderRadius.circular(12)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.all(Radius.circular(5.0))),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Icon(
                          agregar,
                          color: Colors.grey[700],
                        ),
                      )),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Ingresos',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: ctrlExpIn.income.length,
            itemBuilder: ((context, index) {
              return ExpInTile(
                expInName: ctrlExpIn.income[index]["name"],
                expInAmount: ctrlExpIn.income[index]["amount"],
                deleteFuntion: (context) => deleteExpIn(index),
              );
            }),
          ),
          InkWell(
            onTap: createNewExpIn,
            child: Container(
              padding: EdgeInsets.all(24),
              decoration: BoxDecoration(
                  color: const Color(0xffF7F8FB),
                  borderRadius: BorderRadius.circular(12)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.all(Radius.circular(5.0))),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Icon(
                          agregar,
                          color: Colors.grey[700],
                        ),
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
