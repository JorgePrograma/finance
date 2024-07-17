import 'dart:async';

import 'package:confetti/confetti.dart';
import 'package:finance/config/validate_inputs/validate_inputs.dart';
import 'package:finance/presentation/widget/button/primary_button_widget.dart';
import 'package:finance/presentation/widget/input/input_widget.dart';
import 'package:finance/presentation/widget/modal/loading_widget.dart';
import 'package:finance/presentation/widget/navigation/navigation_top_customer.dart';
import 'package:flutter/material.dart';

class ResetScreen extends StatefulWidget {
  const ResetScreen({Key? key}) : super(key: key);

  @override
  State<ResetScreen> createState() => _ResetScreenState();
}

class _ResetScreenState extends State<ResetScreen> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordControllerConfirmation =
      TextEditingController();
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

        String password = passwordController.text;
        String passwordConfirmation = passwordControllerConfirmation.text;
        confettiController.play();
        print("Imprimiendo \n$passwordConfirmation, $password,");
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
                        title: "Cambiar contraseña",
                      ),
                      const SizedBox(height: 56),
                      InputWidget(
                        text: "Contraseña",
                        error: statusError,
                        textInputType: TextInputType.emailAddress,
                        controller: passwordController,
                        validator: (value) {
                          return ValidateInputs.validatePassword(value!);
                        },
                      ),
                      const SizedBox(height: 24),
                      InputWidget(
                        text: "Repite la contraseña",
                        isObscure: false,
                        controller: passwordControllerConfirmation,
                        error: statusError,
                        validator: (value) {
                          return ValidateInputs.validateConfirmation(
                            value!,
                            passwordController.text,
                          );
                        },
                      ),
                      const SizedBox(height: 27),
                      ButtonPrimaryWidget(
                        textButton: "Aceptar",
                        isSecondary: true,
                        onPressed: handleSubmit,
                      ),
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
