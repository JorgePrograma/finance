import 'package:flutter/material.dart';

class LoadingWidget extends StatefulWidget {
  final bool loading;

  const LoadingWidget({
    Key? key,
    required this.loading,
  }) : super(key: key);

  @override
  State<LoadingWidget> createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget>
    with SingleTickerProviderStateMixin {
  final String textLoading = "cargando";
  late AnimationController animationController;
  late List<Animation<Offset>> animations;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    animations = List.generate(
      textLoading.length,
      (index) {
        return Tween(
          begin: const Offset(0, 0),
          end: const Offset(0, 50),
        ).animate(
          CurvedAnimation(
            parent: animationController,
            curve: Interval((index / textLoading.length) * 0.50,
                ((index + 1) / textLoading.length) * 0.5),
          ),
        );
      },
    );

    animationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) {
        return Visibility(
          visible: widget.loading,
          child: Dialog.fullscreen(
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  AnimatedBuilder(
                    animation: animationController,
                    builder: (context, child) {
                      return Transform.translate(
                        offset: Offset(0, animationController.value * 40),
                        child: const AnimatedSwitcher(
                          duration: Duration(seconds: 1),
                          child: Icon(
                            Icons.rocket_launch,
                            size: 200,
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 40),
                  Text(
                    "Espere ...",
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge!
                        .copyWith(color: Theme.of(context).canvasColor),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
