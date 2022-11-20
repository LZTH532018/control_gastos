import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:expense_control/theme/icons.dart';

class ExpInTile extends StatelessWidget {
  final String expInName;
  final String expInAmount;
  Function(BuildContext)? deleteFuntion;
  ExpInTile({
    super.key,
    required this.expInName,
    required this.expInAmount,
    required this.deleteFuntion,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25, left: 25, right: 25),
      child: Slidable(
        endActionPane: ActionPane(motion: StretchMotion(), children: [
          SlidableAction(
            onPressed: deleteFuntion,
            icon: Icons.delete,
            backgroundColor: Colors.red.shade300,
            borderRadius: BorderRadius.circular(12),
          )
        ]),
        child: Container(
          padding: EdgeInsets.all(24),
          decoration: BoxDecoration(
              color: const Color(0xffF7F8FB),
              borderRadius: BorderRadius.circular(12)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  decoration: BoxDecoration(
                      color: Colors.purple.shade300,
                      borderRadius: BorderRadius.all(Radius.circular(5.0))),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Icon(
                      vivienda,
                      color: Colors.purple,
                    ),
                  )),
              Text(expInName),
              Text('\$$expInAmount'),
            ],
          ),
        ),
      ),
    );
  }
}
