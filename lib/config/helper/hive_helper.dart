import 'package:hive/hive.dart';
import 'package:finance/domain/models/user.dart';

class HiveHelper {
  static const String _boxName = "users";

  static Future<Box<User>> _openBox() async {
    try {
      return await Hive.openBox<User>(_boxName);
    } catch (e) {
      print('Error opening Hive box: $e');
      throw 'Error opening Hive box: $e';
    }
  }

  static Future<void> closeBox() async {
    try {
      await Hive.close();
    } catch (e) {
      print('Error closing Hive box: $e');
      throw 'Error closing Hive box: $e';
    }
  }

  static Future<T> execute<T>(Future<T> Function(Box<User>) action) async {
    var box = await _openBox();
    try {
      return await action(box);
    } finally {
      await box.close();
    }
  }
}
