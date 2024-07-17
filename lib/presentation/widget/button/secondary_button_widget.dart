import 'package:flutter/material.dart';

class ButtonSecondaryWidget extends StatelessWidget {
  final String textButton;
  final VoidCallback onPressed;

  const ButtonSecondaryWidget({
    Key? key,
    required this.textButton,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textColor = Theme.of(context).canvasColor;

    return SizedBox(
      width: 343.0,
      height: 56.0,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          side: BorderSide(color: Theme.of(context).canvasColor, width: 2.0),
        ),
        icon: const Icon(Icons.golf_course),
        label: Text(
          textButton,
          style: Theme.of(context)
              .textTheme
              .labelMedium!
              .copyWith(color: textColor),
        ),
      ),
    );
  }
}
