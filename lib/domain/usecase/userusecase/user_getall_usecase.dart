import 'package:finance/config/helper/error_helper.dart';
import 'package:finance/domain/models/user.dart';
import 'package:finance/domain/repository/user_reporitory.dart';

class UserGetallUsecase {
  final UserRepository userRepository;

  UserGetallUsecase({required this.userRepository});

  Future<List<User>> invoke() async {
    return execute(() => userRepository.getAll());
  }
}
