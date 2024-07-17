import 'package:flutter/material.dart';

class InputWidget extends StatefulWidget {
  final String text;
  final bool? isObscure;
  final TextInputType? textInputType;
  final TextEditingController controller;
  final FormFieldValidator? validator;
  final bool? error;

  const InputWidget({
    Key? key,
    required this.text,
    this.isObscure,
    this.textInputType,
    required this.controller,
    this.validator,
    this.error,
  }) : super(key: key);

  @override
  State<InputWidget> createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  bool changeVisibility = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        decoration: buildDecoration(),
        style: Theme.of(context).textTheme.bodySmall,
        obscureText: widget.isObscure != null ? !changeVisibility : false,
        keyboardType: widget.textInputType,
        controller: widget.controller,
        validator: widget.validator,
        autovalidateMode: widget.error == null || widget.error == true
            ? AutovalidateMode.always
            : AutovalidateMode.disabled,
      ),
    );
  }

  void handleChangeVisibilityPass() {
    setState(() {
      changeVisibility = !changeVisibility;
    });
  }

  InputDecoration buildDecoration() {
    BorderRadius borderRadius = BorderRadius.circular(10);
    return InputDecoration(
      label: Text(
        widget.text,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      errorMaxLines: 2,
      border: OutlineInputBorder(
        borderRadius: borderRadius,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: borderRadius,
        borderSide: BorderSide(
          color: Theme.of(context).canvasColor,
          width: 2.0,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: borderRadius,
        borderSide: const BorderSide(
          color: Colors.red,
          width: 2.0,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: borderRadius,
        borderSide: BorderSide(
          color: Colors.red.withOpacity(0.3),
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: borderRadius,
        borderSide: BorderSide(
          color: Theme.of(context).canvasColor.withOpacity(0.3),
        ),
      ),
      suffixIcon: widget.isObscure != null
          ? IconButton(
              icon: Icon(
                  changeVisibility ? Icons.visibility_off : Icons.visibility),
              onPressed: handleChangeVisibilityPass,
            )
          : null,
    );
  }
}
