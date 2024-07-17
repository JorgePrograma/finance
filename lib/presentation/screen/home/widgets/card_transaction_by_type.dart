import 'package:flutter/material.dart';

class CardTransactionByType extends StatelessWidget {
  final double price;

  const CardTransactionByType({
    Key? key,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool icomeState = false;
    final color = icomeState ? Colors.green.shade600 : Colors.red.shade600;

    return Container(
      width: 190,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(33),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Row(
          children: [
            buildIcon(icomeState, color),
            const SizedBox(width: 10.0),
            buildTextAmout(icomeState)
          ],
        ),
      ),
    );
  }

  Widget buildTextAmout(bool icomeState) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(icomeState ? "Ingresos" : "Gastos",
            style: const TextStyle(fontSize: 18, color: Colors.white)),
        Text(
          "\$ $price",
          style: const TextStyle(fontSize: 22, color: Colors.white),
        ),
      ],
    );
  }

  Widget buildIcon(bool iconmeStates, Color color) {
    return Container(
      width: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13),
        color: Colors.white,
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Icon(
            iconmeStates
                ? Icons.arrow_downward_sharp
                : Icons.arrow_upward_sharp,
            color: color,
            size: 38,
          ),
        ),
      ),
    );
  }
}
