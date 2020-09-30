import 'package:dolphins/entity/entity.dart';
import 'package:meta/meta.dart';


@immutable
class AddWasherState {
  final bool isRegisterError;
  final Future<List<CarWasher>> carWasher;
  final bool isRegisterLoading;
  AddWasherState({
    this.isRegisterError,
    this.carWasher,
    this.isRegisterLoading
  });

  factory AddWasherState.initial() => AddWasherState(
        isRegisterLoading: false,
        isRegisterError: false,
        carWasher: null,
      );

  AddWasherState copyWith({
    @required bool isRegisterLoading,
    @required bool isRegisterError,
    @required Future<List<CarWasher>> carWasher,
  }) {
    return AddWasherState(
      isRegisterLoading: isRegisterLoading ?? this.isRegisterLoading,
      isRegisterError: isRegisterError ?? this.isRegisterError,
      carWasher: carWasher ?? this.carWasher,
    );
  }
}
