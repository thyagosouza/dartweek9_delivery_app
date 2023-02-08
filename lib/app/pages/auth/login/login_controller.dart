import 'package:dw9_delivery_app/app/core/exceptions/unauthorized_exceptions.dart';
import 'package:dw9_delivery_app/app/pages/auth/login/login_state.dart';
import 'package:dw9_delivery_app/app/repositories/auth/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends Cubit<LoginState> {
  final AuthRepository _authRepository;

  //? CONSTRUTOR PASSA ESTADO INICIAL
  LoginController(this._authRepository) : super(const LoginState.initial());

  //? QUANDO FIZER O LOGIN.. SIGA
  Future<void> login(String email, String password) async {
    try {
      emit(state.copyWith(status: LoginStatus.login));
      //? recebe authmodel
      final authModel = await _authRepository.login(email, password);
      //? se der tudo certo, buscar o SharedPreferences para guardar o token resgatado
      //? para informar ao sistema que o usuário está logado
      final sp = await SharedPreferences.getInstance();
      //? GUARDA A STRING COM SHAREDPREFERENCES - MESMO SETADO NO SHOPPINGBAG
      sp.setString('accessToken', authModel.accessToken);

      //? Refresh token será usado na aula extra
      //* REFRESH TOKEN TEM A DURAÇÃO DE 7 DIAS
      sp.setString('refreshToken', authModel.refreshToken);

      emit(state.copyWith(status: LoginStatus.success));
    } on UnauthorizedExceptions catch (e) {
      //? VERFICAR SE DIGITIOU LOGIN E SENHA INVÁLIDO
      emit(state.copyWith(
          status: LoginStatus.loginError,
          errorMessage: 'Login e senha inválidos'));
    } catch (e) {
      emit(state.copyWith(
          status: LoginStatus.error, errorMessage: 'Erro ao realizar login'));
    }
  }
}
