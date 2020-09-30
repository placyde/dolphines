import 'package:dolphins/entity/entity.dart';
import 'package:meta/meta.dart';


@immutable
class RegisterState {
  final bool isRegisterError;
  final User user;
  final bool isRegisterLoading;
  RegisterState({
    this.isRegisterError,
    this.user,
    this.isRegisterLoading
  });

  factory RegisterState.initial() => RegisterState(
        isRegisterLoading: false,
        isRegisterError: false,
        user: null,
      );

  RegisterState copyWith({
    @required bool isRegisterLoading,
    @required bool isRegisterError,
    @required User user,
  }) {
    return RegisterState(
      isRegisterLoading: isRegisterLoading ?? this.isRegisterLoading,
      isRegisterError: isRegisterError ?? this.isRegisterError,
      user: user ?? this.user,
    );
  }
}
