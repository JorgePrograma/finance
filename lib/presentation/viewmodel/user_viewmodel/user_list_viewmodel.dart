import 'package:flutter/material.dart';
import 'package:finance/domain/models/user.dart';
import 'package:finance/domain/usecase/userusecase/user_getall_usecase.dart';
import 'package:finance/config/helper/error_helper.dart';
import 'package:get_it/get_it.dart'; // Asegúrate de importar tu clase de manejo de errores


final GetIt getIt = GetIt.instance;

class UserListViewmodel with ChangeNotifier {
  
  final UserGetallUsecase userGetallUsecase;

  UserListViewmodel({required this.userGetallUsecase});

  List<User> _users = [];
  List<User> get users => _users;

  Future<void> getUsers() async {
    try {
      _users = await execute(() => userGetallUsecase.invoke());
      notifyListeners();
    } catch (e) {
      print('Error in UserListViewmodel: $e');
    }
  }
}
