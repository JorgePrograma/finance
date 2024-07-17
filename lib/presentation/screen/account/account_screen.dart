import 'package:finance/config/constants/router_constants.dart';
import 'package:finance/presentation/widget/button/primary_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 40),
                    Text(
                      "¡Configuremos su cuenta!",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                        "Account can be your bank, credit card or your wallet."),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40.0),
                child: ButtonPrimaryWidget(
                  textButton: "Vamos",
                  isSecondary: true,
                  onPressed: () {
                    context.push(RouterConstants.accountAdd);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
