import 'package:expense_control/util/increment_decrement.dart';
import 'package:flutter/material.dart';

class Balance extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Center(
          child: Text(
            '\$3, 050',
            style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
          ),
        ),
        Center(
          child: Text(
            'Has gastado el 45% de tus ingresos',
            style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,
                color: Colors.grey[700]),
          ),
        ),
        Row(
          children: [
            IncrementDecrement(
                nameText: 'Ingresos', valueText: 3200, conditional: true),
            SizedBox(
              width: 8,
            ),
            IncrementDecrement(
                nameText: 'Gastos', valueText: 2720, conditional: false)
          ],
        ),
      ],
    );
  }
}
