import 'package:finance/presentation/widget/button/primary_button_widget.dart';
import 'package:finance/presentation/widget/input/input_widget.dart';
import 'package:finance/presentation/widget/navigation/navigation_top_customer.dart';
import 'package:flutter/material.dart';

class AccountAddScreen extends StatefulWidget {
  const AccountAddScreen({Key? key}) : super(key: key);

  @override
  State<AccountAddScreen> createState() => _AccountAddScreenState();
}

class _AccountAddScreenState extends State<AccountAddScreen> {
  TextEditingController nameController = TextEditingController();
  bool isHeigt = false;
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1), () {
      setState(() => isHeigt = true);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 20.0, left: 15.0, right: 15.0),
              child: NavigationTopCustomer(
                  title: "Nueva cuenta", colorInvert: true),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Balance",
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(
                                color: Theme.of(context).secondaryHeaderColor),
                      ),
                      Text(
                        "\$00.0",
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                isHeigt ? buildCard() : const SizedBox.shrink(),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildCard() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      height: isHeigt ? 400 : 0,
      child: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(40.0),
            ),
            color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
          child: Column(
            children: [
              InputWidget(
                text: "Name",
                controller: nameController,
              ),
              const SizedBox(height: 20.0),
              InputWidget(
                text: "Name",
                controller: nameController,
              ),
              const SizedBox(height: 20.0),
              SizedBox(
                width: double.infinity,
                child: ButtonPrimaryWidget(
                  isSecondary: true,
                  textButton: "continue",
                  onPressed: () {},
                ),
              ),
              const SizedBox(height: 40.0)
            ],
          ),
        ),
      ),
    );
  }
}
