import 'dart:async';

import 'package:confetti/confetti.dart';
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

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final confettiController = ConfettiController();
  bool statusError = false;
  bool loading = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confettiController.dispose();
    super.dispose();
  }

  void handleSubmit() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        loading = true;
      });
      try {
        await Future.delayed(const Duration(seconds: 3));
        String email = emailController.text;
        String password = passwordController.text;
        print("Imprimiendo los datos del usuario $password $email");
        confettiController.play();
      } catch (error) {
        Future.microtask(() {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Login failed: ${error.toString()}'),
            ),
          );
        });
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
            const NavigationTopCustomer(
              title: "Inicio sesion",
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                top: 20,
              ),
              child: Center(
                child: SingleChildScrollView(
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
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 56),
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
          const SizedBox(height: 27),
          ButtonPrimaryWidget(
            textButton: "Aceptar",
            isSecondary: true,
            onPressed: handleSubmit,
          ),
          const SizedBox(height: 20.0),
          ButtonSecondaryWidget(
            textButton: "Recuperar contraseña",
            onPressed: () {
              context.push(RouterConstants.forgot);
            },
          ),
          const SizedBox(height: 40.0),
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
                        text: "No tienes una cuenta? ",
                        style:
                            Theme.of(context).textTheme.labelMedium!.copyWith(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.normal,
                                ),
                      ),
                      TextSpan(
                        text: "Registrarse",
                        style:
                            Theme.of(context).textTheme.labelMedium!.copyWith(
                                  color: Theme.of(context).canvasColor,
                                  fontSize: 14.0,
                                ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            context.push(RouterConstants.signup);
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
