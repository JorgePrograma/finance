import 'package:finance/presentation/screen/home/widgets/balance_container.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: buildTabBarBottom(),
      body: const SafeArea(
        child: Column(
          children: [
            BalanceContainer(
              total: 1000000,
              inconmeTotal: 500000,
              expensesTotal: 600000,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTabBarBottom() {
    final List<BottomNavigationBarItem> _items = [
      const BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Home',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.search),
        label: 'Se',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.compare_arrows),
        label: 'Se',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: 'Se',
      ),
    ];

    return BottomNavigationBar(items: _items);
  }
}
