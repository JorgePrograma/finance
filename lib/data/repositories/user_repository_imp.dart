import 'package:finance/config/helper/error_helper.dart';
import 'package:finance/domain/datasource/user_datasource.dart';
import 'package:finance/domain/models/user.dart';
import 'package:finance/domain/repository/user_reporitory.dart';

class UserReporitoryImp extends UserRepository {
  final UserDatasource dataSource;

  UserReporitoryImp({required this.dataSource});

  @override
  Future<void> create(User user) async {
    await execute(() => dataSource.create(user));
  }

  @override
  Future<bool> delete(int id) async {
    return await execute(() => dataSource.delete(id));
  }

  @override
  Future<List<User>> getAll() async {
    return await execute(() => dataSource.getAll());
  }

  @override
  Future<User?> getById(int id) async {
    return await execute(() => dataSource.getById(id));
  }

  @override
  Future<bool> update(User user) async {
    return await execute(() => dataSource.update(user));
  }
  
}
