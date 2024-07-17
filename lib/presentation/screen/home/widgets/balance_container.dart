import 'package:finance/presentation/screen/home/widgets/card_transaction_by_type.dart';
import 'package:flutter/material.dart';

class BalanceContainer extends StatelessWidget {
  final double total;
  final double inconmeTotal;
  final double expensesTotal;

  const BalanceContainer({
    Key? key,
    required this.total,
    required this.inconmeTotal,
    required this.expensesTotal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 50),
        const Text("Fondos de la cuenta", style: TextStyle(fontSize: 20.0)),
        const SizedBox(height: 5),
        Text(
          "\$1000000",
          style: Theme.of(context)
              .textTheme
              .headlineLarge!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Flex(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            direction: Axis.horizontal,
            children: [
        /*      CardTransactionByType(
                type: TransaccionType.iconme,
                price: inconmeTotal,
              ),
              const SizedBox(width: 10),
              CardTransactionByType(
                type: TransaccionType.expenses,
                price: expensesTotal,
              ),*/
            ],
          ),
        ),
      ],
    );
  }
}
