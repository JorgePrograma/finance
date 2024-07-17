import 'package:flutter/material.dart';

class ShowTransactionList extends StatelessWidget {
  ShowTransactionList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: buildCategory(context),
    );
  }

  final List<String> optionsList = ["dia", "semana", "mes", "año"];

  Widget buildCategory(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Container(
          alignment: Alignment.topLeft,
          child: Text(
            "Frecuencia de gasto",
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          color: Colors.red,
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: optionsList.length,
            ),
            itemCount: optionsList.length,
            itemBuilder: (context, index) {
              final option = optionsList[index];
              return Text(option);
            },
          ),
        )
      ],
    );
  }
}
