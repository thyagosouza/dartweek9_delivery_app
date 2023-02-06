import 'package:dw9_delivery_app/app/models/auth_model.dart';
import 'package:dw9_delivery_app/app/models/product_model.dart';

//? RESPONSAVEL POR CENTRALIZAR TODAS AS REQUISIÇÕES DE AUTENTICAÇÃO
abstract class AuthRepository {
  //* Register é void por que não retorna nada
  //* Recebe os 3 campos
  Future<void> register(
    String name,
    String email,
    String password,
  );
  //? AuthModel serve para ter a resposta do Backend
  Future<AuthModel> login(
    String email,
    String password,
  );
}
