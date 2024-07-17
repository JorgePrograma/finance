import 'package:finance/config/constants/router_constants.dart';
import 'package:finance/presentation/widget/button/primary_button_widget.dart';
import 'package:finance/presentation/widget/input/input_digits_widget.dart';
import 'package:finance/presentation/widget/modal/loading_widget.dart';
import 'package:finance/presentation/widget/navigation/navigation_top_customer.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class VerficationScreen extends StatefulWidget {
  const VerficationScreen({Key? key}) : super(key: key);

  @override
  State<VerficationScreen> createState() => _VerficationScreenState();
}

class _VerficationScreenState extends State<VerficationScreen> {
  bool loading = false;
  final numberOneController = TextEditingController();
  final numberTwoController = TextEditingController();
  final numberThreeController = TextEditingController();
  final numberFourController = TextEditingController();
  final numberFiveController = TextEditingController();
  final numberSixController = TextEditingController();


@override
  void dispose() {
    numberOneController.dispose();
    numberTwoController.dispose();
    numberThreeController.dispose();
    numberFourController.dispose();
    numberFiveController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
              child: SingleChildScrollView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const NavigationTopCustomer(
                      title: "Verificacion",
                    ),
                    const SizedBox(height: 195),
                    Text(
                      "Ingrese su código de verificación",
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    const SizedBox(height: 29),
                    Row(
                      children: [
                        Expanded(
                            child: InputDigitsWidget(
                                controller: numberOneController)),
                        const SizedBox(width: 5),
                        Expanded(
                            child: InputDigitsWidget(
                                controller: numberTwoController)),
                        const SizedBox(width: 5),
                        Expanded(
                          child: InputDigitsWidget(
                              controller: numberThreeController),
                        ),
                        const SizedBox(width: 5),
                        Expanded(
                          child: InputDigitsWidget(
                              controller: numberFourController),
                        ),
                        const SizedBox(width: 5),
                        Expanded(
                          child: InputDigitsWidget(
                              controller: numberFiveController),
                        ),
                        const SizedBox(width: 5),
                        Expanded(
                          child: InputDigitsWidget(
                              controller: numberSixController),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    buildTimer(),
                    const SizedBox(height: 27),
                    SizedBox(
                      width: double.maxFinite,
                      child: Flexible(
                        flex: 1,
                        child: RichText(
                          maxLines: 4,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text:
                                    "Le enviamos el código de verificación al correo electrónico ",
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                              TextSpan(
                                text: "jorge*****@gmail.com ",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium!
                                    .copyWith(
                                      color: Theme.of(context).canvasColor,
                                    ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {},
                              ),
                              TextSpan(
                                  text: "Puede revisa tu correo.",
                                  style:
                                      Theme.of(context).textTheme.labelMedium),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    RichText(
                      maxLines: 2,
                      text: TextSpan(
                        text: "¿No recibí el código? Enviar de nuevo",
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(
                                color: Theme.of(context).canvasColor,
                                fontSize: 14.0),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            context.push(RouterConstants.signup);
                          },
                      ),
                    ),
                    const SizedBox(height: 46),
                    Center(
                      child: ButtonPrimaryWidget(
                        textButton: "verificar",
                        isSecondary: true,
                        onPressed: () {},
                      ),
                    ),
                    const SizedBox(height: 20.0),
                  ],
                ),
              ),
            ),
            LoadingWidget(loading: loading),
          ],
        ),
      ),
    );
  }

  Row buildTimer() {
    const minutos = 5;
    const tiempoTotalSegundos = 60 * minutos;
    return Row(
      children: [
        TweenAnimationBuilder(
          tween: Tween(begin: tiempoTotalSegundos.toDouble(), end: 0.0),
          duration: const Duration(seconds: tiempoTotalSegundos),
          builder: (_, dynamic value, child) {
            final minutosRestantes = (value ~/ 60).toString().padLeft(2, '0');
            final segundosRestantes =
                (value % 60).toInt().toString().padLeft(2, '0');
            return Text(
              "$minutosRestantes:$segundosRestantes",
              style: TextStyle(
                color: Theme.of(context).canvasColor,
              ),
            );
          },
        ),
      ],
    );
  }
}
