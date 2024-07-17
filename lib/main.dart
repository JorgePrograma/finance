import 'package:finance/get_it_setup.dart';
import 'package:finance/presentation/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  setup();

  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}
