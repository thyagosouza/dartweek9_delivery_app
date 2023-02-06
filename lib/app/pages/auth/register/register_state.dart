// ignore_for_file: public_member_api_docs, sort_constructors_first
//? Status que passará o controlador
import 'package:match/match.dart';

part 'register_state.g.dart';

@match //? geração do pathern match
enum RegisterStatus {
  initial,
  register,
  success,
  error,
}

class RegisterState {
  final RegisterStatus status;
  RegisterState({
    required this.status,
  });
  const RegisterState.initial() : status = RegisterStatus.initial;

  //? COPYWITH NECESSARIO PARA TROCA DE ESTADO
  RegisterState copyWith({
    RegisterStatus? status,
  }) {
    return RegisterState(
      status: status ?? this.status,
    );
  }
}
