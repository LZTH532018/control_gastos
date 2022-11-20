import 'package:flutter/material.dart';
import 'package:fluttericon/typicons_icons.dart';

class IncrementDecrement extends StatefulWidget {
  final String nameText;
  final int valueText;
  final bool conditional;
  const IncrementDecrement(
      {super.key,
      required this.nameText,
      required this.valueText,
      required this.conditional});

  @override
  State<IncrementDecrement> createState() => _IncrementDecrementState();
}

class _IncrementDecrementState extends State<IncrementDecrement> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            widget.conditional == true
                ? Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                        color: Colors.green.shade100,
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    child: Icon(
                      Typicons.up,
                      color: Colors.green,
                      size: 15,
                    ),
                  )
                : Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                        color: Colors.deepPurple.shade100,
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    child: Icon(
                      Typicons.down,
                      color: Colors.deepPurple,
                      size: 15,
                    ),
                  ),
            Column(
              children: [
                Text(
                  widget.nameText,
                  style: TextStyle(color: Colors.grey[700]),
                ),
                Text(
                  '\$${widget.valueText}',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }
}
