import 'dart:async';

import 'package:finance/config/constants/router_constants.dart';
import 'package:finance/config/validate_inputs/validate_inputs.dart';
import 'package:finance/presentation/widget/button/primary_button_widget.dart';
import 'package:finance/presentation/widget/button/secondary_button_widget.dart';
import 'package:finance/presentation/widget/input/input_widget.dart';
import 'package:finance/presentation/widget/modal/loading_widget.dart';
import 'package:finance/presentation/widget/navigation/navigation_top_customer.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:confetti/confetti.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final confettiController = ConfettiController();
  bool isTerms = false;
  bool statusError = false;
  bool loading = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  handleSubmit() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        loading = true;
      });
      try {
        await Future.delayed(const Duration(seconds: 3));

        String name = nameController.text;
        String email = emailController.text;
        String password = passwordController.text;
        bool terminos = isTerms;
        String accepto = terminos ? "Acepto" : "No Acepto";
        confettiController.play();
        print("Imprimiendo \n$name, $email, $password, $accepto");
      } catch (e) {
      } finally {
        setState(() {
          loading = false;
        });
      }
      await Future.delayed(const Duration(seconds: 3));
      confettiController.stop();
    } else {
      setState(() {
        statusError = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            const NavigationTopCustomer(title: "Registrarse"),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
              child: Center(
                child: SingleChildScrollView(
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  scrollDirection: Axis.vertical,
                  child: buildForm(context),
                ),
              ),
            ),
            LoadingWidget(loading: loading),
          ],
        ),
      ),
    );
  }

  Widget buildForm(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const SizedBox(height: 56),
          InputWidget(
            text: "Nombre",
            textInputType: TextInputType.name,
            controller: nameController,
            error: statusError,
            validator: (value) {
              return ValidateInputs.validateIsEmpty(value!);
            },
          ),
          const SizedBox(height: 24),
          InputWidget(
            text: "Correo",
            error: statusError,
            textInputType: TextInputType.emailAddress,
            controller: emailController,
            validator: (value) {
              return ValidateInputs.validateEmail(value!);
            },
          ),
          const SizedBox(height: 24),
          InputWidget(
            text: "Constraseña",
            isObscure: false,
            controller: passwordController,
            error: statusError,
            validator: (value) {
              return ValidateInputs.validatePassword(value!);
            },
          ),
          const SizedBox(height: 17),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Checkbox(
                value: isTerms,
                onChanged: (value) {
                  setState(() {
                    isTerms = !isTerms;
                  });
                },
              ),
              Flexible(
                flex: 1,
                child: RichText(
                  maxLines: 2,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Al registrarte, aceptas los ",
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(fontSize: 14.0),
                      ),
                      TextSpan(
                        text: "Términos de Servicio y Política de Privacidad",
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(
                                color: Theme.of(context).canvasColor,
                                fontSize: 14.0),
                        recognizer: TapGestureRecognizer()..onTap = () {},
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 27),
          ButtonPrimaryWidget(
            textButton: "Aceptar",
            isSecondary: true,
            onPressed: handleSubmit,
          ),
          const SizedBox(height: 12.0),
          ButtonSecondaryWidget(
            textButton: "Registrate con Google",
            onPressed: () {},
          ),
          const SizedBox(height: 20.0),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: RichText(
                  maxLines: 2,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "¿Ya tienes una cuenta?",
                        style:
                            Theme.of(context).textTheme.labelMedium!.copyWith(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.normal,
                                ),
                      ),
                      TextSpan(
                        text: " login",
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(
                                color: Theme.of(context).canvasColor,
                                fontSize: 14.0),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            context.push(RouterConstants.login);
                          },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
