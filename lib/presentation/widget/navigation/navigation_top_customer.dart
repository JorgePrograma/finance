import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavigationTopCustomer extends StatelessWidget {
  final String? title;
  final IconData? iconRight;
  final bool? colorInvert;
  const NavigationTopCustomer({
    Key? key,
    this.title,
    this.colorInvert,
    this.iconRight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void navigateBack() {
      context.pop();
    }

    final color = colorInvert == null || colorInvert == false
        ? Colors.black
        : Colors.white;

    return Container(
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(
              Icons.arrow_back,
              size: 32,
              color: color,
            ),
            onPressed: navigateBack,
          ),
          if (title != null)
            Text(
              title!,
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: color),
            ),
          iconRight != null
              ? Icon(
                  iconRight,
                  size: 32,
                  color: color,
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
