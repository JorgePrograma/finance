import 'dart:async';

import 'package:finance/config/constants/image_constants.dart';
import 'package:finance/config/constants/router_constants.dart';
import 'package:finance/presentation/screen/onboarding/widget/onboarding_content_widget.dart';
import 'package:finance/presentation/widget/button/primary_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _currentPage = 0;
  late PageController _pageController;
  late Timer time;

  final List<Map<String, String>> listPageView = [
    {
      "title": "Obtén control total de tu dinero",
      "content":
          "Conviértete en tu propio administrador de dinero y haz que cada peso cuente",
      "path": ImageConstants.onboarding1
    },
    {
      "title": "Saber dónde va tu dinero",
      "content":
          "Realiza un seguimiento de tus transacciones fácilmente, con categorías e informes financieros",
      "path": ImageConstants.onboarding2
    },
    {
      "title": "Planificación a futuro",
      "content":
          "Configura tu presupuesto para cada categoría y mantente en control",
      "path": ImageConstants.onboarding3
    }
  ];


  @override
  void initState() {
    super.initState();
    _pageController = PageController();

    time = Timer.periodic(const Duration(seconds: 30), (timer) {
      if (_currentPage < listPageView.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void navigateRegister() {
    context.push(RouterConstants.signup);
  }

  void navigateLogin() {
    context.push(RouterConstants.login);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: listPageView.length,
              itemBuilder: (context, index) {
                return OnboardingContentWidget(
                  key: GlobalKey(),
                  title: listPageView[index]['title'].toString(),
                  content: listPageView[index]['content'].toString(),
                  routeImage: listPageView[index]['path'].toString(),
                );
              },
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
            ),
          ),
          buildColumnIndicated(context, _currentPage),
          const SizedBox(height: 20),
          ButtonPrimaryWidget(
            textButton: "Registrarse",
            isSecondary: true,
            onPressed: navigateRegister,
          ),
          const SizedBox(height: 20.0),
          ButtonPrimaryWidget(
            textButton: "Iniciar sesion",
            onPressed: navigateLogin,
          ),
          const SizedBox(height: 80),
        ],
      ),
    );
  }

  Widget buildColumnIndicated(BuildContext context, int currentPage) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        listPageView.length,
        (index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: buildIndicated(index == currentPage, context, index),
        ),
      ),
    );
  }

  Widget buildIndicated(bool isCurrentPage, BuildContext context, int page) {
    return InkWell(
      onTap: () {
        _pageController.animateToPage(
          page,
          duration: const Duration(milliseconds: 500),
          curve: Curves.ease,
        );
      },
      child: Container(
        height: isCurrentPage ? 15 : 10,
        width: isCurrentPage ? 15 : 10,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: isCurrentPage ? Theme.of(context).canvasColor : Colors.black12,
        ),
      ),
    );
  }
}
