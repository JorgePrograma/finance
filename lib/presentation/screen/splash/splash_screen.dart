import 'package:finance/config/constants/copy_letter.dart';
import 'package:finance/config/constants/router_constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool status = true;
  @override
  void initState() {
    super.initState();
    verifyStateApp();
  }

  void verifyStateApp() async {
    Future.delayed(const Duration(seconds: 3), () {
      if (status) {
        context.go(RouterConstants.home);
      } else {
        context.go(RouterConstants.oboarding);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      body: Center(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 35, top: 10),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.red.shade200.withOpacity(0.1),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.redAccent.shade100.withOpacity(0.5),
                      spreadRadius: 10,
                      blurRadius: 20,
                    )
                  ],
                ),
                height: 60,
                width: 60,
              ),
            ),
            Positioned(
              child: Text(
                CopyLetter.titleApp,
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
