import 'package:flutter/material.dart';
import 'package:expense_control/util/save_button.dart';

class DialogBoxExpIn extends StatelessWidget {
  final nameController;
  final typeController;
  final subtypeCOntroller;
  final amountController;
  VoidCallback onSave;
  VoidCallback onCancel;
  DialogBoxExpIn({
    super.key,
    required this.nameController,
    required this.typeController,
    required this.subtypeCOntroller,
    required this.amountController,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        height: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //get user input
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Agrega el nombre",
              ),
            ),

            TextField(
              controller: typeController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Agrega el tipo",
              ),
            ),

            TextField(
              controller: subtypeCOntroller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Agrega el subtipo",
              ),
            ),

            TextField(
              controller: amountController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Agrega el monto",
              ),
            ),

            //buttons -> save + cancel
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //save button
                MyButton(text: 'Save', onPressed: onSave),

                const SizedBox(
                  width: 8,
                ),
                //cancel button
                MyButton(text: 'Cancel', onPressed: onCancel),
              ],
            )
          ],
        ),
      ),
    );
  }
}
