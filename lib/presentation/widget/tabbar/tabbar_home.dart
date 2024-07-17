import 'package:finance/config/constants/router_constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TabbarHome extends StatelessWidget {
  final GoRouter goRouter;

  const TabbarHome({
    Key? key,
    required this.goRouter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home)),
          BottomNavigationBarItem(icon: Icon(Icons.search)),
          BottomNavigationBarItem(icon: Icon(Icons.compare_arrows)),
          BottomNavigationBarItem(icon: Icon(Icons.person)),
        ],
        onTap: (index) {
          switch (index) {
            case 0:
              goRouter.go(RouterConstants.home);
              break;
            case 1:
              goRouter.go(RouterConstants.home);
              break;
            case 2:
              goRouter.go(RouterConstants.home);
              break;
            case 3:
              goRouter.go(RouterConstants.home);
              break;
          }
        },
      ),
    );
  }
}
