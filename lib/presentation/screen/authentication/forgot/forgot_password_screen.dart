import 'dart:async';

import 'package:confetti/confetti.dart';
import 'package:finance/config/validate_inputs/validate_inputs.dart';
import 'package:finance/presentation/widget/button/primary_button_widget.dart';
import 'package:finance/presentation/widget/input/input_widget.dart';
import 'package:finance/presentation/widget/modal/loading_widget.dart';
import 'package:finance/presentation/widget/navigation/navigation_top_customer.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final confettiController = ConfettiController();
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

        String email = emailController.text;
        String password = passwordController.text;
        confettiController.play();
        print("Imprimiendo \n$email, $password,");
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
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
              child: SingleChildScrollView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                scrollDirection: Axis.vertical,
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const NavigationTopCustomer(
                        title: "Recuperar contraseña",
                      ),
                      const SizedBox(height: 56),
                      Text(
                        "Don’t worry.\nEnter your email and we’ll send you a link to reset your password.",
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      const SizedBox(height: 25),
                      InputWidget(
                        text: "Correo",
                        error: statusError,
                        textInputType: TextInputType.emailAddress,
                        controller: emailController,
                        validator: (value) {
                          return ValidateInputs.validateEmail(value!);
                        },
                      ),
                      const SizedBox(height: 27),
                      ButtonPrimaryWidget(
                        textButton: "Aceptar",
                        isSecondary: true,
                        onPressed: handleSubmit,
                      ),
                      const SizedBox(height: 20.0),
                    ],
                  ),
                ),
              ),
            ),
            LoadingWidget(loading: loading),
          ],
        ),
      ),
    );
  }
}
