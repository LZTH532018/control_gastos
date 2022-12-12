import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:expense_control/theme/icons.dart';
import 'package:expense_control/controllers/exp_in_controller.dart';

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

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 12.0),
                child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Gastos",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
              ),
              Column(
                children: [
                  SizedBox(
                      height: 50,
                      child: ListView.builder(
                          itemCount: 2,
                          itemBuilder: (context, index) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  margin: const EdgeInsets.all(5.0),
                                  height: 40,
                                  width: 40,
                                  decoration: const BoxDecoration(
                                      color: Color.fromARGB(255, 59, 61, 251),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(12.0))),
                                  child: Icon(
                                    vivienda,
                                    color: Colors.white,
                                  ),
                                ),
                                Column(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(top: 4.0),
                                      child: Text(
                                        "Oi",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    const Text(
                                      "22 de octubre",
                                      style: TextStyle(
                                          fontSize: 10.0, color: Colors.grey),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.all(12.0),
                                      height: 26,
                                      width: 26,
                                      decoration: const BoxDecoration(
                                          color: Color.fromARGB(
                                              255, 247, 248, 251),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(12.0))),
                                      child: Icon(
                                        flecha,
                                        size: 12.0,
                                        color: const Color.fromARGB(
                                            255, 124, 175, 194),
                                      ),
                                    ),
                                    const Text('\$2000')
                                  ],
                                )
                              ],
                            );
                          })),
                ],
              )
            ],
          )),
    );
  }
}
