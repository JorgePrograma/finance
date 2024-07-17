import 'package:finance/domain/datasource/user_datasource.dart';
import 'package:finance/domain/models/user.dart';
import 'package:finance/config/helper/hive_helper.dart';

class UserDataSourceLocalImpl extends UserDatasource {
  @override
  Future<void> create(User user) async {
    await HiveHelper.execute((box) async {
      await box.put(user.id, user);
    });
  }

  @override
  Future<bool> delete(int id) async {
    return await HiveHelper.execute((box) async {
      box.delete(id);
      return true;
    });
  }

  @override
  Future<List<User>> getAll() async {
    return await HiveHelper.execute((box) async {
      return box.values.toList();
    });
  }

  @override
  Future<User?> getById(int id) async {
    return await HiveHelper.execute((box) async {
      return box.get(id);
    });
  }

  @override
  Future<bool> update(User user) async {
    return await HiveHelper.execute((box) async {
      box.put(user.id, user);
      return true;
    });
  }
}
