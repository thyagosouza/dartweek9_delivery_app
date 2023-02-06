// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:dw9_delivery_app/app/core/exceptions/repository_exceptions.dart';
import 'package:dw9_delivery_app/app/core/exceptions/unauthorized_exceptions.dart';
import 'package:dw9_delivery_app/app/core/rest_client/custom_dio.dart';
import 'package:dw9_delivery_app/app/models/auth_model.dart';

import './auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final CustomDio dio;
  AuthRepositoryImpl({
    required this.dio,
  });

  @override
  Future<AuthModel> login(String email, String password) async {
    try {
      final result = await dio.unauth().post('/auth', data: {
        'email': email,
        'password': password,
      });
      return AuthModel.fromMap(result.data);
    } on DioError catch (e) {
      throw RepositoryException(message: 'Error ao realizar login');
    }
  }

  @override
  Future<void> register(String name, String email, String password) async {
    //? /users é o post que faz o cadastro do usuario http://localhost:8080/users
    //* enviando um mapa data de chave-valor
    //? try-catch para tratar o DioError
    try {
      await dio.unauth().post('/users', data: {
        'name': name,
        'email': email,
        'password': password,
      });
    } on DioError catch (e) {
      //? SEPARAR EXCESSÕES DIRETAS SIMPLES DE ERRO DAS DE REGRA DE NEGÓCIOS
      if (e.response?.statusCode == 403) {
        throw UnauthorizedExceptions();
      }

      throw RepositoryException(message: 'Error ao registrar usuário');
    }
  }
}
