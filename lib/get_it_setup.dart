import 'package:finance/config/helper/hive_helper.dart';
import 'package:finance/data/datasources/remote/user_datasource_remote_impl.dart';
import 'package:finance/data/repositories/user_repository_imp.dart';
import 'package:finance/domain/datasource/user_datasource.dart';
import 'package:finance/domain/repository/user_reporitory.dart';
import 'package:finance/domain/usecase/userusecase/user_getall_usecase.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void setup() {
  // repositorios
  // use cases

  // helpers
  getIt.registerSingleton<HiveHelper>(HiveHelper());
}
