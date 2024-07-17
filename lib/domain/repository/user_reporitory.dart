import 'package:finance/domain/models/user.dart';

abstract class UserRepository {
  Future<void> create(User user);
  Future<List<User>> getAll();
  Future<User?> getById(int id);
  Future<bool> update(User user);
  Future<bool> delete(int id);
}
