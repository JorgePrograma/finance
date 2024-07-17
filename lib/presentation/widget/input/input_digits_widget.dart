import 'package:flutter/material.dart';

class InputDigitsWidget extends StatefulWidget {
  final TextEditingController? controller;

  const InputDigitsWidget({
    super.key,
    this.controller,
  });

  @override
  State<InputDigitsWidget> createState() => _InputDigitsWidgetState();
}

class _InputDigitsWidgetState extends State<InputDigitsWidget> {
  bool isVisiblePass = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,
      maxLength: 1,
      style: Theme.of(context).textTheme.bodyLarge,
      decoration: _buildInputDecoration(context).copyWith(counterText: ''),
    );
  }

  InputDecoration _buildInputDecoration(BuildContext context) {
    return InputDecoration(
      enabledBorder: _buildOutlineInputBorder(context),
      focusedBorder: _buildOutlineInputBorder(context).copyWith(
        borderSide: BorderSide(
          color: Theme.of(context).primaryColor,
          width: 2.0,
        ),
      ),
      errorBorder: _buildOutlineInputBorder(context).copyWith(
        borderSide: BorderSide(color: Theme.of(context).colorScheme.error),
      ),
      focusedErrorBorder: _buildOutlineInputBorder(context).copyWith(
        borderSide: BorderSide(
          color: Theme.of(context).colorScheme.error,
          width: 2.0,
        ),
      ),
      focusColor: Theme.of(context).canvasColor.withOpacity(0.3),
    );
  }

  OutlineInputBorder _buildOutlineInputBorder(BuildContext context) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: BorderSide(
        color: Theme.of(context).primaryColorLight,
      ),
    );
  }

  void handleChangeVisibilityPass() {
    setState(() {
      isVisiblePass = !isVisiblePass;
    });
  }
}
