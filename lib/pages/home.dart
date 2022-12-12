import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:expense_control/controllers/exp_in_controller.dart';
import 'package:expense_control/util/balance.dart';
import 'package:expense_control/util/expenditure_income_container.dart';
import 'package:expense_control/util/principal_chart.dart';
import 'package:expense_control/theme/colors.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //reference the hive box
  final _myBox = Hive.box('mybox');
  ExpInController ctrlExpIn = ExpInController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 247, 248, 251),
        elevation: 0,
        leading: Icon(
          Icons.menu,
          color: blackTheme,
        ),
        title: Center(
            child: Text(
          'Control de gastos',
          style: TextStyle(color: blackTheme),
        )),
        actions: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Icon(
              Icons.notifications,
              color: greyTheme,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Column(
                children: [
                  Balance(),
                  PrincipalChart(),
                  ExpenditureIncome(),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(height: 50.0),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() {
          "_count++";
        }),
        tooltip: 'Increment Counter',
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
