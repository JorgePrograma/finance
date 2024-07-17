import 'package:flutter/material.dart';

class ButtonPrimaryWidget extends StatelessWidget {
  final String textButton;
  final bool? isSecondary;
  final bool? isSmall;
  final VoidCallback onPressed;

  const ButtonPrimaryWidget({
    Key? key,
    required this.textButton,
    this.isSecondary,
    this.isSmall,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final buttonColor = _getButtonColor(context);
    final textColor = _getTextColor(context);
    final buttonWidth = isSmall == null || !isSmall! ? 343.0 : 146.0;

    return SizedBox(
      width: buttonWidth,
      height: 56.0,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        child: Text(
          textButton,
          style: Theme.of(context)
              .textTheme
              .labelMedium!
              .copyWith(color: textColor),
        ),
      ),
    );
  }

  Color _getButtonColor(BuildContext context) {
    return isSecondary == null || !isSecondary!
        ? Theme.of(context).secondaryHeaderColor
        : Theme.of(context).canvasColor;
  }

  Color _getTextColor(BuildContext context) {
    return isSecondary == null || !isSecondary!
        ? Theme.of(context).canvasColor
        : Theme.of(context).primaryColor;
  }
}
