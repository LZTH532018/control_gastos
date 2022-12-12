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
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 12.0),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Gastos",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
              ),
              Container(
                child: Column(
                  children: [
                    Container(
                      height: 50,
                      decoration: BoxDecoration(),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            margin: EdgeInsets.all(5.0),
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 59, 61, 251),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12.0))),
                            child: Icon(
                              vivienda,
                              color: Colors.white,
                            ),
                          ),
                          Container(
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 4.0),
                                  child: Text(
                                    "Renta de cuarto",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    "22 de octubre",
                                    style: TextStyle(
                                        fontSize: 10.0, color: Colors.grey),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            child: Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.all(12.0),
                                  height: 26,
                                  width: 26,
                                  decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 247, 248, 251),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(12.0))),
                                  child: Icon(
                                    flecha,
                                    size: 12.0,
                                    color: Color.fromARGB(255, 124, 175, 194),
                                  ),
                                ),
                                Container(
                                  child: Text('\$2000'),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
