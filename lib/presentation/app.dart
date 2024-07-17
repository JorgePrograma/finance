import 'package:finance/config/constants/copy_letter.dart';
import 'package:finance/config/router/router.dart';
import 'package:finance/config/theme/app_theme.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme().getTheme();

    return MaterialApp.router(
      title: CopyLetter.titleApp,
      theme: theme,
      debugShowCheckedModeBanner: false,
      routerConfig: goRouterProvider,
    );
  }
}
